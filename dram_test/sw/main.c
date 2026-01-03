// Greg Stitt
// University of Florida
// Simplified DRAM Test - Microblaze Baremetal
// main.cpp

#include "main.h"

// Global base pointer for hardware access
static volatile unsigned int *hwBase = (volatile unsigned int *)AXI_MMAP_ADDR;

// ============================================================================
// Hardware Access Functions
// ============================================================================

void hwWrite(unsigned int addr, unsigned int value) {
  hwBase[addr] = value;
}

unsigned int hwRead(unsigned int addr) {
  return hwBase[addr];
}

void hwWriteArray(unsigned int addr, unsigned int *data, unsigned int words) {
  for (unsigned int i = 0; i < words; i++) {
    hwBase[addr + i] = data[i];
  }
}

void hwReadArray(unsigned int addr, unsigned int *data, unsigned int words) {
  for (unsigned int i = 0; i < words; i++) {
    data[i] = hwBase[addr + i];
  }
}

// ============================================================================
// Timer Functions
// ============================================================================

// double getTimeSeconds() {
//   XTime time;
//   XilTimer_GetTime(&time);
//   return (double)time / (double)XPAR_CPU_CORE_CLOCK_FREQ_HZ;
// }

// ============================================================================
// Test Functions
// ============================================================================

// bool waitForDone(float timeout) {
//   double startTime = getTimeSeconds();
//   unsigned int value = 0;
  
//   while (!value && (getTimeSeconds() - startTime) < timeout) {
//     value = hwRead(DONE_ADDR);
//   }
  
//   if (value == 0) {
//     xil_printf("ERROR: Timeout - Done signal not asserted\r\n");
//     return false;
//   }
  
//   return true;
// }

bool waitForDone() {
  xil_printf("Waiting for DONE\r\n");
  unsigned int value = 0;
  while (value == 0) {
    value = hwRead(DONE_ADDR);
  }

  xil_printf("DONE Detected\r\n");
  
  return true;
}

void printDmaDebugInfo() {
  xil_printf("DMA Debug Info:\r\n");
  xil_printf("  Count = %u\r\n", hwRead(DMA_RD_COUNT_ADDR));
  xil_printf("  Start Addr = %u\r\n", hwRead(DMA_RD_START_ADDR_ADDR));
  xil_printf("  DMA Addr = %u\r\n", hwRead(DMA_RD_ADDR_ADDR));
  xil_printf("  DMA Size = %u\r\n", hwRead(DMA_RD_SIZE_ADDR));
  xil_printf("  Prog Full = %u\r\n", hwRead(DMA_RD_PROG_FULL_ADDR));
  xil_printf("  DMA Empty = %u\r\n", hwRead(DMA_RD_EMPTY_ADDR));
}

bool runDramTest(unsigned int size, unsigned int addr) {
  // Verify test bounds
  if (size / 2 + addr > RAM_WORDS) {
    xil_printf("ERROR: Test size exceeds RAM bounds\r\n");
    return false;
  }

  // Allocate memory
  unsigned int *input = (unsigned int *)malloc(RAM_WORDS * sizeof(unsigned int));
  unsigned int *output = (unsigned int *)malloc(RAM_WORDS * sizeof(unsigned int));
  
  if (input == NULL || output == NULL) {
    xil_printf("ERROR: Memory allocation failed\r\n");
    if (input) free(input);
    if (output) free(output);
    return false;
  }

  // Initialize arrays
  for (unsigned int i = 0; i < RAM_WORDS; i++) {
    input[i] = rand();
    output[i] = 0;
  }

  // Disable user mode
  hwWrite(MODE_ADDR, 0);

  // Transfer inputs to FPGA
  hwWriteArray(MEM_IN_ADDR, input, RAM_WORDS);

  // Enable user mode
  hwWrite(MODE_ADDR, 1);

  // Configure test parameters
  hwWrite(SIZE_ADDR, size);
  hwWrite(RAM0_ADDR_ADDR, addr);
  hwWrite(RAM1_ADDR_ADDR, 0);

  // Start the test
  hwWrite(GO_ADDR, 1);

  // Wait for completion
  if (!waitForDone()) {
    printDmaDebugInfo();
    free(input);
    free(output);
    return false;
  }

  // Disable user mode
  hwWrite(MODE_ADDR, 0);

  // Read results
  unsigned int readWords = size / 2 + size % 2;
  hwReadArray(MEM_OUT_ADDR, output, readWords);

  // Verify results
  bool success = true;
  for (unsigned int i = 0; i < readWords; i++) {
    if (input[i + addr] != output[i]) {
      xil_printf("ERROR: Mismatch at index %u: expected %u, got %u\r\n", 
                 i, input[i + addr], output[i]);
      success = false;
      break;  // Only report first error
    }
  }

  free(input);
  free(output);
  return success;
}

// ============================================================================
// Main Function
// ============================================================================

int main(void) {
  xil_printf("\r\n");
  xil_printf("========================================\r\n");
  xil_printf("  DRAM Test - Microblaze Baremetal\r\n");
  xil_printf("========================================\r\n");
  xil_printf("Hardware Base Address: 0x%08X\r\n", AXI_MMAP_ADDR);
  xil_printf("RAM Size: %u words\r\n", RAM_WORDS);
  xil_printf("Max Transfer Size: %u\r\n\r\n", MAX_SIZE);

  // ========================================
  // Test 1: Square sizes from address 0
  // ========================================
  xil_printf("Test 1: Transfers from address 0\r\n");
  
  for (unsigned int i = 1; i * i <= MAX_SIZE; i++) {
    unsigned int size = i * i;
    xil_printf("  Testing size %u...\r", size);
    
    if (!runDramTest(size, 0)) {
      xil_printf("\r\nFAILED at size %u\r\n", size);
      return -1;
    }
  }
  
  xil_printf("\r\n  SUCCESS\r\n\r\n");

  // ========================================
  // Test 2: Maximum transfer size
  // ========================================
  xil_printf("Test 2: Maximum transfer size\r\n");
  xil_printf("  Testing size %u...", MAX_SIZE);
  
  if (!runDramTest(MAX_SIZE, 0)) {
    xil_printf("FAILED\r\n");
    return -1;
  }
  
  xil_printf("SUCCESS\r\n\r\n");

  // ========================================
  // Test 3: Random sizes and addresses
  // ========================================
  xil_printf("Test 3: Random sizes and addresses\r\n");
  
  for (unsigned int i = 0; i < NUM_RAND_TESTS; i++) {
    unsigned int size = (rand() % MAX_SIZE) + 1;
    unsigned int addr = rand() % RAM_WORDS;

    // Cap size to prevent overflow
    if (size / 2 + size % 2 + addr > RAM_WORDS) {
      size = (RAM_WORDS - addr) * 2;
    }

    if ((i + 1) % 50 == 0) {
      xil_printf("  Completed %u/%u tests...\r\n", i + 1, NUM_RAND_TESTS);
    }

    if (!runDramTest(size, addr)) {
      xil_printf("\r\nFAILED at test %u (size=%u, addr=%u)\r\n", 
                 i + 1, size, addr);
      return -1;
    }
  }
  
  xil_printf("  SUCCESS\r\n\r\n");

  // ========================================
  // All tests passed
  // ========================================
  xil_printf("========================================\r\n");
  xil_printf("  ALL TESTS PASSED\r\n");
  xil_printf("========================================\r\n");

  return 0;
}