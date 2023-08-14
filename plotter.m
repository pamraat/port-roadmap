clear

%% Sphere World
% hw6Sphere = readmatrix("hw6Sphere.txt");
% hold on
% for i=1:size(hw6Sphere, 1)
%     circle([hw6Sphere(i, 1) hw6Sphere(i, 2)], hw6Sphere(i, 3), 1000, {'LineWidth', 1, 'LineStyle', '-', 'Color', 'black'});
% end
% hold off
% title("Sphere World", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% xlim([0 100])
% ylim([0 100])
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500]);

%% PotentialPlot
% hw6Sphere = readmatrix("hw6Sphere.txt");
% goal = [30 40];
% Q = 1;
% c_att = 0.1;
% c_rep = 100;
% x = linspace(10, 90, 200)';
% y = linspace(10, 90, 200)';
% 
% potentialPlot(hw6Sphere, goal, c_att, c_rep, Q, [x y]);

%% Potential Trajectory
% hw6Sphere = readmatrix("hw6Sphere.txt");
% goal = [30 40];
% Q = 10;
% c_att = 0.1;
% c_rep = 100;
% 
% pos(1, :) = [80 55];
% dt = 0.1;
% 
% while norm(pos(end, :) - goal) > 1e-2
%     [~, grad_U] = potentialPoint(hw6Sphere, goal, c_att, c_rep, Q, pos(end, :));
%     pos(end + 1, :) = pos(end, :) - grad_U*dt;
% end
% 
% hold on
% for i=1:size(hw6Sphere, 1)
%     circle([hw6Sphere(i, 1) hw6Sphere(i, 2)], hw6Sphere(i, 3), 1000, {'LineWidth', 1, 'LineStyle', '-', 'Color', 'black'});
% end
% plot(pos(:, 1), pos(:,2), 'LineWidth', 1, 'Color', 'red');
% legend('Trajectory using Potential')
% hold off
% title("Robot Trajectory in Sphere World", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% xlim([0 100])
% ylim([0 100])
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500]);

%% potentialPlanner
% map = [0 0 5;
%        2.5 -2.52 1.4697/2;
%        0.026 2.99 2.8045/2
%        -2.974 -2 2.8666/2];
% goal = [0 0];
% Q = 1;
% c_att = 10;
% c_rep = 1;
% x = linspace(-5, 5, 200)';
% y = linspace(-5, 5, 200)';
% potentialPlot(map, goal, c_att, c_rep, Q, [x y]);

%% potentialPlanner Trajectory
% map = [0 0 5*sqrt(2);
%        2.5 -2.52 1.4697/2;
%        0.026 2.99 2.8045/2
%        -2.974 -2 2.8666/2];
% goal = [0 0];
% Q = 1;
% c_att = 10;
% c_rep = 1;
% x = linspace(-5, 5, 200)';
% y = linspace(-5, 5, 200)';
% 
% global dataStore
% 
% p1 = plot(dataStore.truthPose(:, 2), dataStore.truthPose(:, 3)', 'Linewidth', 1, 'Color', 'blue', 'DisplayName', 'O/H localization');
% hold on
% for i=1:size(map, 1)
%     circle([map(i, 1) map(i, 2)], map(i, 3), 1000, {'LineWidth', 1, 'LineStyle', '-', 'Color', 'black'});
% end
% legend('O/H Localization')
% hold off
% title("Sphere World", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% xlim([-8 8])
% ylim([-8 8])
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500]);

%% Cell decomposition
% lim = [0 0 100 100];
% hw6b = readmatrix("hw6b.txt")';
% [cellDecomp, map] = cellDecomposition(hw6b, lim);
% 
% hold on
% for i = 1:size(cellDecomp, 1)
%     p1 = plot([cellDecomp(i, 1) cellDecomp(i, 3)], [cellDecomp(i, 2) cellDecomp(i, 4)], LineWidth=0.5, Color='red');
% end
% for i = 1:size(map, 1)
%     p2 = plot([map(i, 1) map(i, 3)], [map(i, 2) map(i, 4)], LineWidth=1, Color='black');
% end
% legend([p1 p2], 'Decomposed Cell boundary', 'Map boundary')
% hold off
% title("Map Cellular Decomposition", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500])

%% Roadmap
% lim = [0 0 100 100];
% hw6b = readmatrix("hw6b.txt")';
% [cellDecomp, map] = cellDecomposition(hw6b, lim);
% [nodes, G] = createRoadmap(hw6b, lim);
% hold on
% for i = 1:size(map, 1)
%     p1 = plot([map(i, 1) map(i, 3)], [map(i, 2) map(i, 4)], LineWidth=1, Color='black');
% end
% for i = 1:size(cellDecomp, 1)
%     p3 = plot([cellDecomp(i, 1) cellDecomp(i, 3)], [cellDecomp(i, 2) cellDecomp(i, 4)], LineWidth=0.5, Color='red');
% end
% p2 = plot(G, 'XData', nodes(:, 1), 'YData', nodes(:, 2), 'LineWidth', 1, 'EdgeColor','blue');
% hold off
% legend([p3 p1 p2], 'Decomposed Cell boundary', 'Map boundary', 'Graph')
% hold off
% title("Map Cellular Decomposition", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500])

