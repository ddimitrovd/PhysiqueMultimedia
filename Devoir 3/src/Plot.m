function Plot(xA, yA, xB, yB, AX1, AX2, AY1, AY2, BX1, BX2, BY1, BY2)   
 
    figure('Name', "Figure") ;
    hold on;
    fill(AX1,AY1, 'b');
    hold on;
    fill(AX2,AY2, 'b');
    hold on;
    fill(BX1,BY1, 'r');
    hold on;
    fill(BX2,BY2, 'r');
    hold on;
    plot(xA ,yA,'linewidth', 2, 'b');
    hold on  ;
    plot(xB, yB,'linewidth', 2, 'r');
    
    title("Figure");
    xlim([-5 200]);
    ylim([-5 200]);
    xlabel('X');
    ylabel('Y');
end