
const _type_pairs = [
    ("f64" => Float64),
    ("f32" => Float32),
    ("f16" => Float16),
    ("i64" => Int64),
    ("i32" => Int32),
    ("i16" => Int16),
    ("i8"  => Int8),
    ("u64" => UInt64),
    ("u32" => UInt32),
    ("u16" => UInt16),
    ("u8"  => UInt8)
]

const _type_map_jl2sigmf = Dict(reverse.(_type_pairs))
const _type_map_sigmf2jl = Dict(_type_pairs)

function datatype_julia2sigmf(::Type{Complex{T}}) where T
    return string("c", _type_map_jl2sigmf[T], "_le")
end

"""
    datatype_sigmf2julia(::String) -> Type, Bool

Return a tuple of: the Julia representation of a SigMF datatype, and whether format is little endian (true)
"""
function datatype_sigmf2julia(s::String)
    #dataset-format = (real / complex) ((type endianness) / byte)
    #real = "r"
    #complex = "c"
    #type = floating-point / signed-integer / unsigned-integer
    #floating-point = "f32"
    #signed-integer = "i32" / "i16"
    #unsigned-integer = "u32" / "u16"
    #endianness = little-endian / big-endian
    #little-endian = "_le"
    #big-endian = "_be"
    #byte = "i8" / "u8"

    # get the numeric repr of the type
    e = findnext('_', s, 1)
    isnothing(e) && throw(SigMFDataTypeError(s))

    # 'real' seems to be optional, so check if specified
    repr_start = s[1] in ('r', 'c') ? 2 :  s[1] in ('f', 'i', 'u') ? 1 : throw(SigMFDataTypeError(s))

    numeric_repr = s[repr_start:e-1]
    haskey(_type_map_sigmf2jl, numeric_repr) || throw(SigMFDataTypeError(s))

    # endianness 
    little_endian = s[e+1:end] == "le" ? true : false

    # return either complex/real depending on first character
    if s[1] == 'r' || repr_start == 1
        return _type_map_sigmf2jl[numeric_repr], little_endian
    elseif s[1] == 'c'
        return Complex{_type_map_sigmf2jl[numeric_repr]}, little_endian
    else
        throw(SigMFDataTypeError(s))
    end
end
