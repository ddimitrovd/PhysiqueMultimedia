function [xi yi zi face] = Devoir4(nout, nin, poso)
  
  cylSectionX = 4;
  cylSectionY = 4;
  cylR = 2;
  
  posX = poso(1);
  posY = poso(2);
  posZ = poso(3);
  
  n1 = nout;
  n2 = nin;
  
  rayIsOut = 1;
  
  % margin angles
  %[theta phi] = maxAngle(poso)
  
  % Ray angular
  polar = pi/2;
  azim = 0.5;
  
  % while (COND)
  % Ray vector
  rayX = sin(polar)*cos(azim);
  rayY = sin(polar)*sin(azim);
  rayZ = cos(polar);
  
  % XY plane projection intersection
  [x y] = circleLineIntersect(cylSectionX, cylSectionY, cylR, posX, posY, rayX, rayY, rayIsOut); 
  % Z value projection intersection 
  distance = sqrt((x - posX)^2 + (y - posY)^2);
  alfa = pi/2 - polar;
  z = linesIntersectZ(alfa, posX, posZ, distance);

  % intersection angle XYZ
  nomV = [cylSectionX-x, cylSectionY-y, 0];
  InV = [rayX, rayY, rayZ];
  angIn = acos(dot(InV, nomV) / (norm(InV) * norm(nomV)));
  
  % critical angle
  angCrit = asin(n1/n2);
  
  % refraction or relfection
  nomVxy = [cylSectionX-x, cylSectionY-y];
  InVxy = [rayX, rayY];
  angInxy = acos(dot(InV, nomV) / (norm(InV) * norm(nomV)));
  if n1 > n2 && angIn > angCrit
    % reflection
    angReflecAzim = -angInxy;
    angReflecPolar = -alfa;
    [polar azim posX posY posZ] = deReflect(polar, azim, x, y, z, angReflecAzim, angReflecPolar);
  else
    % refraction
    angRefracAzim = asin((n1 * sin(angInxy)) / n2);
    angRefracPolar = asin((n1 * sin(alfa)) / n2);
    angRefracAzimFactor = (azim / abs(azim)) * (angRefracAzim - angInxy);
    [rayIsOut n1 n2 polar azim posX posY posZ] = doRefract(rayIsOut, n1, n2, polar, azim, x, y, z, angRefracAzimFactor, angRefracPolar);
  endif


  %endwhile
endfunction