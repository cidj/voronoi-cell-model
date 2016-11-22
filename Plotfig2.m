function [] = Plotfig2(XY,lengtha,lengthb,unitnm)
%PLOTFIG Summary of this function goes here
%Detailed explanation goes here
dotnm=length(XY);
XY_ext=ext9(lengtha,lengthb,XY);
[va,vb]=voronoin(XY_ext);
% vb=dex9(vb_ext,dotnm);
cellnm=dotnm/unitnm;
dotnm_ext=dotnm*9;

for i=1:dotnm_ext,
    l=length(vb{i});
    for j=1:l-1,
        plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'g')
        hold on;
    end
    plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'g')
    plot(XY_ext(i,1),XY_ext(i,2),'O','MarkerEdgeColor','y','MarkerFaceColor','y')
    %     text(XY_ext(i,1),XY_ext(i,2),num2str(i),'FontSize',8);
    %     text(XY_ext(i,1),XY_ext(i,2),num2str(unit2cell(i,unitnm)),'FontSize',8);
    if(inregion(XY_ext(i,1),XY_ext(i,2),0,lengtha,0,lengthb)),
        text(XY_ext(i,1),XY_ext(i,2),num2str(reducepe(unit2cell(i,unitnm),cellnm)),'FontSize',8);
    end
    % hold on;
end
%     axis equal;
%     axis([0,cellh*celllattx,0,cellv*celllatty]);
end
