
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Felix Ramon Diaz Medero                                                 %
% February 13 2014                                                        %
% turn1_coils_prctice.m                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;clc;close all;

%% This GUI(Grafic User Interface) ask the user the quantity of coils and
% the coils partitios 

prompt_1={'Coils','Number of Partitions of the coil','Enter Number of turns:'};

name='Number of Coils ';
numlines=1;
defaultanswer={'2','20','100'};
options.Resize='on';
options.Interpreter='tex';
coils_def=inputdlg(prompt_1,name,numlines,defaultanswer,options);

N = str2num(coils_def{1});
partitions = str2num(coils_def{2});
Nt  = str2num(coils_def{3});

I_All=    [];
Nt_All =  [];
R_All =   [];
Phi_All = [];
Psi_All =  [];
Ot_All =  [];
x_point_All = [];
y_point_All = [];
z_point_All = [];

%% figure
demostration_coils_rotation

for  k = 1:N;
%% Prompt that asks for the input variables
prompt_2 = {'Enter Current:'...
          'Enter coil radius:'...
          'Enter \phi the angle of rotation in the axis X ( Left Plot ) :'...
          'Enter \psi the angle of rotation in the axis Y ( Rigth Plot ) :'...
          'Enter coil center coordinate x(must not exced -.17 to .17 ):'...
          'Enter coil center coordinate y(must not exed -.17 to .17):'...
          'Enter coil center coordinate z(must not exed -.56 to .56 ):'};

name = ['Coil ' num2str(k)];
numlines = 1;
defaultanswers = {'500','.3','0','0', '0', '0', '0.23'};
options.Reize ='on';
opbtions.Interpreter = 'tex';
dialog_box = inputdlg(prompt_2, name, numlines, defaultanswers, options);

%% Creating an if proposition

    I   = str2double(dialog_box{1});
    R   = str2double(dialog_box{2});
    phi = deg2rad(str2num(dialog_box{3}));
    psi  = deg2rad(str2num(dialog_box{4}));
    x_point = str2num(dialog_box{5}); 
    y_point = str2num(dialog_box{6});
    z_point = str2num(dialog_box{7});
   
I_All  = [I_All I ];
Nt_All = [Nt_All Nt];
R_All =  [R_All R];
Phi_All = [Phi_All phi];
Psi_All =  [Psi_All psi];
x_point_All = [x_point_All x_point];
y_point_All = [y_point_All y_point];
z_point_All = [z_point_All z_point];

end  

Bx_All = zeros(size(partitions+1)); % Create a empty matrix to be filled with the data calculated by the for loop
By_All = Bx_All;                    % Create a empty matrix to be filled with the data calculated by the for loop
Bz_All=Bx_All;                      % Create a empty matrix to be filled with the data calculated by the for loop
m = zeros(N+1,9);
figure('units','normalized','outerposition',[0 0 1 1])
hold on
for k = 1:N;
    
    delta = [x_point_All(k) y_point_All(k) z_point_All(k) ];
    [ x,y,z,X,Y,Z,Px,Py,Pz,Bx,By,Bz ] = set_coils( R_All(k),partitions,delta,Phi_All(k),Psi_All(k),I_All(k),Nt_All(k) );
    Bx_All = Bx_All+Bx;
    By_All = By_All+By;
    Bz_All = Bz_All+Bz;
    m((k+1),1) = k; 
    m((k+1),2) = x_point_All(k);
    m((k+1),3) = y_point_All(k); 
    m((k+1),4) = z_point_All(k);
    m((k+1),5) = I_All(k);
    m((k+1),6) = Nt_All(k);
    m((k+1),7) = Phi_All(k);
    m((k+1),8) = Psi_All(k);
    m((k+1),9) = R_All(k);
    
       P(:,1,k) = Px;
        P(:,2,k) = Py;
        P(:,3,k) = Pz;
end
%% the diferents plots that can be used to see the magnetic field
 quiver3(X,Y,Z,Bx_All,By_All,Bz_All,'r'); %  Plots magnetic vectors as arrows with components(Bx,By,Bz) at the points (X,Y,Z).  The matrices X,Y,Z,Bx,By,Bz must all be the same size and contain the corresponding position and magnetic components.
% streamline(X,Y,Z,Bx_All,By_All,Bz_All,'r'); %  Plots magnetic vectors as arrows with components(Bx,By,Bz) at the points (X,Y,Z).  The matrices X,Y,Z,Bx,By,Bz must all be the same size and contain the corresponding position and magnetic components.
view(45,45)
title('Magnetic Field of two coils in mirror')
xlabel('x')
ylabel('y')
zlabel('z')
grid on 
axis equal

figure 
for k = 1:N;
plot3(P(:,1,k),P(:,2,k),P(:,3,k),'LineWidth',3)
hold on
end

%% This funtion is used to determine the magnetic field intensity in the diferent axis
fin_points( x,y,z,Bx_All,By_All,Bz_All );
hold off  

%% SAVE
% filename = [now,'configuration',num2str(coilNumber),'Bx_All','By_All','Bz_All']
% save(filename,'variable
filename = 'B_20pts_500A_.24m';

save ('twocoilsC')
 
