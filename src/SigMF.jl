module SigMF

using JSON3
using Tar
using SHA
using StructTypes
using Dates
using Mmap

const _sigmf_default_version = "0.0.2"

include("errors.jl")
include("datatype.jl")
include("extension_signal.jl")
include("core.jl")
include("io.jl")

export SigMFFile, SigMFMeta, SigMFGlobal, SigMFCaptures, SigMFAnnotations



end
