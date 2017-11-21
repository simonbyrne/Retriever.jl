#!/usr/bin/env julia
push!(LOAD_PATH,"../src/Retriever.jl")
include("../src/Retriever.jl")





# ENV["PYTHON"] = readstring(`which python`)
Pkg.add("PyCall")
Pkg.build("PyCall")
Pkg.add("SQLite")
Pkg.add("MySQL")

using Base.Test

# Run tests

tic()
@time include("test1.jl")
toc()
