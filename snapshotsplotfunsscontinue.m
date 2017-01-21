function [  ] = snapshotsplotfunsscontinue(sp,cvxys,CC,t1,t2,lengtha,lengthb)
%DATAIMAGEPLOTFUN Summary of this function goes here
%   Detailed explanation goes here

cellnmd=size(CC{1},1);

for i=t1:t2,
    vcxy=cell(cellnmd,1);
    for j=1:cellnmd,
        vcxy{j}=cvxys{i,j};
    end
    hsnaps=figure;
    Plotfig6ss(sp,vcxy,CC{i},0,lengtha,0,lengthb,0,lengtha,0,lengthb,1);
    axis equal;
    axis([0,lengtha,0,lengthb]);
    title(['Snapshot: t= ',num2str(i)]);
    set(gcf,'outerposition',get(0,'screensize'));
    
    %     saveas(hsnaps,['Snapshots_series_',num2str(i),'.png']);
    
    frame=getframe(gcf);
    im=frame2im(frame);
    [I,map]=rgb2ind(im,20);
    if i==t1
        imwrite(I,map,'Snapshots_series.gif','gif', 'Loopcount',inf,'DelayTime',0.9);
    elseif i==t2
        imwrite(I,map,'Snapshots_series.gif','gif','WriteMode','append','DelayTime',0.9);
    else
        imwrite(I,map,'Snapshots_series.gif','gif','WriteMode','append','DelayTime',0.9);
    end;
    
    close(hsnaps);
    
    disp([num2str(i),' snapshots finished!']);
end
disp('All snapshots ploted.');
end

