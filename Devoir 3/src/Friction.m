% Retourne l'acceleration resultante dependament de la force de friction par
% rapport a une vitesse
function [a] = Friction(v)
  
  g = 9.8;

   % acceleration
   a = -Mu(v) * g * v / norm(v);
      
endfunction