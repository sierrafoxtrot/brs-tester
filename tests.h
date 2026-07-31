/*
 * BRS-tester by Anders Sandahl 2023-2024
 *
 * License GPL 2.0
 *
 */

#ifndef TESTS_H
#define TESTS_H

#include "vector.h"

/* ANSI/VT100 terminal escape sequences for coloured console output. */
#define TERM_RESET        "\x1b[0m"
#define TERM_RED          "\x1b[31m"
#define TERM_GREEN        "\x1b[32m"
#define TERM_YELLOW       "\x1b[33m"
#define TERM_BLUE         "\x1b[34m"
#define TERM_MAGENTA      "\x1b[35m"
#define TERM_CYAN         "\x1b[36m"
#define TERM_WHITE        "\x1b[37m"
#define TERM_BOLD         "\x1b[1m"
#define TERM_UNDERLINE    "\x1b[4m"


/*
 * Do a electrical test of the tester itself
 */
int tests_selfTest(void);
int tests_setupBoard(struct config const *b_cfg);
int tests_checkVoltages(struct config const *b_cfg);
int tests_checkPullDown(struct config const *b_cfg);
int tests_checkLogic(struct config const *b_cfg, char *vector, int line_number, bool singleStep);
int tests_checkDriveStrength(struct config const *b_cfg, char *vector, int line_number, bool singleStep);
int tests_checkInputs(struct config const *b_cfg);

#endif /* TESTS_H */
