using SigMF
using Documenter

DocMeta.setdocmeta!(SigMF, :DocTestSetup, :(using SigMF); recursive=true)

makedocs(;
    modules=[SigMF],
    authors="Steve Kelly <kd2cca@gmail.com> and contributors",
    repo="https://github.com/sjkelly/SigMF.jl/blob/{commit}{path}#{line}",
    sitename="SigMF.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://sjkelly.github.io/SigMF.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/sjkelly/SigMF.jl",
)
