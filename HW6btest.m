function HW6btest(init, goal, map, mapBoundary)

lim = mapBoundary;
hw6b = map;
step = 5; 
[~, map] = cellDecomposition(hw6b, lim);
robotRad = 0.2;
wayPoints = buildRTT(init, goal, step, robotRad, hw6b, lim); 
hold on
for i = 1:size(map, 1)
    plot([map(i, 1) map(i, 3)], [map(i, 2) map(i, 4)], LineWidth=1, Color='black');
end
p1 = plot(wayPoints(:, 1), wayPoints(:, 2), 'LineWidth', 1, 'Color', 'red');
p2 = scatter(wayPoints(1, 1), wayPoints(1, 2), 'Marker', 'square', 'MarkerFaceColor', 'green');
p3 = scatter(wayPoints(2:end-1, 1), wayPoints(2:end-1, 2), 'filled', 'MarkerFaceColor','blue');
p4 = scatter(wayPoints(end, 1), wayPoints(end, 2), 'Marker', 'diamond', 'MarkerFaceColor', 'cyan');
hold off
legend([p1 p2 p3 p4], 'WayPoints', 'Starting Point', 'Intermediate Nodes', 'Goal');
title("Map Cellular Decomposition", "Interpreter","tex");
xlabel("X (m)");
ylabel("Y (m)");
fontsize(gca,14,"points");
set(gcf, 'Position',  [400, 150, 600, 500])