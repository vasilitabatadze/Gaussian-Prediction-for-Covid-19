function value = C(xx,aa,bb,niuniu)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
ah=[1/2 1];
bh=[ niuniu/2 (niuniu+1)/2];
z=-aa*(xx-bb).^2;
value=hypergeom(ah,bh,z)-(2*bb-xx).^(niuniu-1);
%hypergeom(ah,bh,z)
value=value/gamma(niuniu);
end

