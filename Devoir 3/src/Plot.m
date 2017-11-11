function Plot(xA, yA, xB, yB, titre)   
 
    figure('Name', titre) ;
    hold on;
    plot(xA ,yA,'linewidth', 2, 'b');
    hold on  ;
    plot(xB, yB,'linewidth', 2, 'r');
    
    title(titre); 
    % legend('Table', 'Voiture A', 'Voitue B');
    xlim([-5 105]);
    ylim([-5 105]);
    xlabel('X');
    ylabel('Y');
end