function [ output_args ] = Plotnew(XY, va, vb,sp,la)
%PLOTNEW Summary of this function goes here
%   Detailed explanation goes here

dotnm=length(vb);
for i=1:dotnm,
    l=length(vb{i});
    for j=1:l-1,
        plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'g')
        hold on;
    end
    plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'g')

    text(XY(i,1),XY(i,2),num2str(i),'FontSize',8);


end
for i=1:dotnm,
    l=length(vb{i});
    if(ismember(i,sp))

    for j=1:l-1,
        plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'b')
        hold on;
    end
    plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'b')


        plot(XY(i,1),XY(i,2),'O','MarkerEdgeColor','m','MarkerFaceColor','m')

  end
end


plot([0,la,la,0,0],[0,0,la,la,0]);

end
