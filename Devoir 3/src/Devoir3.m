function [Coll tf raf vaf rbf vbf] = Devoir3(rai, vai, rbi, vbi, tb)
  
  dt = 0.002;
  T = 0;
  
  vitA = vai;
  vitB = vbi;
  posA = rai;
  posB = rbi;
  mA = 1540;
  mB = 1010;
  LA = 4.78
  LB = 4.23
  lA = 1.82
  lB = 1.6
  
    
  i = 0; % CONDITIONS here 
  while (i > 100)    % CONDITIONS here 
    % Nouvelle iteration 

    vitA = RungeKutta (vit, wbi, dt, m, r, @Acc2);
    vitB = RungeKutta (vit, wbi, dt, m, r, @Acc2);
      
    % Mettre a jour la position     
    posA = posA + vitA*dt;
    posB = posB + vitB*dt;
    
    i = i + 1; % CONDITIONS here 
  endwhile
endfunction