using Flux

f(x) = 3x^2 + 2x + 1;

df(x) = gradient(f, x)[1];

print(df(3))