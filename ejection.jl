using Plots
backend(:plotly)
using LinearAlgebra
global g = 9.81
h0 = 0.2
m = 1
Matriz = Array(zeros(100))
b = reshape(Matriz,10,10)
function add(i,j,massa,h0)
    global b[i,j] = 400*(h0-0.2)^2/(2*g*massa)
end

function passador(i,j,m,h0)
    return add(i,j,m,h0)
end

for a in 1:1:10
    for b in 1:1:10
        passador(a,b,m,h0)
        global m = m + 0.1
    end
    global h0 = h0 + 0.05
end
p = heatmap(b)
plot(p)
#plot(p, xlabel = "Massa1", ylabel = "Posição inicial da mola", zlabel = "Altura")
#gui(p)