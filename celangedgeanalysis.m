load(parameterfile);
load(anadatafile);
celangedgefile=[foldername,'/','celangedge.mat'];

cellangles=cell(timen,cellnmd);
celledges=cell(timen,cellnmd);
cellcvx=zeros(timen,cellnmd);
for i=1:timen,
    for j=1:cellnmd,       
        [angles,edges,cvx ] = anglesedges(cvxys{i,j});
        cellangles{i,j}=angles;
        celledges{i,j}=edges;
        cellcvx(i,j)=cvx;
    end
end
save(celangedgefile, 'cellangles','celledges','cellcvx');
disp('celangedgeanalysis finished.');