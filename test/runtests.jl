#!/usr/bin/env julia
push!(LOAD_PATH,"../src/Retriever.jl")
include("../src/Retriever.jl")
using Retriever
using Base.Test

# Run tests

tic()
println("Test 1")
@time include("test1.jl")
toc()
