function [U, U_grad] = potentialPoint(map, goal, c_att, c_rep, Q, point)
    a = ([map(:, 1) map(:, 2)] - point);
    dist = sum(a.*a, 2).^0.5 - map(:, 3); dist(1) = -dist(1);
    U_rep = 1/2*c_rep.*(1./dist - 1/Q).^2; U_rep(dist > Q) = 0; U_rep(U_rep>50) = 300;
    gradU_rep = (c_rep.*(-1/Q + 1./dist)./dist.^2).*a./sum(a.*a, 2).^0.5; gradU_rep(dist > Q, :) = 0;
    gradU_rep(isnan(gradU_rep)) = 0; gradU_rep(gradU_rep > 500) = 500; gradU_rep(gradU_rep < -500) = -500;
    U_att = 1/2*c_att*norm(point - goal)^2; gradU_att = c_att*(point - goal);
    U = U_att + sum(U_rep); U_grad = gradU_att + sum(gradU_rep, 1);
end