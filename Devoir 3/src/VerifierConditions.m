function [reponse] = VerifierConditions(posA, posB, ThetaA, ThetaB)
  
  LA = 4.78
  LB = 4.23
  lA = 1.82
  lB = 1.6
  
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

endfunction