Base.@kwdef struct SigMFGlobal
    datatype::String = "i"
    sample_rate::Union{Float64, Nothing} = nothing
    version::String = _sigmf_default_version
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
    dataset::Union{String, Nothing} = nothing
    trailing_bytes::Union{String, Nothing} = nothing
    metadata_only::Union{Bool, Nothing} = nothing
    geolocation::Union{String, Nothing} = nothing # TODO: GEOJSON
    extensions::Union{Dict{String,String}, Nothing} = nothing
    collection::Union{String, Nothing} = nothing
end

Base.@kwdef struct SigMFCaptures
    sample_start::UInt = 0
    global_index::Union{UInt, Nothing} = nothing
    header_bytes::Union{UInt, Nothing} = nothing
    frequency::Union{Float64, Nothing} = nothing
    datetime::Union{String, Nothing} = nothing
end

Base.@kwdef struct SigMFAnnotations
    sample_start::UInt = 0
    sample_count::Union{UInt, Nothing} = nothing
    generator::Union{String, Nothing} = nothing
    label::Union{String, Nothing} = nothing
    comment::Union{String, Nothing} = nothing
    freq_lower_edge::Union{Float64, Nothing} = nothing
    freq_upper_edge::Union{Float64, Nothing} = nothing
    signal_detail_extension::Union{SignalDetailExtension, Nothing} = nothing
    signal_emitter_extension::Union{SignalEmitterExtension, Nothing} = nothing
end

Base.@kwdef struct SigMFMeta
    meta_global::SigMFGlobal = SigMFGlobal()
    meta_captures::Vector{SigMFCaptures} = SigMFCaptures[]
    meta_annotations::Vector{SigMFAnnotations} = SigMFAnnotations[]
end

Base.@kwdef struct SigMFCollection
    version::String = _sigmf_default_version
    description::Union{String, Nothing} = nothing
    author::Union{String, Nothing} = nothing
    collection_doi::Union{String, Nothing} = nothing
    license::Union{String, Nothing} = nothing
    extensions::Union{Dict{String,String}, Nothing} = nothing
    streams::Vector{Dict{String,String}} = Dict{String,String}[]
end

struct SigMFFile{T}
    meta::SigMFMeta
    data::T
end

## Struct type mapping for JSON 3

StructTypes.StructType(::Type{SigMFGlobal}) = StructTypes.Struct()

function StructTypes.names(::Type{SigMFGlobal})
    ((:datatype,        Symbol("core:datatype")),
     (:sample_rate,     Symbol("core:sample_rate")),
     (:version,         Symbol("core:version")),
     (:num_channels,    Symbol("core:num_channels")),
     (:sha512,          Symbol("core:sha512")),
     (:offset,          Symbol("core:offset")),
     (:description,     Symbol("core:description")),
     (:author,          Symbol("core:author")),
     (:meta_doi,        Symbol("core:meta_doi")),
     (:data_doi,        Symbol("core:data_doi")),
     (:recorder,        Symbol("core:recorder")),
     (:license,         Symbol("core:license")),
     (:hw,              Symbol("core:hw")),
     (:dataset,         Symbol("core:dataset")),
     (:trailing_bytes,  Symbol("core:trailing_bytes")),
     (:metadata_only,   Symbol("core:metadata_only")),
     (:geolocation,     Symbol("core:geolocation")),
     (:extensions,      Symbol("core:extensions")),
     (:collection,      Symbol("core:collection")))
end

StructTypes.StructType(::Type{SigMFCaptures}) = StructTypes.Struct()

function StructTypes.names(::Type{SigMFCaptures})
    ((:sample_start, Symbol("core:sample_start")),
    (:global_index, Symbol("core:global_index")),
    (:frequency, Symbol("core:frequency")),
    (:datetime, Symbol("core:datetime")))
end

StructTypes.StructType(::Type{SigMFAnnotations}) = StructTypes.Struct()

function StructTypes.names(::Type{SigMFAnnotations})
    ((:sample_start, Symbol("core:sample_start")),
    (:sample_count, Symbol("core:sample_count")),
    (:generator, Symbol("core:generator")),
    (:label, Symbol("core:label")),
    (:comment, Symbol("core:comment")),
    (:freq_lower_edge, Symbol("core:freq_lower_edge")),
    (:freq_upper_edge, Symbol("core:freq_upper_edge")),
    (:signal_detail_extension, Symbol("signal:detail")),
    (:signal_emitter_extension, Symbol("signal:emitter")))
end

StructTypes.StructType(::Type{SigMFMeta}) = StructTypes.Struct()

function StructTypes.names(::Type{SigMFMeta})
    ((:meta_global,  Symbol("global")),
    (:meta_captures,Symbol("captures")),
    (:meta_annotations,Symbol("annotations")))
end