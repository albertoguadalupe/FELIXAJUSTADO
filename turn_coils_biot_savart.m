function [ Bx,By,Bz ] = turn_coils_biot_savart( xcl,ycl,zcl,X,Y,Z,I1,dl )
%biot_savart.m Summary of this function goes here
% calculate tthe magnetic field in every point

Bx = zeros(size(X));
By=Bx;
Bz=Bx;

for m= 1:length(X)
    for n = 1:length(Y)
        for o = 1:length(Z)
            
            for i = 1:length(dl);
                r = [ X(m,n,o) - xcl(i), Y(m,n,o)-ycl(i), Z(m,n,o)-zcl(i)];
                r_mag = norm(r);
                
                B_tmp = (I1*cross(dl(i,:), r )*1e-7)/r_mag^2;
                
                Bx(m,n,o) = Bx(m,n,o) + B_tmp(1);
                By(m,n,o) = By(m,n,o) + B_tmp(2);
                Bz(m,n,o) = Bz(m,n,o) + B_tmp(3);
                
            end
        end
    end
end

end
