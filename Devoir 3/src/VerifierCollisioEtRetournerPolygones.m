function [reponse point normaleCollision AX AY BX BY] = VerifierCollisioEtRetournerPolygones(posA, posB, ThetaA, ThetaB)
  
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
  
  A = [AA; AB; AC; AD];
  
  BD = rotateVector([LB/2, -lB/2], ThetaB);
  BD = posB + BD;
  BC = rotateVector([-LB/2, -lB/2], ThetaB);
  BC = posB + BC;
  BB = rotateVector([-LB/2, lB/2], ThetaB);
  BB = posB + BB;
  BA = rotateVector([LB/2, lB/2], ThetaB);
  BA = posB + BA;
  
  B = [BA; BB; BC; BD];
  
  % plygones A et B
  AX = [AA(1), AB(1), AC(1), AD(1)];
  AY = [AA(2), AB(2), AC(2), AD(2)];
  BX = [BA(1), BB(1), BC(1), BD(1)];
  BY = [BA(2), BB(2), BC(2), BD(2)];
  
  % Verifier si A est dans B 
  
  a = A(1,:);
  
  if (IsInPolygon(AA, BX, BY) == 1)
    reponse = 1;
    point = AA;
    normaleCollision = (posB - AA) / norm(posB - AA);
    return
  endif;
  if (IsInPolygon(AB, BX, BY) == 1)
    reponse = 1;
    point = AB;
    normaleCollision = (posB - AB) / norm(posB - AB);
    return
  endif;
  if (IsInPolygon(AC, BX, BY) == 1)
    reponse = 1;
    point = AC;
    normaleCollision = (posB - AC) / norm(posB - AC);
    return
  endif;
  if (IsInPolygon(AD, BX, BY) == 1)
    reponse = 1;
    point = AD;
    normaleCollision = (posB - AD) / norm(posB - AD);
    return
  endif;
  
  % Verifier si B est dans A 
  if (IsInPolygon(BA, AX, AY) == 1)
    reponse = 1;
    point = BA;
    normaleCollision = (posA - BA) / norm(posA - BA);
    return
  endif;
  if (IsInPolygon(BB, AX, AY) == 1)
    reponse = 1;
    point = BB;
    normaleCollision = (posA - BB) / norm(posA - BB);
    return
  endif;
  if (IsInPolygon(BC, AX, AY) == 1)
    reponse = 1;
    point = BC;
    normaleCollision = (posA - BC) / norm(posA - BC);
    return
  endif;
  if (IsInPolygon(BD, AX, AY) == 1)
    reponse = 1;
    point = BD;
    normaleCollision = (posA - BD) / norm(posA - BD);
    return
  endif;
endfunction


function [in] = IsInPolygon(point, XX, YY)
  in = inpolygon(point(1), point(2), XX, YY);
endfunction