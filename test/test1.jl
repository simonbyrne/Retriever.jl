#!/usr/bin/env julia
# push!(LOAD_PATH,"../src/Retriever.jl")
# include("../src/Retriever.jl")


using Retriever
# Pkg.clone("git://github.com/JuliaDB/DBI.jl")
# Pkg.clone("git://github.com/JuliaDB/PostgreSQL.jl")
# using PostgreSQL


using PyCall
using SQLite
using MySQL



test_datasets = ["bird_size", "mammal_masses", "iris"]


arg1 = "Iris"
install_sqlite2 = Dict("engine" => "sqlite",
                        "file" => "dbfile",
                        "table_name" => "dbfile_kkk",
                        "dataset" =>  "$arg1")

install_postgres2 =  Dict( "engine" =>  "postgres",
                        "dataset" => "$arg1",
                        "user" =>  "postgres",
                        "host" =>  "localhost",
                        "password" => "",
                        "port" =>  5432,
                        "database" =>  "testdb2",
                        "database_name" =>  "testschema2",
                        "table_name" => "{db}.{table}")

install_csv2 = Dict("engine" =>  "csv",
                    "dataset" => "$arg1",
                    "table_name" => "output_file_{table}.csv")

install_mysql2 = Dict("engine" =>  "mysql",
                    "dataset"=>"$arg1",
                    "user" => "travis",
                    #"password"=>"",
                    "host"=>"localhost",
                    "port"=>3306,
                    "database_name"=>"testdb",
                    "table_name"=>"{db}.{table}")


install_json2 = Dict("engine" =>  "json",
                    "dataset" => "$arg1",
                    "table_name" => "output_file_{table}.json")


install_xml2 = Dict("engine" =>  "xml",
                    "dataset"=> "$arg1",
                    "table_name" => "output_file_{table}.xml")


# function install_install_mysq(arg1)
#     try
#       Retriever.install_mysql(install_mysql2["dataset"], user = install_mysql2["user"], host=install_mysql2["host"], port = install_mysql2["port"], database_name =install_mysql2["database_name"], table_name = install_mysql2["table_name"])
#       con = mysql_connect(install_mysql2["dataset"], user = install_mysql2["user"], host=install_mysql2["host"], port = install_mysql2["port"], database_name =install_mysql2["database_name"])
#       table_n = install_mysql2["table_name"]
#       command = "SELECT * FROM $table_n"
#       dframe = mysql_execute(con, command)
#       mysql_disconnect(con)
#       return true
#     catch
#         return false
#     end
# end


# function install_jso(arg1)
#     try
#       Retriever.install_json(install_json2["dataset"], table_name=install_json2["table_name"])
#       table_n = "output_file_$arg1.json"
#       @test filesize("$table_n") > 0
#       return true
#     catch
#         return false
#     end
# end


# function install_xm(arg1)
#     try
#       Retriever.install_xml(install_xml2["dataset"], table_name=install_xml2["table_name"])
#       table_n = "output_file_$arg1.xml"
#       @test filesize("$table_n") > 0
#       return true
#     catch
#         return false
#     end
# end


function install(::String)
    try

      Retriever.install_sqlite(install_sqlite2["dataset"])
      # Retriever.install_sqlite(install_sqlite2["dataset"], file=install_sqlite2["file"], table_name=install_sqlite2["table_name"])
      # table_n = install_sqlite2["table_name"]
      # db = SQLite.DB(install_sqlite2["file"])
      # result = SQLite.query(db, "SELECT * FROM $table_n LIMIT 3")
      # @ test size(result, 1) == 3
      return true
    catch
        return false
    end
end


# function install_cs(arg1)
#     try
#       Retriever.install_csv(install_csv2["dataset"], table_name=install_csv2["table_name"])
#       table_n = "output_file_$arg1.csv"
#       @test filesize("$table_n") > 0
#       return true
#     catch
#         return false
#     end
# end


# function install_postgre(arg1)
#     try
#       Retriever.install_postgres(install_postgres2["dataset"], user = install_postgres2["user"], host=install_postgres2["host"],port = install_postgres2["port"], database_name =install_postgres2["database_name"],table_name = install_postgres2["table_name"])
#       return true
#     catch
#         return false
#     end
# end


# function install_install_mysq(arg1)
#     try
#       Retriever.install_mysql(install_mysql2["dataset"], user = install_mysql2["user"], host=install_mysql2["host"],port = install_mysql2["port"], database_name =install_mysql2["database_name"],table_name = install_mysql2["table_name"])
#       return true
#     catch
#         return false
#     end
# end


@testset "Regression" begin

    @test true
    @test true == install("Iris")
    # @test true == install_cs("Iris")
    # @test true == install_xm("Iris")
    # @test true == install_jso("Iris")
    # @test true == install_postgre("iris")
    # @test true == install_install_mysq("iris")

end # @testset Regression
