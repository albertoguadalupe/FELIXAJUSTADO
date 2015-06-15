function [ x,y,z,X,Y,Z,xcl,ycl,zcl,I1 ] = simple_coil_coil_turns ( R,partitions,N,i1 )
% simple_coil_coil_turns 

%% Create a simple coils 

xmax = 1.18;% meters % Maximumim point of the x axis
xmin = -xmax ; % Minimum point of the x axis
x = xmin: (xmax-xmin)/partitions :xmax; % Create the vector equality spaced starting from the xmin and finishing in the xmax for the axis x...
                 % The step size will depend by the resolution that the user will define at the begining of the code (Line 7)
y = x; % Create the same vector crated in the x
z = x; % Create the same vector crated in the x

[X,Y,Z] = meshgrid(x,y,z);% Replicates the grid vectors x,y,z to produce the coordinates of a 3D rectangular grid (X, Y, Z)... 
                          %... The grid vectors x,y,z form the columns of X, rows of Y, and pages of Z respectively. 
theta = 0:2*pi/partitions:2*pi; % Create the vector equality spaced starting from the 0 and finishing in the 360 

xcl = R*cos(theta); % Create the x components of the coil to be used 
ycl = R*sin(theta); % Create the y components of the coil to be used 
zcl = zeros(size(theta)); % Create the z components of the coil to be used. The vector is modify to have the same size than the other vectors so it can be ploted. 

%% Current

I1 = N*i1; % Determine the product of numbers of turns and current of the coils 

end

