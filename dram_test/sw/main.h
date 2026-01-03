// Greg Stitt
// University of Florida
// Simplified DRAM Test - Microblaze Baremetal
// main.h

#ifndef _MAIN_H_
#define _MAIN_H_

#include <stdio.h>
#include "xil_printf.h"
#include "xil_io.h"
#include "xuartlite.h"
#include <stdlib.h>
#include <stdbool.h>
//#include "xiltimer.h"


// ============================================================================
// Hardware Configuration - ADJUST THESE TO MATCH YOUR VIVADO DESIGN
// ============================================================================

// Base address for memory-mapped peripherals (from Vivado Address Editor)
#define AXI_MMAP_ADDR 0x44A00000

// Memory map dimensions
#define MMAP_ADDR_WIDTH 18
#define ADDR_WIDTH 15
#define RAM_WORDS (1 << ADDR_WIDTH)  // 32768 words

// ============================================================================
// Register Addresses
// ============================================================================

#define MODE_ADDR ((1 << MMAP_ADDR_WIDTH) - 1)
#define MEM_IN_ADDR 0
#define MEM_OUT_ADDR 0
#define GO_ADDR 1
#define RAM0_ADDR_ADDR 2
#define RAM1_ADDR_ADDR 3
#define SIZE_ADDR 4
#define DONE_ADDR 5

// DMA Debug Registers
#define DMA_RD_COUNT_ADDR 6
#define DMA_RD_START_ADDR_ADDR 7
#define DMA_RD_ADDR_ADDR 8
#define DMA_RD_SIZE_ADDR 9
#define DMA_RD_PROG_FULL_ADDR 10
#define DMA_RD_EMPTY_ADDR 11

// ============================================================================
// Test Configuration
// ============================================================================

#define NUM_RAND_TESTS 500
#define TIMEOUT_SECONDS 2.0

typedef unsigned int boardWord_t;
typedef unsigned short appWord_t;

#define MAX_SIZE (RAM_WORDS * sizeof(boardWord_t) / sizeof(appWord_t))

// ============================================================================
// Function Declarations
// ============================================================================

// Hardware access functions
void hwWrite(unsigned int addr, unsigned int value);
unsigned int hwRead(unsigned int addr);
void hwWriteArray(unsigned int addr, unsigned int *data, unsigned int words);
void hwReadArray(unsigned int addr, unsigned int *data, unsigned int words);

// Timer functions
double getTimeSeconds();

// Test functions
bool waitForDone();
bool runDramTest(unsigned int size, unsigned int addr);
void printDmaDebugInfo();

#endif