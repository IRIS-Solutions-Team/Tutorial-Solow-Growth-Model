

close all
clear

load mat/createModel.mat m

d = steadydb(m, 1:20);

x = databank.toSeries(d, ["n", "y", "a", "yy", "k_to_y"], 1:20);
figure();
plot(1:20, x);
set(gca(), "xTickLabels", [], "yTickLabels", []);

print -dpng docs/bgp

