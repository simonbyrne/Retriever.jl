push!(LOAD_PATH,"../src/Retriever.jl")
include("../src/Retriever.jl")
using Retriever
using Documenter

makedocs(
    modules = [Retriever],
    clean = false,
    format = :html,
    build = "build/html",
    sitename = "Retriever",
    authors = "Ethan White",
    pages = [
        "Home" => "intro.md",
        "Installation Guide" => "tutorial.md",
        "Source" => "index.md",
        "Command Documentation" => "lib/public.md",
        "Code of Conduct" => "CODE_OF_CONDUCT.md"
    ]
)
