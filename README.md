# Ethereal-Ports

A collection of ports for Ethereal

## Build environment

To build any ports for Ethereal you must have already setup your environment.

This means that you should have:

- The [Ethereal toolchain](https://github.com/sasdallas/Ethereal_Toolchain) installed.
- [Ethereal](https://github.com/sasdallas/Ethereal) built in an accessible directory
- All of the above working.

To enter the environment, run:

```
source buildenv.sh [path to your Ethereal sysroot] [the target arch you are compiling for]
```

## Building a port

Use the `build_port.sh` script with your port name as the argument.

You must have a proper build environment setup to build a port.

The port builder maintains a list of already built ports to satisfy dependencies (`.built_ports`).\
If a dependency is needed it will be automatically built.

If you need to rebuild a port for whatever reason, use the `-f` flag to remove the build directory.

