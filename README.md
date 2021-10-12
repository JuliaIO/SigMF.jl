# SigMF

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://juliaIO.github.io/SigMF.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://juliaIO.github.io/SigMF.jl/dev)
[![Build Status](https://github.com/juliaIO/SigMF.jl/workflows/CI/badge.svg)](https://github.com/juliaIO/SigMF.jl/actions)

SigMF - Signal Metadata Format

This is a Julia package for working with metadata and storage associated with signals.

The official spec may be found here: https://github.com/gnuradio/SigMF

The documentation serves as the "as-built" specification for the package, and the format is
pre-1.0 so we have reproduced the specifications used to develop the package.

## Quickstart

```
using SigMF

SigMF.load("/path/to/file.sigmf")
```