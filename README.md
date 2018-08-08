# Verifying Constant-Time Implementations

A tool for verifying constant time implementations, and a case study of
verified constant-time implementations.

### New (July 2018): added Dockerfile for installing ct-verif + dependencies 
##### (Note: ct-verif and smack have been slightly altered, for the purpose of verifying C++ programs) 
 - Install Docker on your system
 - Copy the `Dockerfile` in this repository to some directory in your system
 - Build the container (this takes a while), by issuing the command (in the directory where you put the `Dockerfile`) 
```
docker build -t ctverif .
```   
 - Run the container
``` 
docker run -it ctverif /bin/bash
```
 - Test `ct-verif`, by issuing (on the bash terminal in the container)
```
source smack.environment
cd /verifying-constant-time/examples/tea_c++
/verifying-constant-time/bin/ct-verif.rb -e _Z15encrypt_wrapperPjS_ tea.cpp
```
 - This should give the following output:
```
SMACK program verifier version 1.9.0
SMACK generated a.bpl

Boogie program verifier version 2.3.0.61016, Copyright (c) 2003-2014, Microsoft.

Boogie program verifier finished with 1 verified, 0 errors
```

## Issues

The following examples are currently stable:

* curve25519-donna

* ftfp: except `fix_pow`

* mee-cbc

* openssl: except `ssl3_cbc_digest_record_wrapper`

* pkcs

* polarssl: except `mbedtls_des3_DEcrypt_cbc_wrapper`

* rlwe

* sodium: `salsa20`, `chacha20`

* sort

* tea

The following examples are currently unstable:

* ftfp: `fix_pow`

* openssl: `ssl3_cbc_digest_record_wrapper`

* polarssl: `mbedtls_des3_DEcrypt_cbc_wrapper`

* qhasm: apparently never worked

* sodium: all after `crypto_hash_sha256_wrapper`
