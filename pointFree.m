function free = pointFree(points,map)
    map = map(5:end, :); i = 1; k = 0;
    while k(i) < size(map, 1)
        [~, k(i + 1)] = ismember(map(k(i) + 1, 1:2), map(:, 3:4), 'rows');
        i = i + 1;
    end
    k(1) = 1;
    for i = 2:length(k)
        isFree(:, i - 1) = inpolygon(points(:, 1), points(:, 2), map(k(i - 1):k(i), 1), map(k(i - 1):k(i), 2));
    end
    free = ~any(isFree, 2);
end