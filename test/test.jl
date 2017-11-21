#!/usr/bin/env julia
push!(LOAD_PATH,"../src/Retriever.jl")
include("../src/Retriever.jl")
using Retriever


sqlite_engine_opts = Dict("engine" => "sqlite",
"file" => "dbfile.db",
"table_name" =>"{db}_{table}",
"dataset" => "iris")

install_mysql2 = Dict("engine" =>  "mysql",

                    "user" => "travis",
                    #"password"=>"",
                    "host"=>"localhost",
                    "port"=>3306,
                    "database_name"=>"testdb",
                    "table_name"=>"{db}.{table}")
#Retriever.install_postgres("iris")
Retriever.install_mysql("iris", user=install_mysql2["user"])