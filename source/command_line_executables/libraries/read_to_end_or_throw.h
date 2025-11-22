#ifndef READ_TO_END_OR_THROW_H

#define READ_TO_END_OR_THROW_H

#include <stdio.h>

/**
 * Reads a file to its end, halting execution with an error message should the operation fail.
 * @param file The file to read the byte from.
 * @param content Pointed to the content of the file.
 * @param size Set to the size of the content in bytes.
 */
void read_to_end_or_throw(FILE *const file, const unsigned char **const content, size_t *const size);

#endif
