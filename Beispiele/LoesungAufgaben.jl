using JuliaSkriptumKontrolle

@Aufgabe "3.5.1" begin
end

@Aufgabe "7.4.1" function print_three(a)
    println(string(a," ",a," ",a))
end

@Aufgabe "7.4.2" function verkette(f, g, x)
    return f(g(x))
end

@Aufgabe "7.4.3" kreis_flaeche(r) = r^2*π
@Aufgabe "7.4.4" kreis_umfang(r) = 2*r*π

@Aufgabe "7.4.5" begin
    kreis_flaeche(r) = r^2*π
    kreis_umfang(r) = 2*r*π
    function kreis(r)
        println("r = $(round(r,digits=2))")
        println("A = $(round(kreis_flaeche(r),digits=2))")
        println("U = $(round(kreis_umfang(r),digits=2))")
    end
end

@Aufgabe "8.5.1" function connect_three(a,b,c)
    return append!(append!(a,b),c)
end

@Aufgabe "8.5.2" function interior(a)
    return a[2:end-1]
end

@Aufgabe "8.5.3" function issort(a)
    return a == sort(a)
end

@Aufgabe "8.5.4" function isanagram(s1, s2)
    return sort(collect(lowercase(s1))) == sort(collect(lowercase(s2)))
end

@Aufgabe "8.5.5" function dict_index(d, n)
    return d[sort(collect(keys(d)))[n]]
end

@Aufgabe "8.5.6" function tuple_append(t1, t2)
    return Tuple(append!(collect(t1),collect(t2)))
end

@Aufgabe "10.3.1" begin
    using LinearAlgebra

    function lösbar(A,b)
        rank(A) == rank(hcat(A,b))
    end
end

@Aufgabe "10.3.2" begin
    using LinearAlgebra
    A = [1 -1 1
        2 3 0
        10 -0.5 5
        ]
    b = [22,11, 0]
    A\b
end

@Aufgabe "10.3.3" begin
    using LinearAlgebra
    function rekonstruiere(λ,ϕ)
        ϕ*Diagonal(λ)*inv(ϕ)
    end
end

@Aufgabe "10.3.4" begin
    using LinearAlgebra
    function winkel(v1,v2)
        acos(v1⋅v2/(norm(v1)*norm(v2)))
    end
end

@Aufgabe "11.3.1" function gerade_ungerade(x::Int)
    if x % 2 == 0
        println("Gerade")
    else
        println("Ungerade")
    end
end

@Aufgabe "11.3.2" begin
    function read_radius()
        print("Radius eingeben: ")
        readline()
    end

    function AundU(r)
        println("A = $(round(r^2*π,digits=2))")
        println("U = $(round(2r*π,digits=2))")
    end

    function run()
        while (inp = read_radius()) != ""
            if (number = tryparse(Float64,inp)) != nothing
                AundU(number)
            else
                println("Falsche Eingabe")
            end
            println()
        end
    end
end

@Aufgabe "11.3.3" function π_mc(n::Int)
    inside = 0
    for _ in 1:n
        inside += rand()^2+rand()^2 <= 1.0
    end
    4*inside/n
end

@Aufgabe "11.3.4" function ∫(x,y)
    val = 0.0
    for i in 1:min(length(x),length(y))-1
        val += (x[i+1]-x[i])*(y[i]+y[i+1])/2
    end
    return val
end

@Aufgabe "11.3.5.1" begin
    throw() = rand(1:6)
    function P_est_1(n)
        sum([all(i->i==4,(throw() for _ in 1:3)) for __ in 1:n])/n
    end
end

@Aufgabe "11.3.5.2" begin
    throw() = rand(1:6)
    function P_est_2(n)
        sum([any(i->i==4,(throw() for _ in 1:3)) for __ in 1:n])/n
    end
end

