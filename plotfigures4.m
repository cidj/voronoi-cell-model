% load([foldername,'/','parameter0.mat']);
% load([foldername,'/','anaresult.mat']);
% load([foldername,'/','statistics.mat']);
% load([foldername,'/','velocities.mat']);

dataplot4;

plotan=3;
plotbn=4;
difcl=motcels;
snapshotfig=[foldername,'/','snapshots'];
snapshotfigs=[foldername,'/','snapshotss'];
densityfig=[foldername,'/','densities'];
areahistfig=[foldername,'/','hists_area'];
perihistfig=[foldername,'/','hists_peri'];
enerhistfig=[foldername,'/','hists_ener'];
neihistfig=[foldername,'/','hists_nei'];
isoqufig=[foldername,'/','hists_isoqu'];

snapshotsplotfun(foldername, difcl,unitposifile,cellcenterposifile,plotan,plotbn,recN,lengtha,lengthb,unitnm,'Snapshots',snapshotfig);
celldensitiesplots(foldername,cellcenterposifile,plotan,plotbn,recN,lengtha,lengthb,'Cells densities',100,100,64,densityfig);
histg(foldername, cellareafile,10,plotan,plotbn,recN,areahistfig,'Areas' );
histg(foldername, cellperimeterfile,10,plotan,plotbn,recN,perihistfig,'Perimeters' );
histg(foldername, cellenergyfile,10,plotan,plotbn,recN,enerhistfig,'Energys' );
histnei( foldername,ceneibo,plotan,plotbn,recN,neihistfig,'Neighbors' );
histV( foldername,isoqu,10,plotan,plotbn,recN,isoqufig,'Isoperimetric quotients',[0,1,0,inf] );

plotvelocities;

