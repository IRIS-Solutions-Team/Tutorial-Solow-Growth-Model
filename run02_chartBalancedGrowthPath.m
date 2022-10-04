%% Visualize BGP


%% Clear workspace

close all
clear

load mat/createModel.mat m


%% Plot BGP lines for a selection of variables

d = databank.forModel(m, 1:20);
x = databank.toSeries(d, ["n", "y", "a", "yy", "k_to_y"], 1:20);

figure();
plot(1:20, x, "lineWidth", 3);
set(gca(), "xTickLabels", [], "yTickLabels", []);
visual.highlight(3);
visual.highlight(10);


