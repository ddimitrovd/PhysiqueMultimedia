% Acceleration en appliquant la force de friction
function [ accel ] = Acc2(v, w, m, r)
    grav = [0,0,-9.8]';   
    friction = Friction(v, r)/m;
    
    accel = grav+friction;
endfunction