function [pcmNL, INL, alphaNL ] = Devoir1 (AngRot, vangulaire, forces, posNL)
  # Constantes
  r1N=3.5;
  h1N=27.93;
  h2N=9.31;
  r2N=r1N;
  mN=109;
  
  r1P=1.855;
  h1P=39.9;
  h2P=5.6;
  r2P=r1P;
  mP=469;
  
  hR=46.9;
  r1R=4.2;
  h1R=39.1;
  h2R=7.8;
  r2R=r1R;
  m1R=108;
  m2R=631;
  
  
  # Calcul de centre de masse
  
  # Navette 
  # Navette partie 1 (cylindre)
  cm1N = CalcCMCylindreVerticalHomogene (0, 0, 0, h1N);
  # Navette partie 2 (cone circulaire)
  cm2N = CalcCMConeCirculaireVerticalHomogene (0,0,h1N,h2N);
  # Centre de masse de la navette
  cmN = CalcCMDeuxObjets(cm1N, cm2N, VolCylindre(h1N, r1N), VolConeCirculaire(h2N, r2N));
  
  # PropulseurGauhe
  # PropulseurGauhe partie 1 (cylindre)
  cm1PG = CalcCMCylindreVerticalHomogene (0-r1R-r1P, 0+r1N+r1R, 0, h1P);
  # PropulseurGauhe partie 2 (cone circulaire)
  cm2PG = CalcCMConeCirculaireVerticalHomogene (0-r1R-r1P, 0+r1N+r1R, h1P, h2P);
  # Centre de masse du PropulseurGauhe
  cmPG = CalcCMDeuxObjets(cm1PG, cm2PG, VolCylindre(h1P, r1P), VolConeCirculaire(h2P, r2P));
  
  # PropulseurDroit
  # PropulseurDroit partie 1 (cylindre)
  cm1PD = CalcCMCylindreVerticalHomogene (0+r1R+r1P, 0+r1N+r1R, 0, h1P);
  # PropulseurDroit partie 2 (cone circulaire)
  cm2PD = CalcCMConeCirculaireVerticalHomogene (0+r1R+r1P, 0+r1N+r1R, h1P, h2P);
  # Centre dePropulseurDroitmasse du PropulseurGauhe
  cmPD = CalcCMDeuxObjets(cm1PD, cm2PD, VolCylindre(h1P, r1P), VolConeCirculaire(h2P, r2P));
  
  # Reservoir
  # Reservoir partie 1 (cylindre hydrogene)
  cm1R = CalcCMCylindreVerticalHomogene (0, 0+r1R+r1N, 0, (2*hR)/3);
  # Reservoir partie 2 (cylindre oxygene)
  cm2R = CalcCMCylindreVerticalHomogene (0, 0+r1R+r1N, (2*hR)/3, h1R-(2*hR)/3);
  # Reservoir partie 3 (cone circulaire oxygene)
  cm3R = CalcCMConeCirculaireVerticalHomogene (0, 0+r1R+r1N, h1R, h2R);
  # Reservoir partie 2 et 3 (oxygene)
  cm23R = CalcCMDeuxObjets(cm2R, cm3R, VolCylindre(h1R-(2*hR)/3, r1R), VolConeCirculaire(h2R, r2R));
  # Centre Reservoir
  cmR = CalcCMDeuxObjets(cm1R, cm23R, m1R, m2R);
  
  # Centre de masse tatal
  cmNR = CalcCMDeuxObjets(cmN, cmR, mN, m1R+m2R);
  cmP = CalcCMDeuxObjets(cmPG, cmPD, mP, mP);
  cm = CalcCMDeuxObjets(cmNR, cmP, mN+m1R+m2R, 2*mP);
  
  pcmNL=cmN;
  
  
  # Moment d'inertie
  
  # Navette 
  volCyl = VolCylindre(h1N, r1N);
  volCon = VolConeCirculaire(h2N, r2N);
  mVol = mN/(volCyl+volCon);
  # Navette partie 1 (cylindre)
  mCyl=mVol*volCyl;
  mCon=mVol*volCon;
  Icyl=[(mCyl/4)*(r1N^2) + (mCyl/12)*(h1N^2), 0, 0;
        0, (mCyl/4)*(r1N^2) + (mCyl/12)*(h1N^2), 0;
        0, 0, (mCyl/2)*(r1N^2)];
        
  IcylN = Icyl + mCyl*InertiaMatrix(cmN-cm1N);
        
  # Navette partie 2 (cone circulaire)
  Icon=mCon*[(12*(r2N^2) + 3*(h2N^2))/80, 0, 0;
        0, (12*(r2N^2) + 3*(h2N^2))/80, 0;
        0, 0, 3*(r2N^2)/10];
   
  IconN = Icon + mCon*InertiaMatrix(cmN-cm2N);
  
  # Moment d'inertie navette relative a son cnetre de masse
  INL = IcylN+IconN;
  
  
  
  
  

  
  alphaNL=3;
endfunction

function cm = CalcCMCylindreVerticalHomogene (baseX, baseY, baseZ, hauteur)
  cmX=baseX;
  cmY=baseY;
  cmZ=baseZ+hauteur/2;
  cm=[cmX, cmY, cmZ];
endfunction

function cm = CalcCMConeCirculaireVerticalHomogene (baseX, baseY, baseZ, hauteur)
  cmX=baseX;
  cmY=baseY;
  cmZ=baseZ+(hauteur/4);
  cm=[cmX, cmY, cmZ];
endfunction

function cm = CalcCMDeuxObjets (cm1, cm2, m1, m2)
  cm = (cm1*m1+cm2*m2)/(m1+m2);
endfunction

function v = VolCylindre (h, r)
  v = (r^2)*pi*h;
endfunction

function v = VolConeCirculaire (h, r)
  v = (pi/3)*(r^2)*h;
endfunction

function I = InertiaMatrix (d)
  I=[d(2)^2+d(3)^2, -d(1)*d(2), -d(1)*d(3);
     -d(2)*d(1), d(1)^2+d(3)^2, -d(2)*d(3);
     -d(3)*d(1), -d(3)*d(2), d(1)^2+d(2)^2]
endfunction