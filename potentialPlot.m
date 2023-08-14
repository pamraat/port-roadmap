function potentialPlot(map, goal, c_att, c_rep, Q, point)
    x = point(:, 1)'; y = point(:, 2)';
    X = repmat(x, 1, length(y))'; Y = repelem(y, 1, length(x))';
    for i = 1:length(X)
        [U(i), grad_U(i, :)] = potentialPoint(map, goal, c_att, c_rep, Q, [X(i) Y(i)]);
    end
    XGrid = reshape(X, length(x), length(y))';
    YGrid = reshape(Y, length(x), length(y))';
    U = reshape(U, length(x), length(y))';

%% Plots

    figure(1)
    surface(XGrid, YGrid, U)
    title("Surface Plot of Potential Function", "Interpreter","tex");
    xlabel("X (m)");
    ylabel("Y (m)");
    zlabel("U")
%     xlim([10 90])
%     ylim([10 90])
    fontsize(gca,14,"points");
    set(gcf, 'Position',  [400, 150, 600, 500]);

    figure(2)
    hold on
    contour(XGrid, YGrid, U, 50);
    quiver(X, Y, grad_U(:, 1), grad_U(:, 2), 8);
    for i=1:size(map, 1)
        circle([map(i, 1) map(i, 2)], map(i, 3), 1000, {'LineWidth', 1, 'LineStyle', '-', 'Color', 'black'});
    end
    hold off
    title("Coutour Plot of Potential Function", "Interpreter","tex");
    xlabel("X (m)");
    ylabel("Y (m)");
    legend('Isopotential Contours', 'Potential Gradients');
%     xlim([10 90])
%     ylim([10 90])
    fontsize(gca,14,"points");
    set(gcf, 'Position',  [400, 150, 600, 500]);
end