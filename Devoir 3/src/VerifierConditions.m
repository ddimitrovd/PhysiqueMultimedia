function [reponse AX AY BX BY] = VerifierCollisioEtRetournerPolygones(posA, posB, ThetaA, ThetaB)
  
  reponse = 0;
  
  LA = 4.78;
  LB = 4.23;
  lA = 1.82;
  lB = 1.6;
  
  % Calculer les position des quatres coins de chaque polygone
  % B____________________A
  % |                    |
  % |l        CM         |------>
  % |                    |
  % C__________L_________D
  
  AD = rotateVector([LA/2, -lA/2], ThetaA);
  AD = posA + AD;
  AC = rotateVector([-LA/2, -lA/2], ThetaA);
  AC = posA + AC;
  AB = rotateVector([-LA/2, lA/2], ThetaA);
  AB = posA + AB;
  AA = rotateVector([LA/2, lA/2], ThetaA);
  AA = posA + AA;
  
  BD = rotateVector([LB/2, -lB/2], ThetaB);
  BD = posB + BD;
  BC = rotateVector([-LB/2, -lB/2], ThetaB);
  BC = posB + BC;
  BB = rotateVector([-LB/2, lB/2], ThetaB);
  BB = posB + BB;
  BA = rotateVector([LB/2, lB/2], ThetaB);
  BA = posB + BA;
  
  % plygones A et B
  AX = [AA(1), AB(1), AC(1), AD(1)];
  AY = [AA(2), AB(2), AC(2), AD(2)];
  BX = [BA(1), BB(1), BC(1), BD(1)];
  BY = [BA(2), BB(2), BC(2), BD(2)];
  
  
  % Verifier si A est dans B 
  isA = IsInPolygon(AA, BX, BY);
  isB = IsInPolygon(AB, BX, BY);
  isC = IsInPolygon(AC, BX, BY);
  isD = IsInPolygon(AD, BX, BY);
  if (isA == 1 || isB == 1 || isC == 1 || isD == 1) 
    reponse = 1;
    return
  endif
  
    % Verifier si B est dans A 
  isA = IsInPolygon(BA, AX, AY);
  isB = IsInPolygon(BB, AX, AY);
  isC = IsInPolygon(BC, AX, AY);
  isD = IsInPolygon(BD, AX, AY);
  if (isA == 1 || isB == 1 || isC == 1 || isD == 1) 
    reponse = 1;
    return
  endif
endfunction


function [in] = IsInPolygon(point, XX, YY)
  in = inpolygon(point(1), point(2), XX, YY);
endfunction