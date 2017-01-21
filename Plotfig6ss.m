function [] = Plotfig6ss(sp,cvxysi,CePo,a1,a2,b1,b2,x1,x2,y1,y2,num)

cellnm=length(CePo);
hold on;
for i=1:cellnm,
    pp=[cvxysi{i};cvxysi{i}(1,:)];
    len=length(pp);
    for j=1:len-1,
        xx1=pp(j,1);
        xx2=pp(j+1,1);
        yy1=pp(j,2);
        yy2=pp(j+1,2);
        boundsectionplot( xx1,yy1,xx2,yy2,a1,a2,b1,b2,'k','Linewidth',2);
    end
end

if(num)
    for i=1:cellnm,
        if(inregion(CePo(i,1),CePo(i,2),x1,x2,y1,y2)),
            if(ismember(i,sp)),
                text(CePo(i,1),CePo(i,2),num2str(i),'FontSize',8,'Color','r');
            else
                text(CePo(i,1),CePo(i,2),num2str(i),'FontSize',8,'Color','b');
            end
        end
    end
end
% axis equal;
% axis([x1,x2,y1,y2]);
end
