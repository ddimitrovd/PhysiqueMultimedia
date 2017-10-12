function Plot(pos1, pos2, pos3, titre)
    figure('Name', titre) 
    scatter3(pos1(1),pos1(2),pos1(3), 0.5, 'r')
    hold on  
    scatter3(pos2(1),pos2(2),pos2(3), 0.5, 'b')
    hold on
    scatter3(pos3(1), pos3(2), pos3(3), 0.5, 'black')
    title(titre);
    legend('option 1', 'option 2', 'option 3');
    xlim([0 150]);
    ylim([0 150]);
    xlabel('X');
    ylabel('Y')
    zlabel('Z')
end