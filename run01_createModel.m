%% Solow Growth Model 


%% Clear Workspace

close all
clear

if ~exist('mat', 'dir')
    mkdir('mat');
end


%% Load model file 

m = Model.fromFile( ...
    "model-source/solow-growth.model" ...
    , "growth", true ...
);


%% Calibrate model parameters 

m.ss_roc_a = 1.03;
m.ss_roc_n = 1;

m.gamma = 0.60;
m.delta = 0.15;
m.sigma = 0.20;

access(m, "parameter-values")


%% Calculate steady state 

m.a = 1;

[m, exitFlag, info] = steady( ...
    m ...
    ... , "fixLevel", "a" ... => blocks=false by default
    , "saveAs", "model-source/__blazer.md" ...
    , "blocks", false ...
);


%% Homotopy

m1 = m;

for a = 1 : 1 : 3
    m1.a = a;
    m1 = steady(m1, "fixLevel", "a");
end


%% Alternative way of homotopy

m2 = reset(m, "steady");

m2 = alter(m2, 10);
m2.a = 1 : 1 : 10;
m2 = steady(m2, "fixLevel", "a", "previousVariant", true);


%%

% checkSteady(m, "equationSwitch", "steady");
% checkSteady(m, "equationSwitch", "dynamic");

checkSteady(m);

table( ...
    m, ["steadyLevel", "steadyChange", "form", "description"] ...
    , "round", 8 ...
    , "writeTable", "steady.xlsx" ...
)



%% Calculate first-order solution 

m = solve(m)

stationarityStatus = access(m, "is-stationary")


%% Save everything to mat file for future use 

save mat/createModel.mat m

