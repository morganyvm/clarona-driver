# Clarona RDSEED &amp; RDRAND Character Device Driver

## Description

Clarona is a Linux driver providing /dev/clarona-rdseed and /dev/clarona-rdrand character devices. These read-only character devices enable direct-access to the output of RDSEED and RDRAND instructions in supported architectures.

Detailed explanation of Intel's implementation can be read here: <https://software.intel.com/en-us/articles/intel-digital-random-number-generator-drng-software-implementation-guide>

## Installation

Just use make. You need to have kernel headers.

## Supported Architectures

Driver is tested on Linux Kernel 4.10, Ubuntu 16.04 x86_64 running on an Intel Xeon E5-1245 v5.

uname -a output includes:
```
Linux 4.10.0-38-generic #42~16.04.1-Ubuntu SMP x86_64 GNU/Linux
```

cat /proc/cpuinfo output includes:
```
vendor_id   : GenuineIntel
cpu family  : 6
model       : 94
model name  : Intel(R) Xeon(R) CPU E3-1245 v5 @ 3.50GHz
stepping    : 3
cpuid level : 22
flags       : many flags including rdrand and rdseed
```

## How to Use

The character devices /dev/clarona-rdseed and /dev/clarona-rdrand can be read by any means.

If you want to use them to feed Java Secure Random algorithms, there are two ways:

1. run JVM with -Djava.security.egd=/dev/clarona-rdseed (this will use /dev/clarona-rdseed instead of /dev/random)
2. implement a custom Secure Random algorithm to use one or both character devices (see Commercial Support)

## Performance

20 MBit/sec True Random Bit Stream (RDSEED output) generation throughput can be easily achieved.

```
$ sudo dd if=/dev/clarona-rdseed of=out bs=8 count=1MB
1000000+0 records in
1000000+0 records out
8000000 bytes (8.0 MB, 7.6 MiB) copied, 3.02168 s, 2.6 MB/s
```

## Commercial Support

[antelabs GmbH](http://antelabs.com) provides commercial support for Clarona RDSEED & RDRAND Linux driver. Please send an email to <mailto:clarona@antelabs.com> if you are interested.

antelabs GmbH also provides Clarona Java Secure Random Provider enabling direct access to the hardware random generator embedded inside the CPU. Like NativePRNG implementations, but rather than accessing to /dev/random and /dev/urandom, this implementation provides pure RDSEED & RDRAND output to be used in Java applications.
