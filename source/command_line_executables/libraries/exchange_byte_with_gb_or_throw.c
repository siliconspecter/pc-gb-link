#include <stdlib.h>
#include <libftdi1/ftdi.h>
#include "exchange_byte_with_gb_or_throw.h"
#include "sleep_microseconds.h"
#include "throw.h"

static struct ftdi_context *ftdi = NULL;

static unsigned char mpsse_initialization_commands[] = {
    0x8a, /* Disable /5 divider (60MHz clock). */
    0x97, /* Disable adaptive clocking. */
    0x8d, /* Disable 3-phase data clocking. */

    0x86, /* Set clock divider. */
    0xc0, /* 60MHz / 960 / 2 = 62.5KHz. */
    0x03,

    0x85, /* Disconnects a loopback of some sort. */

    0x80, /* Configure ADBUS: */
    0x00, /* Specify polarity (drive low). */
    0x03, /* Clock and TX as output, all others as input. */

    0x31,       /* Sending bytes, most significant bit first, reading on clock +, writing on clock -. */
    0x00, 0x00, /* 1 byte will be sent.*/
    0x00,       /* This will be replaced with the byte being sent. */
    0x87 /* Flush.*/};

unsigned char exchange_byte_with_gb_or_throw(const unsigned char byte)
{
  unsigned long emitted = 0;
  unsigned char output;
  mpsse_initialization_commands[13] = byte;

  if (ftdi == NULL)
  {
    ftdi = ftdi_new();

    if (ftdi == NULL)
    {
      throw("Failed to initialize FTDI.");
    }

    if (ftdi_usb_open_desc(ftdi, 0x0403, 0x6014, NULL, NULL))
    {
      throw("Failed to find any compatible devices.");
    }

    if (ftdi_usb_reset(ftdi))
    {
      throw("Failed to reset the FT232H.");
    }

    if (ftdi_set_interface(ftdi, INTERFACE_A))
    {
      throw("Failed to set the FT232H interface.");
    }

    if (ftdi_set_bitmode(ftdi, 0x00, BITMODE_RESET))
    {
      throw("Failed to reset the FT232H bitmode.");
    }

    if (ftdi_set_bitmode(ftdi, 0x00, BITMODE_MPSSE))
    {
      throw("Failed to enable FT232H MPSSE.");
    }

    if (ftdi_write_data(ftdi, mpsse_initialization_commands, sizeof(mpsse_initialization_commands)) != sizeof(mpsse_initialization_commands))
    {
      throw("Failed to initialize FT232H MPSSE and write data");
    }
  }
  else
  {
    if (ftdi_write_data(ftdi, mpsse_initialization_commands + 10, sizeof(mpsse_initialization_commands) - 10) != sizeof(mpsse_initialization_commands) - 10)
    {
      throw("Failed to write data to the FT232H.");
    }
  }

  while (emitted < sizeof(output))
  {
    const int read = ftdi_read_data(ftdi, &output + emitted, sizeof(output) - emitted);

    if (!read)
    {
      sleep_microseconds(500);
    }
    else if (read < 0)
    {
      throw("Failed to read data from the FT232H.");
    }
    else
    {
      emitted += read;
    }
  }

  if (emitted > sizeof(output))
  {
    throw("Read more bytes than expected from the FT232H.");
  }

  return output;
}
