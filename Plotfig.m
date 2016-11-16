function [] = Plotfig(XY, va, vb,unitnm)
%PLOTFIG Summary of this function goes here
%Detailed explanation goes here

dotnm=length(vb);
for i=1:dotnm,
    l=length(vb{i});
    for j=1:l-1,
        plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'g')
        hold on;
    end
    plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'g')
    plot(XY(i,1),XY(i,2),'O','MarkerEdgeColor','y','MarkerFaceColor','y')
    text(XY(i,1),XY(i,2),num2str(i),'FontSize',8);
%     text(XY(i,1),XY(i,2),num2str(unit2cell(i,unitnm)),'FontSize',8);
    % hold on;
end
%     axis equal;
%     axis([0,cellh*celllattx,0,cellv*celllatty]);
end

