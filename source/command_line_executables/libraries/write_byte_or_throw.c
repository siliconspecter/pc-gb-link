#include <stdio.h>
#include "write_byte_or_throw.h"
#include "throw.h"

void write_byte_or_throw(const unsigned char byte, FILE *const file)
{
  if (fputc(byte, file) == EOF)
  {
    const int error = ferror(file);

    if (error)
    {
      throw("Failed to write a byte (error number %d).", error);
    }
    else
    {
      throw("File being written to closed unexpectedly.");
    }
  }
}
