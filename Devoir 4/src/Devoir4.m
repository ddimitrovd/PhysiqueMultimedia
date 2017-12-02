function [xi yi zi face] = Devoir4(nout, nin, poso)
  
  cylSectionX = 4
  cylSectionY = 4
  cylR = 2;
  
  posX = poso(1);
  posY = poso(2);
  posZ = poso(3);
  
  % margin angles
  %[theta phi] = maxAngle(poso)
  
  % Ray angular
  polar = 0.2;
  azim = pi/2 - pi/4;
  
  % Ray vector
  rayX = sin(azim)*cos(polar);
  rayY = sin(azim)*sin(polar);
  rayZ = cos(azim);
  
  % XY plane projection intersection
  [x y] = circleLineIntersect(cylSectionX, cylSectionY, cylR, posX, posY, rayX, rayY); 
  % Z value projection intersection 
  distance = sqrt((x - posX)^2 + (y - posY)^2);
  alfa = pi/2 - azim;
  z = linesIntersectZ(alfa, posX, posZ, distance);

  % intersection angle 
  nomV = [cylSectionX-x, cylSectionY-y, 0];
  InV = [rayX, rayY, rayZ];
  angleIn = acos(dot(InV, nomV) / (norm(InV) * norm(nomV)))

endfunction