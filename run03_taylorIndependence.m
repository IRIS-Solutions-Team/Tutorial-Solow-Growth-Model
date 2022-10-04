
close all
clear

load mat/createModel.mat m


m1 = m;
m1.a = 0.9;
m1 = steady(m1, "fixLevel", "a");

m2 = m;
m2.a = 1.1;
m2 = steady(m2, "fixLevel", "a");


y1 = systemMatrices(m1, "forceDiff", true, "normalize", ~true);
y2 = systemMatrices(m2, "forceDiff", true, "normalize", ~true);

y1.A
y2.A
max(abs(y1.A - y2.A))

y1.B
y2.B
max(abs(y1.B - y2.B))

