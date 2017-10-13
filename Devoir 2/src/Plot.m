function Plot(x1, y1, z1, x2, y2, z2, x3, y3, z3, titre)
    
    X = linspace(0,2.74,2);
    Y = linspace(0,1.525,2); 
    Z = 0.76;   
    [XX, YY] = meshgrid(X,Y);
    ZZ = [Z, Z; Z, Z];
    
    figure('Name', titre) ;
    hold on;
    surface(XX,YY,ZZ);
    hold on;
    plot3(x1 ,y1, z1, 'r');
    hold on  ;
    plot3(x2, y2, z2, 'b');
    hold on;
    plot3(x3, y3, z3, 'g');

    
    
    
    title(titre); 
    legend('Table', 'Option 1', 'Option 2', 'Option 3');
    xlim([0 3]);
    ylim([0 3]);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
end