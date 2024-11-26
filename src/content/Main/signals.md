---
date: 2024-11-26 13:11
tags:
  - Networks
  - computing
category: "[[]]"
---
# signals
a physical form of a message.

### signal Types
#### Analogue 
a smooth continuum of values 
consists of a wave with amplitude that represents the values of interest.

| pros          | cons                                                 |
| ------------- | ---------------------------------------------------- |
| high accuracy | susceptible to noise and interference in the channel |
|               | difficult to process using digital electrinics       |
An analogue signal can be represented digitally by:
- Sample the signal at a suitable rate(can be done through the **([[sampling_theorem|sampling theorem]])**
- Quantise to the nearest permissible value
- Converting to digital format

#### Digital Signals
a sequence of discreet symbols
consists of a sequence of discrete symbols from a fixed set, rather than arbitrary values.

##### Modulation
used to map digital signals onto a analogue channel
##### Binary Encoding
digital signals in computing systems use binary encoding with two symbols **0,1**
##### Non-binary Encoding in Networks
Networked systems often use more complex encoding schemes(wireless links may use modulation schemes with 16,64 or 256 symbols)
- **Baud Rate**: The number of symbols transmitted per second(different from [[bit_rate|bit rate]])

**NRZ modulation** (Non Return to Zero Modulation):
	A method of encoding digital data for transmission where the signal does not return to zero voltage between bits