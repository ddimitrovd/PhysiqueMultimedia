% fi is the angle projected on the x axis, Lx and Lz are source position of the line/ray
% d is the scalar perpendicular distance between the incoming ray line source and the
% intersected line
%                     |
%   Lx,Lz______d______|
%       \  fi         |
%        \            |
%         \           |
%          \          |
%           \         |
%            \        |
%             \       |
%              \      |
%               \     |
%                \    |
%                 \   |
%                  \  |
%                   \ |
%                    \|
%                     INTERSECT (z)
%!!!!!! obviusely fi between pi/2 and 3pi/4 does not work correctly !!!!!!!!!
function [z] = linesIntersectZ(fi, Lx, Lz, d)
  
  a = pi/2 - fi;
  dz = (d / sin(a)) * sin(fi);
 
  z = Lz + dz; 

endfunction