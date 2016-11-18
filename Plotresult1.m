%lengtha,lengthb,unitnm,cellnm
XYfile=load('XY.txt');
status2=XYfile(:,1);
XYfile(:,1)=[];
timen=size(XYfile,1)/2;
dotnmd=size(XYfile,2);

ZZ=zeros(dotnmd,2);

slice=[1;round(n/3);round(2*n/3);n];

for k=1:timen,
    if(ismember(k,slice))
        ZZ(:,1)=XYfile(2*k-1,:)';
        ZZ(:,2)=XYfile(2*k,:)';              
        [ Poneibor,Poedgelen,va,vb] = unitneibors( XY,lengtha,lengthb );
        for i0=1:cellnm,
            for j0=1:unitnm,
                i=cell2unit(i0,j0,unit);
        
        for i=1:dotnmd,
            l=length(vb{i});
            for j=1:l-1,
                ismember(vb{i}(j),vb{2})
%                 if(vb{i}(j)
                plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'g')
                hold on;
            end
            plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'g')
            plot(XY(i,1),XY(i,2),'O','MarkerEdgeColor','y','MarkerFaceColor','y')
            %text(XY(i,1),XY(i,2),num2str(i),'FontSize',8);
            text(XY(i,1),XY(i,2),num2str(reducepe(unit2cell(i,unitnm),cellnm)),'FontSize',8);
            % hold on;
        end

        axis equal;
        axis([0,lengtha,0,lengthb]);
        %axis([-lengtha,2*lengtha,-lengthb,2*lengthb]);
    end
end