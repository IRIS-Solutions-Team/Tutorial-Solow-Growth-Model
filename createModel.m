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
m.ss_roc_n = 1.01;

m.gamma = 0.60;
m.delta = 0.15;
m.sigma = 0.20;

access(m, "parameter-values")


%% Calculate steady state 

m.a = 1 + 1.05i;
m.n = 1 + 1.03i;

[m, status, info] = steady( ...
    m ...
    , "fixLevel", ["a", "n"] ...
    , "saveAs", "model-source/steady-blazer.md" ...
    , "blocks", true ...
);

m.ss_roc_a = 1.02;
m.ss_roc_n = 1.01;

[m, status, info] = steady( ...
    m ...
    , "fixLevel", ["a", "n"] ...
);

checkSteady(m, "equationSwitch", "steady");
checkSteady(m, "equationSwitch", "dynamic");

table(m, ["steadyLevel", "steadyChange", "form", "description"] ...
    , "round", 8 ...
    , "writeTable", "steady.xlsx" ...
)


%% Calculate first-order solution 

m = solve(m)


%% Save everything to mat file for future use 

save mat/createModel.mat m


