using Plots
function new(x)
    return LinRange(1,2*pi,x)
end

function curv(i)
    local X = new(i)
    local Y = cos.(X)
    global P = plot!(X,Y)
end

curv.(10:1:20)
display(P)
