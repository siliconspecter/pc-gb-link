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

void sleep_microseconds(const unsigned int microseconds)
{
  struct timeval interval;
  interval.tv_sec = microseconds / 1000000;
  interval.tv_usec = microseconds % 1000000;
  select(0, NULL, NULL, NULL, &interval);
}
#endif
