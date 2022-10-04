%% Solution matrices


%% Clear workspace

close all
clear

load mat/createModel.mat m


%% Rectangular solution

s1 = solutionMatrices(m, "triangular", false);

disp(s1.XVector)
size(s1.T)

s1.T(end-3:end, :)


%% Triangular solution

s2 = solutionMatrices(m, "triangular", true);

s2.T(end-3:end, :)

