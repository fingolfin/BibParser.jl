using BibParser, BibParser.BibTeX
using Test

for file in ["test.bib"]
    println("\nstart $file")
    parsed = parse_file("../examples/$file")

    println("type: $(typeof(parsed))")

    for e in parsed[1]
        println("|--->type: $(typeof(e)), key: $(e.id)")
        for fn in fieldnames(typeof(e))
            println("|     |----$(string(fn)) -> metaprogramming to hard") # TODO: better printing
        end
        for (n, v) in pairs(e.other)
            println("|     |----$n -> $v")
        end
        println("|")
    end
    @test parsed[2] == :ok
end

