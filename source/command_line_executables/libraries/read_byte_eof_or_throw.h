#ifndef READ_BYTE_EOF_OR_THROW_H

#define READ_BYTE_EOF_OR_THROW_H

#include <stdio.h>

/**
 * Reads a byte from a file, halting execution with an error message should the operation fail.
 * @param file The file to read the byte from.
 * @return The byte read from the file, or EOF if no more bytes are available.
 */
int read_byte_eof_or_throw(FILE *const file);

#endif
