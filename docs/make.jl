using Retriever
using Documenter

makedocs(
    modules = [Retriever],
    format = :html,
    sitename = "Retriever",
    authors = "Ethan White",
    pages = [
        "Home" => "intro.md",
        "Installation Guide" => "tutorial.md",
        "Source" => "index.md",
    ],
)
