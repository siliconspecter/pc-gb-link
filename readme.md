# PC-GB Link

Adapter between PC and GB/GBC/GBA/GBA SP's EXT/EXT1.

## Disclaimer

I have no idea what I am doing here, in software or hardware.  This project doesn't appear to have
damaged any of my equipment but that doesn't mean that it won't damage yours, regardless of whether
these instructions are followed correctly or not.  You accept this risk by proceeding.

## Building the hardware

To make an adapter, select one of the following:

| Adapter    | IC      | Transfer method  | Pin 1 | Pin 2 | Pin 3 | Pin 4 | Pin 5 | Pin 6 |
| ---------- | ------- | ---------------- | ----- | ----- | ----- | ----- | ----- | ----- |
| CJMCU-200  | FT200XD | Bit bang (slow). | GND   | SCL   | N/C   | SDA   | BCD   | N/C   |
| CJMCU-232H | FT232H  | MPSSE (fast).    | GND   | AD0   | N/C   | AD1   | AD2   | N/C   |

Confirm that the voltages on the above pads fall within the 0-3.3v range using a multimeter.  Do not
use the adapter if any fall outside of this range as some adapters use counterfeit ICs which
improperly regulate IO voltages or require jumpers or switches to be set correctly.

Cut the lead of a link cable designed for the Game Boy Pocket and/or Game Boy Color and solder the
wires within to the pads labelled as above via 330Ω series resistors (except GND), ensuring that it
is not possible for their leads to short.  Use a continuity tester to determine which connector
contact corresponds to each wire, as even cables in the same package may use different colors.  When
looking directly at the cable's connector (NOT that of the console), the pins are numbered as
follows:

```
.-----------.- Square corners
v           v
.-----------.
| 1 | 3 | 5 |
|---|---|---|
| 2 | 4 | 6 |
 '---------'
^           ^
'-----------'- Chamfered corners
```

Ensure that any unused wires are made safe; neatly cutting them to inequal lengths and insulating
the conductors using electrical tape should suffice.

## Command-line executables

### streaming_cpi_controller

Connects to the GB/GBP/GBC/GBA/GBA SP, forwarding binary data received on standard input and
outputting the binary data received in exchange via standard output.

### multiboot

Reads a multiboot-compatible application from standard input and transmits it to the GBA/GBA SP,
which will execute it if powered on with no cartridge inserted.

## Adding a GBA SP charger

Cut the lead of a GBA SP charge cable of any kind (USB -> EXT2 cables are widely and cheaply
available) and solder to pads as follows; ensure that you check which wire connects to which
connector with a continuity tester as some cables may use unexpected color schemes:

```
.----------------------.
|  N/C   ......   N/C  |
|  ------''''''------  |
|  +5V  N/C  N/C  GND  |
'---------.__.---------'
```

As before, ensure that any unused wires are made safe.

## Unsupported adapters

The following adapters are not currently supported:

| Adapter        | IC                         | Notes                                                                                                                                                                                                                                                          | Pin 1   | Pin 2   | Pin 3   | Pin 4   | Pin 5   | Pin 6   |
| -------------- | -------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | ------- | ------- | ------- | ------- | ------- |
| USB-5V3VFTDi   | FT232R                     | Bit bang mode [is defective](https://ftdichip.com/wp-content/uploads/2020/08/TN_120_FT232R-Errata-Technical-Note.pdf) on some revisions; device used to test seemed to have very erratic timing regardless of published workarounds causing multiboot to fail. | GND     | DTR     | N/C     | TXD     | RXD     | N/C     |
| HCARDU0011     | CP2102                     | May be possible; bit banging [is documented](https://community.silabs.com/s/article/how-to-control-gpios-of-cp210x-at-runtime?language=en_US).  Many adapters using this IC do not expose any pads which could be used as a clock.                             | Unknown | Unknown | Unknown | Unknown | Unknown | Unknown |
| Arduino Uno R3 | ATmega16U2 + ATmega328P-PU | An Arduino [can act as a SPI controller](https://docs.arduino.cc/tutorials/generic/introduction-to-the-serial-peripheral-interface/), but most models have 5V IO pins.  This would be compatible with GB/GBC but not GBA/GBA SP.                               | GND     | 13      | N/C     | 11      | 12      | N/A     |

## Casings

OpenSCAD models for casings can be found [here](./source/shells).  These were tested with a Creality
Ender3 in 1.75mm PLA with a layer height of 0.2mm and a nozzle width of 0.4mm.  Four cap-headed M2
screws and nuts should be sufficient to lightly clamp down on the EXT1/EXT2 cables and hold the
adapter PCB in place.

## Purpose of the series resistors

I found that the adapter worked while all devices were powered on without the series resistors (i.e.
EXT/EXT1 directly wired to USB serial adapter pads), but with strange electrical irregularities,
especially on 5V systems (including GBA with a GB/GBC cartridge inserted), such as:

- The GB failing to power on (power LED only, no display nor sound).
- The display not fully clearing and a simply glowing power LED when the GB is powered off.

This seems to be some kind of current leakage through the EXT1 port, which can be reduced by
introducing the series resistors.  It doesn't appear to have caused any damage in my case but cannot
be ruled out (I am not an engineer).
