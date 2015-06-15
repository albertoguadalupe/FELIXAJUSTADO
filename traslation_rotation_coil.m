function [Px,Py,Pz,dl1] = traslation_rotation_coil ( phi,psi,xcl,ycl,zcl,delta)
% traslation_rotation_coil.m

P = [xcl' ycl' zcl'];
%% -traslation

Rx = [1 0 0; 0 cos(phi) sin(phi); 0 -sin(phi) cos(phi)]; % se cambio el signo 

Ry = [ cos(psi) 0 sin(psi); 0 1 0; -sin(psi) 0 cos(psi)];
 
PRx = P*Rx*Ry;
Px = delta(1)+PRx(:,1)';
Py = delta(2)+PRx(:,2)';
Pz = delta(3)+PRx(:,3)';

plot3(Px,Py,Pz,'LineWidth',3)


%% dl

xtmp1 = [Px(2:length(Px)),Px(1)]; 
dlx1  = xtmp1-Px;
ytmp1 = [Py(2:length(Py)),Py(1)];
dly1  = ytmp1-Py;
ztmp1 = [Pz(2:length(Pz)),Pz(1)];
dlz1  = ztmp1-Pz;
dl1   = [dlx1', dly1', dlz1'];

end 