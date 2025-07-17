function plotTour(cities, tour, distance)
    % tour traversal plot
    
    figure;
    hold on;

    % all cities as red dots
    plot(cities(:,1), cities(:,2), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
    title(['BestTour (Distance: ' num2str(distance, '%.2f') ')']);
    xlabel('X Coordinate');
    ylabel('Y Coordinate');
    axis equal; grid on;
    
    tourPath = [tour, tour(1)];
    for i = 1:length(tour)
        p1_idx = tourPath(i);
        p2_idx = tourPath(i+1);
        
        segment = cities([p1_idx, p2_idx], :);
        
        plot(segment(:,1), segment(:,2), 'b-o', 'LineWidth', 2, 'MarkerFaceColor', 'b');
        drawnow;
        
        % pause for dramatic effect lol
        pause(0.3);
    end
    hold off;
end