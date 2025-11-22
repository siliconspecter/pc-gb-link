#ifndef SLEEP_MICROSECONDS_H

#define SLEEP_MICROSECONDS_H

/**
 * Call to pause the calling thread for at least a given number of microseconds.
 * @param microseconds The number of microseconds for which to pause the calling thread.
 */
void sleep_microseconds(const unsigned int microseconds);

#endif
