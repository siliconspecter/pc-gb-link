#include <stdio.h>
#include "read_byte_eof_or_throw.h"
#include "throw.h"

int read_byte_eof_or_throw(FILE *const file)
{
  const int output = fgetc(file);

  if (output == EOF)
  {
    const int error = ferror(file);

    if (error)
    {
      throw("Failed to read a byte (error number %d).", error);
    }
  }

  return output;
}
