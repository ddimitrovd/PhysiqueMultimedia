function Plot()   
 
    figure('Name', "Figure") ;
    [x, y, z] = cylinder ([2 2], 30);
    mesh (x, y, z);
    
    title("Figure");
    %xlim([-5 105]);
    %ylim([-5 105]);
    xlabel('X');
    ylabel('Y');
end