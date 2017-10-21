% Acceleration on option Grav + Visc + Magnus
function [ accel ] = Acc3(v, w, m, r)
    grav = [0,0,-9.8]';
    magnus = Magnus(v,w,r)/m;
    friction = Friction(v, r) /m;
    
    accel = grav+friction+magnus;
endfunction