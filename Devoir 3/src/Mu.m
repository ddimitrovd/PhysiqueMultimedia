% Retourne coefficient de frottement
function [mu] = Mu(v)
  
   mu = 0.075;
   if (norm(v) < 50)
     mu = 0.15 * (1 - norm(v) / 100);
   endif
      
endfunction