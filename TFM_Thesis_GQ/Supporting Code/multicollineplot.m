function multicollineplot(x,y,col) 

    mapping = jet(100); 

    colvec=zeros(length(col),3); 
    for j=1:length(col) 
        colvec(j,:) = mapping(ceil(col(j)*100) ,:); 
    end

     
    for index=1:length(x)-1 
        hold on
        plot(x(index:index+1),y(index:index+1) ,... 
            'color',colvec(index ,:))
        hold off 
    end
    

end
