module SigMF

using JSON3
using Tar
using SHA
using GeoJSON
using StructTypes
using Dates

const _sigmf_default_version = v"1.0.0"

export SigMFFile, SigMFGlobal, SigMFCaptures, SigMFAnnotations

Base.@kwdef mutable struct SigMFGlobal
    datatype::Type = Int16
    sample_rate::Union{Float64, Nothing} = nothing
    version::VersionNumber = _sigmf_default_version
    num_channels::Union{UInt, Nothing} = nothing
    sha512::Union{String, Nothing} = nothing
    offset::Union{UInt, Nothing} = nothing
    description::Union{String, Nothing} = nothing
    author::Union{String, Nothing} = nothing
    meta_doi::Union{String, Nothing} = nothing
    data_doi::Union{String, Nothing} = nothing
    recorder::Union{String, Nothing} = nothing
    license::Union{String, Nothing} = nothing
    hw::Union{String, Nothing} = nothing
    hagl::Union{Float64, Nothing} = nothing
    extensions::Union{Dict{String,String}, Nothing} = nothing
end

Base.@kwdef mutable struct SigMFCaptures
    sample_start::UInt = 0
    global_index::Union{UInt, Nothing} = nothing
    frequency::Union{Float64, Nothing} = nothing
    datetime::Union{String, Nothing} = nothing
end

Base.@kwdef mutable struct SigMFAnnotations
    sample_start::UInt = 0
    sample_count::Union{UInt, Nothing} = nothing
    generator::Union{String, Nothing} = nothing
    label::Union{String, Nothing} = nothing
    comment::Union{String, Nothing} = nothing
    freq_lower_edge::Union{Float64, Nothing} = nothing
    freq_upper_edge::Union{Float64, Nothing} = nothing
end

Base.@kwdef mutable struct SigMFFile
    meta_global::SigMFGlobal = SigMFGlobal()
    meta_captures::Vector{SigMFCaptures} = SigMFCaptures[]
    meta_annotations::Vector{SigMFAnnotations} = SigMFAnnotations[]
end

StructTypes.StructType(::Type{SigMFGlobal}) = StructTypes.Mutable()

function StructTypes.names(::Type{SigMFGlobal})
    ((:datatype,     Symbol("core:data_type")),
     (:sample_rate,  Symbol("core:sample_rate")),
     (:version,      Symbol("core:version")),
     (:num_channels, Symbol("core:num_channels")),
     (:sha512,       Symbol("core:sha512")),
     (:offset,       Symbol("core:offset")),
     (:description,  Symbol("core:description")),
     (:author,       Symbol("core:author")),
     (:meta_doi,     Symbol("core:meta_doi")),
     (:data_doi,     Symbol("core:data_doi")),
     (:recorder,     Symbol("core:recorder")),
     (:license,      Symbol("core:license")),
     (:hw,           Symbol("core:hw")),
     (:hagl,         Symbol("core:hagl")),
     (:extensions,   Symbol("core:extensions")))
end

StructTypes.StructType(::Type{SigMFCaptures}) = StructTypes.Mutable()

function StructTypes.names(::Type{SigMFCaptures})
    ((:sample_start, Symbol("core:sample_start")),
    (:global_index, Symbol("core:global_index")),
    (:frequency, Symbol("core:frequency")),
    (:datetime, Symbol("core:datetime")))
end

StructTypes.StructType(::Type{SigMFAnnotations}) = StructTypes.Mutable()

function StructTypes.names(::Type{SigMFAnnotations})
    ((:sample_start, Symbol("core:sample_start")),
    (:sample_count, Symbol("core:sample_count")),
    (:generator, Symbol("core:generator")),
    (:label, Symbol("core:label")),
    (:comment, Symbol("core:comment")),
    (:freq_lower_edge, Symbol("core:freq_lower_edge")),
    (:freq_upper_edge, Symbol("core:freq_upper_edge")))
end

StructTypes.StructType(::Type{SigMFFile}) = StructTypes.Mutable()

function StructTypes.names(::Type{SigMFFile})
    ((:meta_global,  Symbol("global")),
    (:meta_captures,Symbol("captures")),
    (:meta_annotations,Symbol("annotations")))
end


end
