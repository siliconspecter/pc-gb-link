#ifndef WRITE_BYTE_OR_THROW_H

#define WRITE_BYTE_OR_THROW_H

#include <stdio.h>

/**
 * Writes a byte to a file, halting execution with an error message should the operation fail.
 * @param byte The byte to write to a file.
 * @param file The file to write the byte to.
 */
void write_byte_or_throw(const unsigned char byte, FILE *const file);

#endif
