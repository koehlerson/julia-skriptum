using JuliaSkriptumKontrolle

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