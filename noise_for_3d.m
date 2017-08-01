f = 1300
N = 100000
B = 0.12;

p3d(1,:) = (rand(1, N) .- 1/2) .* 10;
p3d(2,:) = (rand(1, N) .- 1/2 ) .* 10;
p3d(3,:) = (rand(1, N)) .* 50 .+ 1;

u = p3d(1,:);
v = p3d(2,:);
aux = p3d(3,:);

u_left = f * (u./aux);
v_left = f * (v./aux);

baseline_vector = [B;0;0];
p3d_right = p3d .- baseline_vector;

u_right_aux = p3d_right(1,:);
v_right_aux = p3d_right(2,:);
aux_right = p3d_right(3,:);

u_right = f * (u_right_aux./aux_right);
v_right = f * (v_right_aux./aux_right);

noise = randn();
sigma = 5.2;

u_left_noisy = u_left .+ randn() * sigma;
v_left_noisy = v_left .+ randn() * sigma;
 
u_right_noisy = u_right .+ randn() * sigma;
v_right_noisy = v_right .+ randn() * sigma;
 
disparities = -u_right_noisy + u_left_noisy;

%calculate 3d points

new_3d_points_x = B * u_left_noisy ./ disparities;
new_3d_points_y = B * v_left_noisy ./ disparities;
new_3d_points_z = B * f ./ disparities;

new_p3d = [new_3d_points_x; new_3d_points_y; new_3d_points_z];

difference_between_3d = p3d - new_p3d;

%scatter3(difference_between_3d(1,:), difference_between_3d(2,:), difference_between_3d(3,:));

%scatter3(p3d(1,:), p3d(2,:), p3d(3,:));

%scatter3(new_p3d(1,:), new_p3d(2,:), new_p3d(3,:));

hold on;

scatter3(p3d(1,:), p3d(2,:), p3d(3,:));
scatter3(new_p3d(1,:), new_p3d(2,:), new_p3d(3,:));

hold off

disp("The mean : ");
mean(difference_between_3d(:))
disp("The median: ")
median(difference_between_3d(:))
