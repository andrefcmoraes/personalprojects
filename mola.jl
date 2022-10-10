using Plots, LinearAlgebra, NumericalIntegration, Polynomials, QuadGK
#backend(:plotly)
function el(k,x0,x1)
    k*(x1-x0)
end
x = abs.(rand(100))
y = el.(0.35,0,x)
t = LinRange(0,100,100000)
#print(integrate(x, y, SimpsonEven()))
f = fit(x, y,1)
function pol(var)
    global b = f[0]
    global a = f[1]
    return a*var + b
end
h = quadgk(f, 0, maximum(x), rtol=1e-3)[1]
print(f)
plot(scatter(x,y))
#plot!(pol.(LinRange(0,100,length(t))),t)
plot!(f)
plot!(ylim = (-5,5))
plot!(xlim = (-5/2,5/2))