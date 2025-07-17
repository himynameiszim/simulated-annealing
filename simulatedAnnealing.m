function [bestTour, bestEnergy] = simulatedAnnealing(cities, T0, alpha, maxIter)
    T = T0;
    n = size(cities, 1);

    currentTour = randTour(n);
    bestTour = currentTour;

    currentEnergy = tourDistance(currentTour, cities);
    bestEnergy = currentEnergy;

    for i = 1:maxIter
        neighborTour = randNeighbor(currentTour);
        neighborEnergy = tourDistance(neighborTour, cities);

        deltaEnergy = neighborEnergy - currentEnergy;
        if ( deltaEnergy < 0 ) || (rand() < exp(-1 * deltaEnergy / T))
            currentTour = neighborTour;
            currentEnergy = neighborEnergy;
        end

        if currentEnergy < bestEnergy
            bestTour = currentTour;
            bestEnergy = currentEnergy;
        end

        % cooling
        T = T * alpha;
    end
end


