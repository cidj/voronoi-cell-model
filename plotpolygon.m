function [ ] = plotpolygon( vAst0,vbst,ns,lengtha,lengthb  )
%PLOTPOLYGON Summary of this function goes here
%   Detailed explanation goes here


vcst=vbst(ns);
% figure;
hold on;
unitnm=length(vcst);
for i=1:unitnm,
%     [vAst,vcst{i} ] = movegrouptocenter(vAst0,vcst{i},0,lengtha,0,lengthb );
 [vAst,vcst{i} ] = movegrouptogether(vAst0,vcst{i},lengtha,lengthb );
    len=length(vcst{i});
    for j=1:len-1,
        xx1=vAst(vcst{i}(j),1);
        xx2=vAst(vcst{i}(j+1),1);
        yy1=vAst(vcst{i}(j),2);
        yy2=vAst(vcst{i}(j+1),2);
        plot([xx1,xx2],[yy1,yy2],'k','Linewidth',2);
        text(xx1,yy1,num2str(vcst{i}(j)),'FontSize',8,'Color','k');
        text(xx2,yy2,num2str(vcst{i}(j+1)),'FontSize',8,'Color','k');
    end
    xx1=vAst(vcst{i}(len),1);
    xx2=vAst(vcst{i}(1),1);
    yy1=vAst(vcst{i}(len),2);
    yy2=vAst(vcst{i}(1),2);
    plot([xx1,xx2],[yy1,yy2],'k','Linewidth',2);
    text(xx1,yy1,num2str(vcst{i}(len)),'FontSize',8,'Color','k');
    text(xx2,yy2,num2str(vcst{i}(1)),'FontSize',8,'Color','k');
    
    text(mean(vAst(vcst{i},1)),mean(vAst(vcst{i},2)),num2str(ns(i)),'FontSize',12,'Color','g');
end

axis equal;

end


