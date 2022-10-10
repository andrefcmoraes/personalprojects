using Plots
backend(:plotly)
a = abs.(randn(100))
x = zeros(length(a))
function LidarCalc(x0)
    for i in range(1,length(a))
        global k = 0.35
        x[i] = k*(a[i] - x0)
    end
end

LidarCalc(0)
print(a)
plot(a,x)