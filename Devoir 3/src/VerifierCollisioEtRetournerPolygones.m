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
  
  AD = PivoterVecteur([LA/2, -lA/2], ThetaA);
  AD = posA + AD;
  AC = PivoterVecteur([-LA/2, -lA/2], ThetaA);
  AC = posA + AC;
  AB = PivoterVecteur([-LA/2, lA/2], ThetaA);
  AB = posA + AB;
  AA = PivoterVecteur([LA/2, lA/2], ThetaA);
  AA = posA + AA;
  
  A = [AA; AB; AC; AD; AA];
  
  BD = PivoterVecteur([LB/2, -lB/2], ThetaB);
  BD = posB + BD;
  BC = PivoterVecteur([-LB/2, -lB/2], ThetaB);
  BC = posB + BC;
  BB = PivoterVecteur([-LB/2, lB/2], ThetaB);
  BB = posB + BB;
  BA = PivoterVecteur([LB/2, lB/2], ThetaB);
  BA = posB + BA;
  
  B = [BA; BB; BC; BD; BA];
  
  % plygones A et B
  AX = [AA(1), AB(1), AC(1), AD(1)];
  AY = [AA(2), AB(2), AC(2), AD(2)];
  BX = [BA(1), BB(1), BC(1), BD(1)];
  BY = [BA(2), BB(2), BC(2), BD(2)];
  
  % Verifier si A est dans B et trouver la normale de collision
  points = [0, 0];
  for p = 1:4 
    polyX = [posB(1), B(p), B(p+1)];
    polyY = [posB(2), B(p, 2), B(p+1, 2)];
    for i = 1:4
      if (EstDansPolygone(A(i,:), polyX, polyY) == 1)
        reponse = 1;
        normaleCollision = TrouverNormale(posB, B(p,:), B(p+1,:));
        points = [points; A(i,:)];
      endif;
    endfor
  endfor
  
  if (rows(points) > 2) % determiner le point de collision
    point = [(points(2,1) + points(3,1)) / 2, (points(2,2) + points(3,2)) / 2];
  endif
  
  if (reponse == 1)
    point = points(2,:);
    return;
  endif
  
  % Verifier si B est dans A et trouver la normale de collision
  points = [0, 0]; 
  for p = 1:4 
    polyX = [posA(1), A(p), A(p+1)];
    polyY = [posA(2), A(p, 2), A(p+1, 2)];
    for i = 1:4
      if (EstDansPolygone(B(i,:), polyX, polyY) == 1)
        reponse = 1;
        normaleCollision = TrouverNormale(posA, A(p,:), A(p+1,:));
        points = [points; B(i,:)];
      endif;
    endfor
  endfor
  
  if (rows(points) > 2) % determiner le point de collision
    point = [(points(2,1) + points(3,1)) / 2, (points(2,2) + points(3,2)) / 2];
  endif
  
  if (reponse == 1)
    point = points(2,:);
    return;
  endif
  
endfunction


function [in] = EstDansPolygone(point, XX, YY)
  in = inpolygon(point(1), point(2), XX, YY);
endfunction


function [n] = TrouverNormale(pos, A, B)
  milieuAB = [(A(1) + B(1)) / 2, (A(2) + B(2)) / 2];
  n = pos - milieuAB;
  n = n / norm(n);
endfunction