@Aufgabe "11.3.6" function my_split(str,c::Char)
    push_no_empty!(a,b) = b != "" && push!(a,b)
    arr = String[]
    last_idx = 1
    for i in 1:length(str)
        if str[i] == c
            push_no_empty!(arr,str[last_idx:i-1])
            last_idx = i+1
        end
    end
    push_no_empty!(arr,str[last_idx:end])
    return arr
end

@Aufgabe "11.3.7" function bsqrt(a)
    x = a/2
    while abs(x*x-a) >= 1e-5
        x = (x+a/x)/2
    end
    return x
end

@Aufgabe "11.3.8" function dict_merge(d1, d2)
    d = copy(d1)
    for k in keys(d2)
        d[k] = d2[k]
    end
    return d
end

@Aufgabe "12.3.1" begin
    function ggt(a::Int,b::Int)
        b == 0 && return a
        a == 0 && return b
        for teiler in min(abs(a),abs(b)):-1:0
            if a%teiler == 0 && b%teiler == 0
                return teiler
            end
        end
        return 1
    end
end

@Aufgabe "13.3.1" begin
    using Dates
    isdate(x,y) = Dates.value(Day(x)) == Dates.value(Month(y)) && Dates.value(Day(y)) == Dates.value(Month(x))

    function get_date()
        for d in range(Date(2017,1,1),Date(2017,12,31),step=Day(1))
            if isdate(d,d+Week(6))
                return d+Week(6)
            end
        end
    end
end

# Schreibe eine Funktion die den Lagerbestand für jedes Lager in ein Dict{Int,Dict{String,Int}} ausgibt
@Aufgabe "14.3.1" begin
    using CSV
    function read_lagers()
        path = "14-3"
        files = readdir(path)
        output = Dict{Int,Dict{String, Int}}()
        for f in files
            bestand = Dict{String,Int}()
            data = CSV.File(joinpath(path,f))
            for row in data
                if !(row.Artikel in keys(bestand)) 
                    bestand[row.Artikel] = 0
                end
                bestand[row.Artikel] += row.Bestand
            end
            output[parse(Int,f[6:end-4])] = bestand
        end
        return output
    end
end


# Schreibe eine Funktion die alle Lager ids ausgibt, die mindestes n von a haben
@Aufgabe "14.3.2" begin
    using CSV
    function read_lagers()
        path = "14-3"
        files = readdir(path)
        output = Dict{Int,Dict{String, Int}}()
        for f in files
            bestand = Dict{String,Int}()
            data = CSV.File(joinpath(path,f))
            for row in data
                if !(row.Artikel in keys(bestand)) 
                    bestand[row.Artikel] = 0
                end
                bestand[row.Artikel] += row.Bestand
            end
            output[parse(Int,f[6:end-4])] = bestand
        end
        return output
    end
    function lager_mit(artikel,anzahl)
        lagers = read_lagers()
        l_ids = Int[]
        for i in keys(lagers)
            l = lagers[i]
            if artikel in keys(l) && l[artikel] >= anzahl
                push!(l_ids,i)
            end
        end
        return l_ids
    end
end

# Schreibe eine Funktion die den gesamtbestand Berechnet
@Aufgabe "14.3.3" begin
    using CSV
    function read_lagers()
        path = "14-3"
        files = readdir(path)
        output = Dict{Int,Dict{String, Int}}()
        for f in files
            bestand = Dict{String,Int}()
            data = CSV.File(joinpath(path,f))
            for row in data
                if !(row.Artikel in keys(bestand)) 
                    bestand[row.Artikel] = 0
                end
                bestand[row.Artikel] += row.Bestand
            end
            output[parse(Int,f[6:end-4])] = bestand
        end
        return output
    end
    function gesamt_bestand()
        lagers = read_lagers()
        bestand = Dict{String,Int}()
        for i in keys(lagers)
            l = lagers[i]
            for k in keys(l)
                (k in keys(bestand)) || (bestand[k] = 0)
                bestand[k] += l[k]
            end
        end
        return bestand
    end
end

JuliaSkriptumKontrolle.status()
