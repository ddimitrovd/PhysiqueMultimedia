function [xA yA xB yB] = Devoir3Plot(rai, vai, rbi, vbi, tb)
  
  dt = 0.05;
  T = 0;
  
  vitA = [vai(1), vai(2)];
  vitB = [vbi(1), vbi(2)];
  wA = vai(3);
  wB = vbi(3);
  posA = rai;
  posB = rbi;
  mA = 1540;
  mB = 1010;
  LA = 4.78
  LB = 4.23
  lA = 1.82
  lB = 1.6
  
  % positions angulaires par rapport a l'axe x
  OmegaA = cross([1, 0], vitA);
  OmegaB = cross([1, 0], vitB);
  
  % moment d'inertie
  IA = [(LA*(lA^3)) / 12, ((LA^3)*lA) / 12];
  IB = [(LB*(lB^3)) / 12, ((LB^3)*lB) / 12];

  xA=[posA(1)];
  yA=[posA(2)];
  xB=[posB(1)];
  yB=[posB(2)];
    
  i = 0; % CONDITIONS here 
  while (i < 1000)    % CONDITIONS here 
    % Nouvelle iteration 

    % Vitesse lineaire
    vitA = vitA + Friction(vitA) * dt;
    vitB = vitB + Friction(vitB) * dt;
    % Vitesse angulaire
    wA = wA + (MomenFriction(vitA, LA, lA, mA) / IA) * dt;
    wB = wB + (MomenFriction(vitB, LB, lB mB) / IB) * dt;
    
      
    % Mettre a jour la position   
  
    % Position lineaire  
    posA = posA + vitA * dt;
    posB = posB + vitB * dt;  
    % Position angulaire
    OmegaA = OmegaA + wA * dt;
    OmegaB = OmegaB + wB * dt;
    
    i = i + 1; % CONDITIONS here 
     
    xA=[xA posA(1)];
    yA=[yA posA(2)];
    xB=[xB posB(1)];
    yB=[yB posB(2)];
  endwhile
endfunction