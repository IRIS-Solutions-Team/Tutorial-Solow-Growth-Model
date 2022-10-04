%% Comparative static analysis

close all
clear

load mat/createModel.mat m


m1 = m;
m1.gamma = 0.58;
m1 = steady(m1, "fixLevel", "a");

m2 = m;
m2.gamma = 0.62;
m2 = steady(m2, "fixLevel", "a");

table( ...
    [m1, m2], ["steadyLevel", "steadyChange", "form", "description"] ...
    , "round", 8 ...
    , "writeTable", "steady.xlsx" ...
)

