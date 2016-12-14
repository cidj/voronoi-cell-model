function [] = Plotfig6s(sp,vAst,vcst,CePo,a1,a2,b1,b2,x1,x2,y1,y2,num)

cellnm=length(CePo);
hold on;
for i=1:cellnm,
    len=length(vcst{i});
    for j=1:len-1,
        xx1=vAst(vcst{i}(j),1);
        xx2=vAst(vcst{i}(j+1),1);
        yy1=vAst(vcst{i}(j),2);
        yy2=vAst(vcst{i}(j+1),2);
        boundsectionplot( xx1,yy1,xx2,yy2,a1,a2,b1,b2,'k','Linewidth',2);
        %         plot([xx1,xx2],[yy1,yy2],'k','Linewidth',2);
        %         if(inregion(xx1,yy1,x1,x2,y1,y2)),
        %             text(xx1,yy1,num2str(vcst{i}(j)),'FontSize',8,'Color','k');
        %         end
        %         if(inregion(xx2,yy2,x1,x2,y1,y2)),
        %             text(xx2,yy2,num2str(vcst{i}(j+1)),'FontSize',8,'Color','k');
        %         end
    end
    xx1=vAst(vcst{i}(len),1);
    xx2=vAst(vcst{i}(1),1);
    yy1=vAst(vcst{i}(len),2);
    yy2=vAst(vcst{i}(1),2);
    boundsectionplot( xx1,yy1,xx2,yy2,a1,a2,b1,b2,'k','Linewidth',2);
    %         plot([xx1,xx2],[yy1,yy2],'k','Linewidth',2);
    %     if(inregion(xx1,yy1,x1,x2,y1,y2)),
    %         text(xx1,yy1,num2str(vcst{i}(len)),'FontSize',8,'Color','k');
    %     end
    %     if(inregion(xx2,yy2,x1,x2,y1,y2)),
    %         text(xx2,yy2,num2str(vcst{i}(1)),'FontSize',8,'Color','k');
    %     end
    %     disp(i);
    %     pause;
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
% error('stop');
% axis equal;
% axis([x1,x2,y1,y2]);
end
