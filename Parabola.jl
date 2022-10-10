using Plots
backend(:plotly)
using QuadGK
D = 152 #mm
xdim = float(D/2)
ymax = float(450)
alfa = float(ymax/xdim^2)
G = 10
f(x) = sqrt(1+(alfa*x)^2)
h = quadgk(f, 0, xdim, rtol=1e-3)[1]
H = LinRange(0, h, 1000)
Y = LinRange(0, ymax, 1000)
array = ones(1000)
X = sqrt.(((xdim)*array).^2-Y/alfa)
C = 2*pi*X
S = C/(2*G)
SH = (h)*ones(1000)
adicionador = ones(1000)
Corte = 2*adicionador + S
dim = S[1]+1
plot(H,S,aspect_ratio = 1, color = :black, linewidth=2)
plot!(H,-S,aspect_ratio = 1, color = :black, linewidth=2)
plot!(H,-Corte,aspect_ratio = 1, color = :black, linewidth=2, linestyle = :dash)
plot!(H,Corte,aspect_ratio = 1, color = :black, linewidth=2, linestyle = :dash)
plot!(SH,S, color = :black, linewidth=1, linestyle = :dash)
plot!(SH,-S, color = :black, linewidth=1, linestyle = :dash)
plot!(ylim=(-dim-2,dim+2), legend = false, showaxis = false, xtickfont = font(5),
ytickfont = font(5))
