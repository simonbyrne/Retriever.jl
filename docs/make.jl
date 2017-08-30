# push!(LOAD_PATH,"../src/Retriever.jl")
# include("../src/Retriever.jl")
# Pkg.clone(pwd(), \"Documenter\") Pkg.clone("../", \"Retriever\")
# Pkg.clone("../", "Retriever")
using Retriever
using Documenter

makedocs(
    modules = [Retriever],
    clean = false,
    format = :html,
    sitename = "Retriever",
    authors = "Ethan White",
    pages = [
        "Home" => "intro.md",
        "Installation Guide" => "tutorial.md",
        "Source" => "index.md"
    ]
)