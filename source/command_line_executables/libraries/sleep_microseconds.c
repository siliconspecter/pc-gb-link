#include "sleep_microseconds.h"

#ifdef __MINGW32__
#include <windows.h>

void sleep_microseconds(const unsigned int microseconds)
{
  Sleep(microseconds / 1000);
}
#else
#include <sys/select.h>
#include <stddef.h>
#include <errno.h>
#include "throw.h"

void sleep_microseconds(const unsigned int microseconds)
{
  while (1)
  {
    struct timeval interval;
    interval.tv_sec = microseconds / 1000000;
    interval.tv_usec = microseconds % 1000000;

    switch (select(0, NULL, NULL, NULL, &interval))
    {
    case 0:
      return;

    case -1:
      if (errno != EINTR)
      {
        throw("Failed to sleep (error number %d).", errno);
      }
      break;

    default:
      throw("Unexpected result of select(...).");
    }
  }
}
#endif
