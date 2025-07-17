function tourDist = tourDistance(tour, cities)
    n = length(tour);
    tourDist = 0;

    % path
    for i = 1:(n-1)
        tourDist = tourDist + norm(cities(tour(i), :) - cities(tour(i+1), :));
    end

    % last point to init point
    tourDist = tourDist + norm(cities(tour(n), :) - cities(tour(1), :));
end

