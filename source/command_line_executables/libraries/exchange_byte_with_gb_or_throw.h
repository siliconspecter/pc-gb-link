#ifndef EXCHANGE_BYTE_WITH_GB_OR_THROW_H

#define EXCHANGE_BYTE_WITH_GB_OR_THROW_H

/**
 * Exchanges a byte with the GB, halting execution with an error message should the operation fail.
 * @param byte The byte to send to the GB.
 * @return The byte received from the GB.
 */
unsigned char exchange_byte_with_gb_or_throw(const unsigned char byte);

#endif
