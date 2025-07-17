function neighborTour = randNeighbor(tour)
    n = length(tour);
    idx = randperm(n, 2);
    
    neighborTour = tour;
    neighborTour([idx(1), idx(2)]) = neighborTour([idx(2), idx(1)]);

end