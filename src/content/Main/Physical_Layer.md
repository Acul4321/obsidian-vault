---
date: 2024-11-26 15:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# Physical Layer
#### Transmission 
- Transmission a sequence of bits over an analogue channel
- addresses issues like noise, clock skew, hardware limitations.
#### Interface to Layer 2([[Physical_Layer|Physical Layer]])
- provides a sequence of bits
	- Hides the complexity of encoding/decoding from higher layers

## Wired Media

| Unshielded Twisted Pair(Cable)                    | optical fibre(Fibre)                                                       |
| ------------------------------------------------- | -------------------------------------------------------------------------- |
| electrical cable using two wires twisted together | glass core and cladding, contained in plastic jacket for protection        |
| -each pair is unidirectional: *signal* & *ground* | -fragile                                                                   |
| -twist reduces interference and noise             | -unidirectional: transmission laser at one end; photodetector at the other |
| -susceptible to noise increased with length       | -very low noise,electromagnetic interference does not affect light         |
|                                                   | -Very high capacity: 10s of Gbps over 100s of miles                        |
|                                                   | -cheap to manufacture                                                      |
## Wired Data Transmission
- signal usually directly encoded onto the channel
- Encoding preformed by varying the voltage in an electrical cable, or intensifying light 
- Many encoding schemes exist:
	- NRZ (Non-Return to Zero)
	- NRZI (Non-Return to Zero Inverted)
	- Manchester
	- 4B/5B
	- etc...
### Baseband Data encoding
encoding the signal, 1 if high 0 if low
![[basebandDataEncoding.png]]

## Carrier Modulation
The process of applying a carrier wave to a channel at a specific frequency(C)
**Modulation**: the act of varying one or more properties (amplitude, frequency or phase) of the carrier wave in relation to the information signal
**Purpose**: 
- *Shift baseband signal*: modulates the signal onto the carrier to shift it from the baseband to a higher carrier frequency
- *Multiple signals on a single channel*: allows multiple signals to share a single channel by using different carrier frequencies
**Applications**:
used in *wireless links*
can also be used in *wired links*(how ADS^[Asymmetric Digital Subscriber Line, A type of DSL technology used for transmitting digital data over traditional copper telephone lines, offering higher download speeds than upload speeds] and voice telephone share the same line)

### Bandwidth of a channel
