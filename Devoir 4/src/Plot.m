function Plot(x, y, z, face, poso, t)   
 
    n = columns(x);
    
    figure('Name', "Figure") ;
    
    for i = 2:n
      color='k';
      switch (face(i))
        case 1
          color = 'r';
        case 2
          color = 'c';
        case 3
          color = 'g';
        case 4
          color = 'y';
        case 5
          color = 'b';
        case 6
          color = 'm';
      endswitch      
      scatter3(x(i) ,y(i), z(i), color, "filled");
      hold on;
    endfor
    
    [x, y, z] = cylinder ([2 2], 30);
    for i = 2:19
      mesh (x + 4, y + 4, z+i, "facecolor", "none", "edgecolor", "black");
      hold on;
    endfor
    
    % observer position
    scatter3(poso(1), poso(2), poso(3), "k", "filled");
    
    title(t);
    xlim([-2 8]);
    ylim([-2 8]);
    zlim([-2 22]);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
end