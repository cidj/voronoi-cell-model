function [] = Plotfig3(XY,lengtha,lengthb,unitnm)
%PLOTFIG Summary of this function goes here
%Detailed explanation goes here
dotnm=length(XY);
XY_ext=ext9(lengtha,lengthb,XY);
[va,vb]=voronoin(XY_ext);
cellnm=dotnm/unitnm;
dotnm_ext=dotnm*9;

Poneibor_ext=cell(dotnm_ext,1);
for i=1:dotnm_ext,
    for j=i+1:dotnm_ext,
        [is,~,ij]=neiborcp(i,j,vb);
        if(is),
            Poneibor_ext{i}(ij(1))=j;
            Poneibor_ext{j}(ij(2))=i;
        end
    end
end

for i=1:dotnm_ext,
    l=length(vb{i});
    i0=reducepe( i,dotnm);
    for j=1:l-1,
        j0=reducepe( Poneibor_ext{i}(j),dotnm);
        if(unit2cell(i0,unitnm)==unit2cell(j0,unitnm))
            plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'y')
        else
            plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'g','Linewidth',3)
        end
        hold on;
    end
    if(l>2)
        j0=reducepe( Poneibor_ext{i}(l),dotnm);
        if(unit2cell(i0,unitnm)==unit2cell(j0,unitnm))
            plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'y')
        else
            plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'g','Linewidth',3)
        end
    end
    
    plot(XY_ext(i,1),XY_ext(i,2),'O','MarkerEdgeColor','y','MarkerFaceColor','y')
    %     text(XY_ext(i,1),XY_ext(i,2),num2str(i),'FontSize',8);
    %     text(XY_ext(i,1),XY_ext(i,2),num2str(unit2cell(i,unitnm)),'FontSize',8);
    if(inregion(XY_ext(i,1),XY_ext(i,2),0,lengtha,0,lengthb)),
        text(XY_ext(i,1),XY_ext(i,2),num2str(reducepe(unit2cell(i,unitnm),cellnm)),'FontSize',8);
    end
    % hold on;
end
axis equal;
axis([0,lengtha,0,lengthb]);
end
