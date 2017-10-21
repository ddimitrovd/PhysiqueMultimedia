function Plot(x1, y1, z1, x2, y2, z2, x3, y3, z3, titre)
    
    longuerTable = 2.74;
    largeurTable = 1.525;
    hauteurTable = 0.76;
  
    largeurFilet = 1.83;
    haureurFilet = 0.1525;
    debordFilet = 0.1525;
    
    TableX = linspace(0,longuerTable,2);
    TableY = linspace(0,largeurTable,2);  
    [TableXX, TableYY] = meshgrid(TableX,TableY);
    TableZZ = [hauteurTable, hauteurTable; hauteurTable, hauteurTable];
    
    FiletX = 1.37;
    FiletXX = [FiletX, FiletX; FiletX, FiletX];
    FiletYY = [hauteurTable, hauteurTable + haureurFilet; hauteurTable, hauteurTable + haureurFilet];
    FiletZZ = [0-debordFilet, 0-debordFilet; largeurTable + debordFilet, largeurTable + debordFilet];
    
    figure('Name', titre) ;
    hold on;
    surface(TableXX,TableYY,TableZZ, 'FaceColor', 'g');
    hold on;
    surface(FiletXX,FiletZZ,FiletYY, 'FaceColor', 'y');
    hold on;
    plot3(x1 ,y1, z1, 'linewidth', 1.8, 'r');
    hold on  ;
    plot3(x2, y2, z2, 'linewidth', 1.8, 'b');
    hold on;
    plot3(x3, y3, z3, 'linewidth', 1.8, 'k');

    
    
    
    title(titre); 
    legend('Table', 'Filet', 'Option 1', 'Option 2', 'Option 3');
    xlim([0 3]);
    ylim([-0.5 2.5]);
    zlim([0 2]);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
end