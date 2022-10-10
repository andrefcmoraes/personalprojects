using Plots, LinearAlgebra, DifferentialEquations
m0 = 1.0
m1 = 0.856
rho = 1.225
As = pi*(0.344)^2
Cd = 0.15
ve = 980.0
tq = 0.63
tm0 = 0.14
tm1 = 0.32
g = 9.81
tf = 5.0
tm(t) = tm0 + ((tm1-tm0)/tq)*t
m(t) = m0-((m0-m1)/tq)*t
f(v,p0,t) = ve*tm(t)/m(t) -g -(1/2)*(rho*As*Cd*v^2)/m(t)
v0 = 0.0
tspan = (0.0,tq)
prob = ODEProblem(f,v0,tspan)
sol = solve(prob, Vern9(), reltol=1e-8, abstol=1e-8, saveat=0.01)
R = sol[1,:]
function h(v,p1,t)
    if lua(t) > 0.0
        -g -(1/2)*(rho*As*Cd*v^2)/m1
    else
        -g +(1/2)*(rho*As*Cd*v^2)/m1
    end
end
#h(v,p1,t) = -g -(1/2)*(rho*As*Cd*v^2)/m1
v1 = maximum(R)
ttspan = (tq,tf)
prob = ODEProblem(h,v1,ttspan)
lua = solve(prob, Vern9(), reltol=1e-8, abstol=1e-8, saveat=0.01)
RR = lua[1,:]
t = LinRange(0.1,tq,length(R))
tt = LinRange(tq,tf,length(RR))
plot(t,R,linewidth=2)
plot!(tt,RR,linewidth=2)