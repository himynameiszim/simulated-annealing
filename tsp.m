clear; close all; clc;
rng('default');

numCities = 30;
initial_temp = 100;
cooling_rate = 0.995; % alpha
max_iterations = 75000;
cities = zeros(numCities, 2);
angle_step = 2 * pi / ( numCities/2 );

% random cities coordinates
% cities = 100 * rand(numCities, 2); 

% weired cities formed by two roundabouts lol
for i = 1:numCities/2
    angle = (i-1) * angle_step;
    cities(2*i-1, :) = [50 + 45*cos(angle), 50 + 45*sin(angle)];
    angle = angle + angle_step / 2;
    cities(2*i, :) = [50 + 20*cos(angle), 50 + 20*sin(angle)];
end

fprintf('...%d cities...\n', numCities);
fprintf('...List of cities coordinates...\n');
for i = 1:size(cities, 1)
    fprintf('City %2d: (%.2f, %.2f)\n', i, cities(i, 1), cities(i, 2));
end

tic;
[bestTour, bestDistance] = simulatedAnnealing(cities, initial_temp, cooling_rate, max_iterations);
toc;

fprintf('Best tour distance found: %.2f\n', bestDistance);
fprintf('Best tour:\n');
fprintf('%d -> ', bestTour);
fprintf('%d', bestTour(1));

% plot graph
plotTour(cities, bestTour, bestDistance);