%% FindPath
% lim = [0 0 100 100];
% hw6b = readmatrix("hw6b.txt")';
% init = [22, 65]; goal = [90, 10];
% [cellDecomp, map] = cellDecomposition(hw6b, lim);
% [nodes, G] = createRoadmap(hw6b, lim);
% [path, G, nodes] = findPath(init, goal, G, nodes, map);
% hold on
% for i = 1:size(map, 1)
%     p2 = plot([map(i, 1) map(i, 3)], [map(i, 2) map(i, 4)], LineWidth=1, Color='black');
% end
% for i = 1:size(cellDecomp, 1)
%     p1 = plot([cellDecomp(i, 1) cellDecomp(i, 3)], [cellDecomp(i, 2) cellDecomp(i, 4)], LineWidth=0.5, Color='red');
% end
% h = plot(G, 'XData', nodes(:, 1), 'YData', nodes(:, 2), 'LineWidth', 1, 'EdgeColor','blue');
% highlight(h, path, 'NodeColor', 'magenta', 'EdgeColor','green', 'LineWidth', 1);
% hold off
% legend([p1 p2 h], 'Decomposed Cell boundary', 'Map boundary', 'Graph', 'Shortest Path')
% hold off
% title("Map Cellular Decomposition", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500])

%% RRT Point Robot
% lim = [0 0 100 100];
% hw6b = readmatrix("hw6b.txt")';
% init = [20, 65]; goal = [90, 10];
% step = 10; 
% [~, map] = cellDecomposition(hw6b, lim);
% [wayPoints, G, nodes] = buildRTTpoint(init, goal, step, hw6b, lim); 
% hold on
% for i = 1:size(map, 1)
%     plot([map(i, 1) map(i, 3)], [map(i, 2) map(i, 4)], LineWidth=1, Color='black');
% end
% p1 = plot(wayPoints(:, 1), wayPoints(:, 2), 'LineWidth', 1, 'Color', 'red');
% p2 = scatter(wayPoints(1, 1), wayPoints(1, 2), 'Marker', 'square', 'MarkerFaceColor', 'green');
% p3 = scatter(wayPoints(2:end-1, 1), wayPoints(2:end-1, 2), 'filled', 'MarkerFaceColor','blue');
% p4 = scatter(wayPoints(end, 1), wayPoints(end, 2), 'Marker', 'diamond', 'MarkerFaceColor', 'cyan');
% hold off
% legend([p1 p2 p3 p4], 'WayPoints', 'Starting Point', 'Intermediate Nodes', 'Goal');
% hold off
% title("Map Cellular Decomposition", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500])

%% RRT Finite Robot
% lim = [0 0 100 100];
% hw6b = readmatrix("hw6b.txt")';
% init = [80, 95]; goal = [10, 50];
% step = 10;
% [~, map] = cellDecomposition(hw6b, lim);
% robotRad = 0.2;
% wayPoints = buildRTT(init, goal, step, robotRad, hw6b, lim); 
% hold on
% for i = 1:size(map, 1)
%     plot([map(i, 1) map(i, 3)], [map(i, 2) map(i, 4)], LineWidth=1, Color='black');
% end
% plot(wayPoints(:, 1), wayPoints(:, 2), 'LineWidth', 1, 'Color', 'red');
% scatter(wayPoints(1, 1), wayPoints(1, 2), 'Marker', 'square', 'MarkerFaceColor', 'green')
% scatter(wayPoints(2:end-1, 1), wayPoints(2:end-1, 2), 'filled', 'MarkerFaceColor','blue')
% scatter(wayPoints(end, 1), wayPoints(end, 2), 'Marker', 'diamond', 'MarkerFaceColor', 'cyan')
% hold off

%% RRT Planner
% global dataStore
% load cornerMap.mat
% [minX, maxX] = bounds([map(:, 1); map(:, 3)]); [minY, maxY] = bounds([map(:, 2); map(:, 4)]);
% lim = [minX minY maxX maxY];
% init = [2, -2];
% goal = [2, 2.5];
% step = 0.5;
% robotRad = 0.2;
% map = map(1:end-4, :);
% polymap = [map (map(:, 3:4) + [0.1 0.1]) (map(:, 1:2) + [0.1 0.1])];
% wayPoints = buildRTT(init, goal, step, robotRad, polymap', lim); 
% hold on
% for i = 1:size(map, 1)
%     plot([map(i, 1) map(i, 3)], [map(i, 2) map(i, 4)], LineWidth=1, Color='black');
% end
% p1 = plot(wayPoints(:, 1), wayPoints(:, 2), 'LineWidth', 1, 'Color', 'red');
% p2 = plot(dataStore.truthPose(:, 2), dataStore.truthPose(:, 3)', 'Linewidth', 1, 'Color', 'blue', 'DisplayName', 'O/H localization');
% p3 = scatter(wayPoints(1, 1), wayPoints(1, 2), 'Marker', 'square', 'MarkerFaceColor', 'green');
% p4 = scatter(wayPoints(2:end-1, 1), wayPoints(2:end-1, 2), 'filled', 'MarkerFaceColor','blue');
% p5 = scatter(wayPoints(end, 1), wayPoints(end, 2), 'Marker', 'diamond', 'MarkerFaceColor', 'cyan');
% hold off
% legend([p1 p2 p3 p4 p2], 'WayPoint Trajectory', 'Starting Point', 'Intermediate Nodes', 'Goal', 'o/H Localization');
% title("Map Cellular Decomposition", "Interpreter","tex");
% xlabel("X (m)");
% ylabel("Y (m)");
% fontsize(gca,14,"points");
% set(gcf, 'Position',  [400, 150, 600, 500])

%% Test function
% lim = [0 0 100 100];
% hw6b = readmatrix("hw6b.txt")';
% init = [20, 65]; goal = [90, 10];
% HW6btest(init, goal, hw6b, lim)