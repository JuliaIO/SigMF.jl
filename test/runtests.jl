using SigMF
using Test

@testset "SigMF.jl" begin
    f = SigMF.load("logo/sigmf_logo.sigmf")
    @test typeof(f) == SigMFFile{Base.ReinterpretArray{Int16, 1, UInt8, Vector{UInt8}, false}}

    !isdir("test_save") && mkdir("test_save")
    @test SigMF.save("test_save/sigmf_logo.sigmf", f) == 1152000
end
