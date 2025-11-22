#include <stdio.h>
#include "../libraries/throw.h"
#include "../libraries/reopen_as_read_only_binary_or_throw.h"
#include "../libraries/reopen_as_write_only_binary_or_throw.h"
#include "../libraries/read_byte_eof_or_throw.h"
#include "../libraries/exchange_byte_with_gb_or_throw.h"
#include "../libraries/write_byte_or_throw.h"

int main(const int argc, const char *const *const argv)
{
  (void)(argc);
  (void)(argv);

  reopen_as_read_only_binary_or_throw(stdin);
  reopen_as_write_only_binary_or_throw(stdout);

  while (1)
  {
    const int from_stdin = read_byte_eof_or_throw(stdin);

    if (from_stdin == EOF)
    {
      break;
    }
    else
    {
      write_byte_or_throw(exchange_byte_with_gb_or_throw(from_stdin), stdout);
    }
  }

  return 0;
}
