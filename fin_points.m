function [  ] = fin_points( x,y,z,Bx_All,By_All,Bz_All )

hold on 
figure('units','normalized','outerposition',[0 0 1 1])
% 
i_mag = find(x == 0);
j_mag = find(y == 0);
k_mag = find(z == 0);
%% find z
comp_bx = Bx_All(i_mag,k_mag,:);
comp_by = By_All(i_mag,k_mag,:);
comp_bz = Bz_All(i_mag,k_mag,:);

comp_bx_vector = [];
for n = 1:length(comp_bx)
    comp_bx_vector = [comp_bx_vector comp_bx(1,1,n)];
end

comp_by_vector = [];
for n = 1:length(comp_bx)
    comp_by_vector = [comp_by_vector comp_by(1,1,n)];
end

comp_bz_vector = [];
for n = 1:length(comp_bz)
    comp_bz_vector = [comp_bz_vector comp_bz(1,1,n)];
end

mag_z_axis = sqrt(comp_bx_vector.^2 + comp_by_vector.^2 + comp_bz_vector.^2);
subplot(2,2,3)
plot(z,mag_z_axis,'b','LineWidth',2);
title('Magnetic Field Intensity Along Z Axis');
xlabel('Position in (m)');
ylabel('Intensity in (T)');
grid on 
% saveas(figure(2),'2_coil_cusp_Z.jpg');

%% find y

comp_bx_2 = Bx_All(i_mag,:,k_mag);
comp_by_2 = By_All(i_mag,:,k_mag);
comp_bz_2 = Bz_All(i_mag,:,k_mag);

comp_bx_vector_1 = [];
for n = 1:length(comp_bx_2)
    comp_bx_vector_1 = [comp_bx_vector_1 comp_bx_2(1,n,1)];
end

comp_by_vector_1 = [];
for n = 1:length(comp_bx_2)
    comp_by_vector_1 = [comp_by_vector_1 comp_by_2(1,n,1)];
end

comp_bz_vector_1 = [];
for n = 1:length(comp_bz_2)
    comp_bz_vector_1 = [comp_bz_vector_1 comp_bz_2(1,n,1)];
end

mag_y_axis_1 = sqrt(comp_bx_vector_1.^2 + comp_by_vector_1.^2 + comp_bz_vector_1.^2);
subplot(2,2,2)
plot(y,mag_y_axis_1);
title('Magnetic Field Intensity Along Y Axis');
xlabel('Position in (m)');
ylabel('Intensity in (T)');
grid on 
% saveas(figure(3),'2_coil_cusp_Y.jpg') 

%% find x

comp_bx_2 = Bx_All(:,j_mag,k_mag);
comp_by_2 = By_All(:,j_mag,k_mag);
comp_bz_2 = Bz_All(:,j_mag,k_mag);

comp_bx_vector_2 = [];
for n = 1:length(comp_bx_2)
    comp_bx_vector_2 = [comp_bx_vector_2 comp_bx_2(n,1,1)];
end

comp_by_vector_2 = [];
for n = 1:length(comp_bx_2)
    comp_by_vector_2 = [comp_by_vector_2 comp_by_2(n,1,1)];
end

comp_bz_vector_2 = [];
for n = 1:length(comp_bz_2)
    comp_bz_vector_2 = [comp_bz_vector_2 comp_bz_2(n,1,1)];
end

mag_x_axis_1 = sqrt(comp_bx_vector_2.^2 + comp_by_vector_2.^2 + comp_bz_vector_2.^2);
subplot(2,2,1)
plot(x,mag_y_axis_1);
title('Magnetic Field Intensity Along X Axis');
xlabel('Position in (m)');
ylabel('Intensity in (T)');
grid on 
% saveas(figure(4),'2_coil_cusp_X.jpg')
hold off
end 