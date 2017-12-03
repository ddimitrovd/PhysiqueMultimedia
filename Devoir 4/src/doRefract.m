% changes values because of a refraction
function [rayIsOut n1 n2 polar azim posX posY posZ] = doRefract(rayIsOut, n1, n2, polar, azim, x, y, z, InV, normV);
   
  % top
  if normV(3) == -1
    polar = pi - asin((n1 * sin(pi-polar)) / n2);
  endif
  
  % bottom
  if normV(3) == 1
    polar = asin((n1 * sin(pi/2-polar)) / n2);
  endif
  
  % side
  if normV(3) == 0
    normVxy = [normV(1), normV(2)];
    InVxy = [InV(1), InV(2)];
    angInxy = acos(real(dot(InVxy, normVxy)) / (norm(InVxy) * norm(normVxy)));
    
    angRefracAzim = asin((n1 * sin(angInxy)) / n2);
    dir = cross([normVxy, 0], [InVxy, 0])(3);
    angRefracAzimFactor = (dir/abs(dir)) * (angRefracAzim - angInxy);
    azim = azim + angRefracAzimFactor;
    
    angRefracPolar = asin((n1 * sin(polar)) / n2);
    if polar > pi/2
      polar = pi/2 + angRefracPolar;
    elseif polar < pi/2
      polar = pi/2 - angRefracPolar;
    endif
  endif
  
  % set new values
  if rayIsOut == 1
    rayIsOut = 0;
  else 
    rayIsOut = 1;
  endif
  
  ntemp = n2;
  n2 = n1;
  n1 = ntemp;
  
  posX = x;
  posY = y;
  posZ = z;
  
endfunction