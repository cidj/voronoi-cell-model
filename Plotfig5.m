function [] = Plotfig5(XY,CePo,lengtha,lengthb,unitnm,x1,x2,y1,y2)
%PLOTFIG Summary of this function goes here
%Detailed explanation goes here
dotnm=length(XY);
XY_ext=ext9(lengtha,lengthb,XY);
[va,vb]=voronoin(XY_ext);
dotnm_ext=dotnm*9;
cellnm=dotnm/unitnm;
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
    ll=length(Poneibor_ext{i});
    if(l==ll)
        i0=unit2cell(reducepe( i,dotnm),unitnm);
        for j=1:l-1,
            j0=unit2cell(reducepe( Poneibor_ext{i}(j),dotnm),unitnm);
            if(i0==j0)
                plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'c','Linewidth',2)
            else
                plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'k','Linewidth',4)
            end
            hold on;
        end
        if(l>2)
            j0=unit2cell(reducepe( Poneibor_ext{i}(l),dotnm),unitnm);
            if(i0==j0)
                plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'c','Linewidth',2)
            else
                plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'k','Linewidth',4)
            end
        end
    else
        disp('noteq');
    end
    %     plot(XY_ext(i,1),XY_ext(i,2),'O','MarkerEdgeColor','y','MarkerFaceColor','y')
    %     text(XY_ext(i,1),XY_ext(i,2),num2str(i),'FontSize',8);
    %     text(XY_ext(i,1),XY_ext(i,2),num2str(unit2cell(i,unitnm)),'FontSize',8);
    
%     if(inregion(XY_ext(i,1),XY_ext(i,2),x1,x2,y1,y2)),
%         text(XY_ext(i,1),XY_ext(i,2),num2str(reducepe(unit2cell(i,unitnm),cellnm)),'FontSize',6,'Color','g');
%     end
    
    % hold on;
end

% lc=length(CePo);
% for i=1:lc,
%     if(inregion(CePo(i,1),CePo(i,2),x1,x2,y1,y2)),
%         text(CePo(i,1),CePo(i,2),num2str(i),'FontSize',8,'Color','b');
%     end
% end

% axis equal;
% axis([x1,x2,y1,y2]);
end
