#include "sleep_microseconds.h"
#include <stddef.h>
#include <sys/select.h>

void sleep_microseconds(const unsigned int microseconds)
{
  struct timeval interval;
  interval.tv_sec = microseconds / 1000000;
  interval.tv_usec = microseconds % 1000000;
  select(0, NULL, NULL, NULL, &interval);
}
