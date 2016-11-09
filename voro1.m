clear figure
clear all
clc
clear
clf

cellh=8;
unitnm=3;
cellv=unitnm*cellh;
celllattx=5;
celllatty=5;
dotnm=cellv*cellh;
cellnm=cellh*cellh;
[XY] = creatdots( cellv,cellh,celllattx,celllatty );
%[va,vb]=voronoin(XY);
[XY,va,vb,polyarea,polyedgelen,polyneibor ] = makeready( cellnm,unitnm, XY,0.7);
Plotfig(XY, va, vb);
axis equal;
axis([0,cellh*celllattx,0,cellv*celllatty]);
%     for i=1:dotnm,
%         l=length(vb{i});
%         for j=1:l-1,
%             plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'g')
%             hold on;
%         end
%         plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'g')
%         %     plot(XY(i,1),XY(i,2),'O','MarkerEdgeColor','y','MarkerFaceColor','y')
%             text(XY(i,1),XY(i,2),num2str(i),'FontSize',8);
%         % hold on;
%     end
%     axis equal;
%      axis([0,cellh*celllattx,0,cellv*celllatty]);

% while 1,
%     %clf;
%     [ va,vb,polyarea,polyedgelen,polyneibor ] = updatevoro( XY );    
%     
%     for i=1:dotnm,
%         l=length(vb{i});
%         for j=1:l-1,
%             plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'g')
%             hold on;
%         end
%         plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'g')
%         %     plot(XY(i,1),XY(i,2),'O','MarkerEdgeColor','y','MarkerFaceColor','y')
%             text(XY(i,1),XY(i,2),num2str(i),'FontSize',8);
%         % hold on;
%     end
%     axis equal;
%      axis([0,cellh*celllattx,0,cellv*celllatty]);
% %     pause;
% %axis([-3*cellh*celllattx,3*cellh*celllattx,-3*cellv*celllatty,3*cellv*celllatty]);
% 
%     
%     
%     signx=0;
%     for i=1:cellnm,
%         for j=1:unitnm,
%             k=j+1;
%             if(k<=unitnm)
%                 juth=cell2unit(i,j,unitnm);
%                 kuth=cell2unit(i,k,unitnm);
%                 if(neiborcp(juth,kuth,vb)==0)
%                     disp(juth);
%                     disp(kuth);
%                     disp(distance(juth,kuth,XY));
%                     signx=1;
%                     [XY(juth,:),XY(kuth,:)]=makecloser(XY(juth,:),XY(kuth,:),0.6);
%                 end
%             end
%         end
%     end
%     
%     if(signx==0),
%         disp('ready!');
%         break;
%     end
% end
               
                                
% for i=1:dotnm,
%     l=length(vb{i});
%     for j=1:l-1,
%         plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'g')
%         hold on;
%     end
%     plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'g')
% %     plot(aa(i,1),aa(i,2),'O','MarkerEdgeColor','y','MarkerFaceColor','y')
% %     text(aa(i,1),aa(i,2),num2str(i),'FontSize',8);
%    % hold on;
% end
% axis equal;
% axis([0,cellh*celllattx,0,cellv*celllatty]);
%axis([-40,80,-60,120]);
