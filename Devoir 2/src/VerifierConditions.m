function [reponse] = VerifierConditions(pos)
  %0: le coup est réussi
  %1: le coup échoue et la balle la table du côté du joueur
  %2: le coup échoue et la balle touche le filet
  %3: le coup échoue et la balle touche le sol
  
  reponse = -1;
  
  r = 0.0199;
  
  longuerTable = 2.74;
  largeurTable = 1.525;
  hauteurTable = 0.76;
  
  largeurFilet = 1.83;
  haureurFilet = 0.1525;
  debordFilet = 0.1525;
  
  filetYG = largeurTable + debordFilet;
  filetYD = 0 - debordFilet;
  filetZB = hauteurTable;
  filetZH = hauteurTable + haureurFilet;
  
  x = pos(1);
  y = pos(2);
  z = pos(3);
   
  % Verifier si on touche la table du son cote
  if (x < longuerTable/2 - r && x > 0 &&  y < largeurTable && y > 0 && z-r <= hauteurTable)
    reponse = 1;
  % Verifier si on touche le filet
  elseif (x > longuerTable/2 - r && x < longuerTable/2 + r &&  y < filetYG + r && y > filetYD - r && z > filetZB && z < filetZH + r)
    reponse = 2;
  % Verifier si on touche la table du cote oppose
  elseif (x > longuerTable/2 + r && x < longuerTable &&  y < largeurTable && y > 0 && z-r <= hauteurTable)
    reponse = 0;
  % Verifier si on touche le sol
  elseif (z-r <= 0)
    reponse = 3;
  endif
endfunction