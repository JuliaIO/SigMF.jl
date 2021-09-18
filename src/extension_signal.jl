
# https://github.com/gnuradio/SigMF/blob/7996ac17d06f690ab12d02d95968d3974f712b49/extensions/signal.sigmf-ext.md

Base.@kwdef struct SignalDetailExtension
    type::Union{String, Nothing} = nothing
    class::Union{String, Nothing} = nothing
    standard::Union{String, Nothing} = nothing
    carrier_variant::Union{String, Nothing} = nothing
    symbol_variant::Union{String, Nothing} = nothing
    order::Union{UInt, Nothing} = nothing
    duplexing::Union{String, Nothing} = nothing
    multiplexing::Union{String, Nothing} = nothing
    multiple_access::Union{String, Nothing} = nothing
    spreading::Union{String, Nothing} = nothing
    channel_bw::Union{Float64, Nothing} = nothing
    channel::Union{UInt, Nothing} = nothing
    class_variant::Union{String, Nothing} = nothing
end

Base.@kwdef struct SignalEmitterExtension
    seid::Union{UInt, Nothing} = nothing
    manufacturer::Union{String, Nothing} = nothing
    power_tx::Union{Float64, Nothing} = nothing
    power_eirp::Union{Float64, Nothing} = nothing
    geolocation::Union{String, Nothing} = nothing
end

StructTypes.StructType(::Type{SignalDetailExtension}) = StructTypes.Struct()
StructTypes.StructType(::Type{SignalEmitterExtension}) = StructTypes.Struct()
