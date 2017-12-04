function Plot(x, y, z, face)   
 
    n = columns(x);
    
    figure('Name', "Figure") ;
    
    for i = 2:n
      scatter3(x(i) ,y(i), z(i), face(i), "filled");
       hold on;
    endfor
    
    [x, y, z] = cylinder ([2 2], 30);
    for i = 2:19
      mesh (x + 4, y + 4, z+i, "facecolor", "none", "edgecolor", "black");
      hold on;
    endfor
    
    title("Figure");
    xlim([0 8]);
    ylim([0 8]);
    zlim([0 22]);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
end