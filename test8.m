t0=clock;
for i=1:10000
%     [x,pn,ij ] = neiborbp( vb{1},vb{2} );
    y=intersect(vb{1},vb{2});

% areas=zeros(cellnm,1);
% for i=1:cellnm,
% areas(i)=Aiuni( i,unitnm,pArea );
% end

% areass=zeros(cellnm,1);
% a=(1:cellnm)';
% areass(a)=Aiuni(a,unitnm,pArea);

end
    
    disp(['seconds=',num2str(etime(clock,t0))]);