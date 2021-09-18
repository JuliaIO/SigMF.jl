using SigMF
using Test
using JSON3

@testset "SigMF.jl" begin
    f = open("logo/sigmf_logo.sigmf-meta") do f
        JSON3.read(f, SigMFMeta)
    end
    
    f = SigMF.load("logo/sigmf_logo.sigmf")
    @show typeof(f)
end
