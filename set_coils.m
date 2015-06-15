
function [ x,y,z,X,Y,Z,Px,Py,Pz,Bx,By,Bz ] = set_coils(R,partitions,delta,phi,psi,i1,N )
%set_coils Summary of this function goes here
%   Detailed explanation goes here

[ x,y,z,X,Y,Z,xcl,ycl,zcl,I1 ] = simple_coil_coil_turns (R,partitions,N,i1 );
[Px,Py,Pz,dl1] = traslation_rotation_coil( phi,psi,xcl,ycl,zcl,delta);
[ Bx,By,Bz ] = turn_coils_biot_savart( Px,Py,Pz,X,Y,Z,I1,dl1 ); % This function determine the magnetic field using the Biot-Savart Law caused by une helholzt coil

end

