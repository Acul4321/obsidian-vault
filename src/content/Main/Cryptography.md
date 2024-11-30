---
date: 2024-11-28 17:11
tags:
  - Networks
  - computing
category: "[[Networks]]"
---
# Cryptography
## CIA Triad
### C - Confidentiality
who is allowed to access what
### I - Integrity
Data to be protected and not tampered/modified/deleted by unauthorized party(ies)
### A - Availability
data to be protected but also available when needed

## Compliance
data must be encrypted to comply with CIA, two approaches are:
### Symmetric Cryptography
- Advanced Encryption Standard (AES)

function converts *plain text into cypher-text*
	 fast - suitable for bulk encryption
conversations is protected by a *secret key*
	The key must be kept secret, key is used for encryption and decryption
### Asymmetric Cryptography
- The Diffie-Hellman algorithm
- The Rivest-Shamir-Adleman (RSA) algorithm
- Elliptic curve-based algorithms

split up into 2 parts:
**public key** - shared, used for encryption	
**Private key** - secret, used for decryption
Public keys are published in a well known directory

### Hybrid Cryptography
combination of public-key and symmetric cryptography
- Generate a random, ephemeral, session key that can be used with symmetric cryptography
- Use a public-key system to securely distribute this session key – relatively fast, since session key is small
- Encrypt the data using symmetric cryptography, keyed by the session key

## Authentication
To tell if the data has been tampered with:
- Use combination of a cryptographic hash and public key cryptography to produce a digital signature
- Gives some confidence that there is no man-in-the-middle attack in progress
- Can also be used to prove origin of data

### Cryptographic Hash Functions
Generate a fixed length (e.g., 256 bit) hash code of an arbitrary length input value
- Should not be feasible to derive input value from hash
- Should not be feasible to generate a message with the same hash as another
Examples : SHA256, MD5

### Digital Signature Algorithm
#### Generation
- Generate a cryptographic hash of the data
- Encrypt the hash with your private key to give a digital signature
#### Verification
- Re-calculate the cryptographic hash of the data
- Decrypt the signature using the public key, compare with the calculated hash value
	Should Match
