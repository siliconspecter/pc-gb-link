#include <stdio.h>
#include "read_to_end_or_throw.h"
#include "read_byte_eof_or_throw.h"
#include "malloc_or_throw.h"
#include "realloc_or_throw.h"

void read_to_end_or_throw(FILE *const file, const unsigned char **const content, size_t *const size)
{
  unsigned char *temp_content = NULL;
  size_t temp_size = 0;

  const int first = read_byte_eof_or_throw(file);

  if (first != EOF)
  {
    temp_content = malloc_or_throw(1);
    temp_content[0] = first;
    temp_size = 1;

    while (1)
    {
      const int subsequent = read_byte_eof_or_throw(file);

      if (subsequent == EOF)
      {
        break;
      }
      else
      {
        temp_content = realloc_or_throw(temp_content, temp_size + 1);
        temp_content[temp_size] = subsequent;
        temp_size++;
      }
    }
  }

  *content = temp_content;
  *size = temp_size;
}
