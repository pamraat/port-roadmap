function [cellDecomp, mapLine] = cellDecomposition(map, lim)
    map = [map; zeros(4, size(map, 2))];
    for i = 1:size(map, 2)
        map(find(map(:, i) == 0, 2), i) = [map(1, i); map(2, i)];
    end
    for i = 4:2:size(map, 2)*size(map, 1)
        id(i/2 - 1, 1) = floor(i/size(map, 1)) + 1;
        mapLine(i/2 - 1, :) = map(i-3:i);
    end
    id = id(all(mapLine, 2)); mapLine = mapLine(all(mapLine, 2), :);
    mapLine = [[lim(1) lim(2) lim(3) lim(2); lim(3) lim(2) lim(3) lim(4); lim(3) lim(4) lim(1) lim(4); lim(1) lim(4) lim(1) lim(2)]; mapLine];
    x = mapLine(5:end, 1); y = mapLine(5:end, 2);
    cellDecomp = [];
    for i = 1:length(x)
        d1 = depthPredict([x(i), y(i), pi/2], mapLine, [0 0], 0);
        d2 = depthPredict([x(i), y(i), -pi/2], mapLine, [0 0], 0);
        [in1, ~] = inpolygon(x(i), y(i) + 0.01, x(id == id(i)), y(id == id(i)));
        [in2, ~] = inpolygon(x(i), y(i) - 0.01, x(id == id(i)), y(id == id(i)));
        if(~in1), cellDecomp = [cellDecomp; [x(i) y(i) + d1 x(i) y(i)]]; end
        if(~in2), cellDecomp = [cellDecomp; [x(i) y(i) x(i) y(i) - d2]]; end
    end
    [~, iCell] = sort(cellDecomp(:, 1)); cellDecomp = cellDecomp(iCell, :);
end