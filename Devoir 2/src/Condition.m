function [result] = Condition(position)
  %Vérifie les conditions d'arrêt de la balle
  % -1: la balle continue de bouger
  %0: le coup est réussi
  %1: le coup échoue et la balle la table du côté du joueur
  %2: le coup échoue et la balle touche le filet
  %3: le coup échoue et la balle touche le sol
   Rb = 0.0199;
   
   Ht = 0.76;
   LoT = 2.74;
   LaT = 1.525;
   
   Hf = 0.1525;
   Lf = 1.83;
   Df = 0.1525;
   
  
   % La balle touche la table
   if((position(1) >= Rb && position(1) <= LoT + Rb )&& 
      ( position(2) >= - Rb && position(2) <= LaT + Rb) && 
      ( position(3) >= Ht + Rb))
        % du coté de l'adversaire
        if( position(1) > LoT / 2 + Rb)
          result = 0;
         % du coté du joueur
        else 
          result = 1;
        endif
          
   % La balle touche le filet 
   elseif((position(1) = LoT / 2 - Rb) && 
      ( position(2) >= -Df - Rb && position(2) <= Lf - Df + Rb) && 
      ( position(3) >= Ht + Rb && position(3) <= Ht + Hf + Rb ))
      result = 2;
      
     % La balle touche le sol 
   elseif(( position(2) < - Rb && position(2) > LaT + Rb) && 
      ( position(3) >= Rb))
       result = 3;
   else
      result = -1;
   endif
      
end;