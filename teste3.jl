using DifferentialEquations
using Plots

Rs = 1 #Raio de Schwarzschild
x0 = 15 #Distância horizontal
radious = 1.5*Rs
b = 7.16 #parâmetro de impacto
tau = 50.0 #Tempo próprio
function Orbit(dy,x,p,t)
    dy[1] = -(Rs/(Rs*x[4] -x[4]*x[4]))*x[1]*x[3]
    dy[2] = x[1]
    dy[3] = -0.5*(Rs/(x[4]^2) -(Rs^2)/(x[4]^3))*x[1]^2 -0.5*(-Rs/(x[4]-Rs)^2 + Rs^2/(x[4]*(x[4]-Rs)^2))*x[3]^2-(Rs-x[4])*x[5]^2
    dy[4] = x[3]
    dy[5] = -(2/x[4])*x[3]*x[5]
    dy[6] = x[5]
   end

    tspan = (0.0,tau)
    ci = [1/sqrt(1-Rs/sqrt(x0^2+b^2)), 0, -x0/sqrt(x0^2+b^2), sqrt(x0^2+b^2), 0.004, acos(x0/sqrt(x0^2+b^2))]
    prob = ODEProblem(Orbit,ci,tspan)
    soli = solve(prob,AutoTsit5(Rosenbrock23()),reltol=1e-8, abstol=1e-8)

R = soli[4,:]
Theta = soli[6,:]
X = R.*cos.(Theta)
Y = R.*sin.(Theta)
Z = range(0.0, 6.28, length=length(Theta))
Xn = Rs*cos.(Z)
Yn = Rs*sin.(Z)
dim = 5*Rs
plot(X,Y, label = "Trajetória")
plot!(Xn,Yn, label = "Buraco Negro",line=(:black, 1),fill=(0, :Black))
plot!(xlim=(-dim,dim))
plot!(ylim=(-dim,dim))
plot!(aspect_ratio=:equal)