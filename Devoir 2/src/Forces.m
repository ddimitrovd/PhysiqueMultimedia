% Foctions pour chercher l'acceleration


% Acceleration on option Grav + Visc
function [ accel ] = Acc2(v, w, m)
    grav = [0,0,-9.8]';   
    friction = Friction(v)/m;
    
    accel = grav+friction;
endfunction


% Acceleration on option Grav + Visc + Magnus
function [ accel ] = Acc3(v, w, m)
    grav = [0,0,-9.8]';
    magnus = Magnus(v,w)/m;
    friction = Friction(v) /m;
    
    accel = gravity+friction+magnus;
endfunction


function [ f ] = Friction(v)
    l = norm(v);
    p= 1.2;
    Cv = 0.14;
    A = pi*(21.35/1000)^2;
    f = - (p*Cv*A/2)*l*v;
endfunction