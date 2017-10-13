function Plot(x1, y1, z1, x2, y2, z2, x3, y3, z3, titre)
    figure('Name', titre) ;
    scatter3(x1,y1,z1, 0.5, 'r');
    hold on  ;
    scatter3(x2,y2,z2, 0.5, 'b');
    hold on;
    scatter3(x3, y3, z3, 0.5, 'g');
    title(titre);
    legend('Option 1', 'Option 2', 'Option 3');
    %xlim([0 150]);
    %ylim([0 150]);
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
end