function [Coll tf raf vaf rbf vbf] = Devoir3(rai, vai, rbi, vbi, tb)
  
  dt = 0.01;
  tf = 0;
  
  vitA = [vai(1), vai(2)];
  vitB = [vbi(1), vbi(2)];
  wA = vai(3);
  wB = vbi(3);
  posA = rai;
  posB = rbi;
  mA = 1540;
  mB = 1010;
  LA = 4.78;
  LB = 4.23;
  lA = 1.82;
  lB = 1.6;
  
  % positions angulaires par rapport a l'axe x.
  % Position angulaire 0 est quand la voiture est oriente selon l"axe x
  vecX = [1, 0];
  vecA = norm([vitA(1), vitA(2)]);
  vecB = norm([vitB(1), vitB(2)]);
  ThetaA = atan2(1, 0) - atan2(vitA(1), vitA(2));
  ThetaB = atan2(1, 0) - atan2(vitB(1), vitB(2));
  
  % moment d'inertie polaire z
  IA = [((LA*lA)/12)*((LA^2)+(lA^2))];
  IB = [((LB*lB)/12)*((LB^2)+(lB^2))];

  % donnees pour le plot
  xA=[posA(1)];
  yA=[posA(2)];
  xB=[posB(1)];
  yB=[posB(2)];
  
  % memoriser la position initiale des polygones
  [Coll, point, n, AX1, AY1, BX1, BY1] = VerifierCollisioEtRetournerPolygones(posA, posB, ThetaA, ThetaB);
    
  while (VerifierCollisioEtRetournerPolygones(posA, posB, ThetaA, ThetaB)(1) == 0 && (norm(vitA) > 1 || norm(vitB) > 1))
    % Nouvelle iteration 

    % A vitesses lineaire et angulaire 
    vitA = vitA + Friction(vitA) * dt;
    wA = wA + (MomentFriction(vitA, LA, lA, mA) / IA) * dt;
    
    % B vitesses lineaire et angulaire 
    if (tf > tb)
      vitB = vitB + Friction(vitB) * dt;
      wB = wB + (MomentFriction(vitB, LB, lB, mB) / IB) * dt;
    endif
    
    % A positions lineaire et angulaire 
    posA = posA + vitA * dt;
    ThetaA = ThetaA + wA * dt;
    
    % B positions lineaire et angulaire 
    posB = posB + vitB * dt;  
    if (tf > tb)
      ThetaB = ThetaB + wB * dt;
    endif
    
    % Informations suplementaires
    
    tf = tf + dt;
     
    xA=[xA posA(1)];
    yA=[yA posA(2)];
    xB=[xB posB(1)];
    yB=[yB posB(2)];
  endwhile
  
  % memoriser la position initiale des polygones
  [Coll, point, n, AX2, AY2, BX2, BY2] = VerifierCollisioEtRetournerPolygones(posA, posB, ThetaA, ThetaB);
  
  % si il a eu collision calculer les nouvelles vitesses lineaires et angulaires
  if (Coll == 1)
    [vitA vitB wA wB] = VitesseApresCollision (n, point, posA, posB, wA, wB, vitA, vitB, mA, mB, IA, IB);
  endif
  
  % resultas finaux
  raf = posA;
  rbf = posB;
  vaf = [vitA, wA];
  vbf = [vitB, wB];
    
  % Plot la graphique
  Plot(xA, yA, xB, yB, AX1, AX2, AY1, AY2, BX1, BX2, BY1, BY2);
endfunction