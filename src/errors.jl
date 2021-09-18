

struct SigMFDataTypeError <: Exception
    s::String
end

Base.showerror(io::IO, e::SigMFDataTypeError) = print(io, "Could not parse datatype format: ", e.s)