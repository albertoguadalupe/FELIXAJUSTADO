function [  ] = demostration_coils_rotation(  )
%demostration_coils_rotation.m
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Felix Ramon Diaz Medero                                                 %
% Nov 11 2014                                                             %
% demostration_coils_rotation.m                                           %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 clear all ;close all; clc;

angle=deg2rad(45);
R = 0.25;
partitions_0 = 24;
N=8;
i1=1;
phi = [0 angle 0 0];
psi = [0 0 0 angle];
Po=[0,0,0];
theta_short = linspace(0,(sqrt(2)/2));

%% the first plot for the rotation for the axis X
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
hold 
for k =1:2
    [ x,y,z,X,Y,Z,xcl,ycl,zcl,I1 ] = simple_coil_coil_turns (R,partitions_0,N,i1 );
    [Px1,Py1,Pz1,dl1] = traslation_rotation_coil( phi(k),psi(k),xcl,ycl,zcl,Po);
end
% Plot the red segment to demostrate the coils rotation 
xcl1 = zeros(size(theta_short)); % Create the x components of the coil to be used
ycl1 = R*cos(theta_short); % Create the y components of the coil to be used 
zcl1 = R*sin(theta_short);

plot3(xcl1', ycl1', zcl1','r','LineWidth',5)
grid on 
axis equal
xlabel('x')
ylabel('y')
zlabel('z')

str1 = '\phi_{zy} \rightarrow';
text(0,.233,.09073,str1,'HorizontalAlignment','right','FontSize',16)
view(90,0)
title( '\phi is the angle between y and z axis when the coil is rotated in the X axis')
hold off 
%% the second plot for the rotation for the axis Y
subplot(1,2,2)
hold on
for k =3:4
    [ x,y,z,X,Y,Z,xcl,ycl,zcl,I1 ] = simple_coil_coil_turns (R,partitions_0,N,i1 );
    [Px1,Py1,Pz1,dl1] = traslation_rotation_coil( phi(k),psi(k),xcl,ycl,zcl,Po);
end
% Plot the red segment to demostrate the coils rotation 
xcl2 = R*cos(theta_short); % Create the x components of the coil to be used
ycl2 = zeros(size(theta_short)); % Create the y components of the coil to be used 
zcl2 = R*sin(theta_short);
 
plot3(xcl2', ycl2', zcl2','r','LineWidth',5)
title( '\psi is the angle between z and x axis when the coil is rotated in the y axis')
view(0,0)
grid on
axis equal
xlabel('x')
ylabel('y')
zlabel('z')

str2 = '\psi_{zx} \rightarrow';
text(0.2372,0,0.07898,str2,'HorizontalAlignment','right','FontSize', 12)
%   oaxes ('origin')
hold off

end

