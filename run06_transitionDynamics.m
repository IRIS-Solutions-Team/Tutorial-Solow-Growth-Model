%% Simulate different two types of transition dynamics

%% Clear workspace

close all
clear

load mat/createModel.mat m

%% Prepare chartpack

ch = databank.Chartpack;
ch.Range = 0:20;
ch.Round = 8;

ch < access(m, "transition-variables");


%% Increase productivity

d1 = steadydb(m, 1:20);
d1.shk_a(1) = log(1.10);
s1 = simulate(m, d1, 1:20, "prependInput", true);

draw(ch, databank.merge("horzcat", d1, s1));


%% Response to a change in sigma

m2 = m;
m2.sigma = m2.sigma + 0.05;
m2 = steady(m2);
m2 = solve(m2);

d2 = steadydb(m, 1:20);
s2 = simulate(m2, d2, 1:20, "prependInput", true);

draw(ch, databank.merge("horzcat", d2, s2));
