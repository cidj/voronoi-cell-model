% load([foldername,'/','parameter0.mat']);
% load([foldername,'/','anaresult.mat']);
% load([foldername,'/','statistics.mat']);
% load([foldername,'/','velocities.mat']);

dataplot;

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
asprafig=[foldername,'/','hists_aspra'];
anglesfig=[foldername,'/','hists_angles'];
edgesfig=[foldername,'/','hists_edges'];
nmofedgesfig=[foldername,'/','hists_nmofedges'];
nmofobtangfig=[foldername,'/','hists_nmofobtangs'];
ratofobtangfig=[foldername,'/','hists_ratofobtangs'];

snapshotsplotfun(foldername, difcl,unitposifile,cellcenterposifile,plotan,plotbn,recN,lengtha,lengthb,unitnm,'Snapshots',snapshotfig);
snapshotsplotfunss(foldername,difcl, cvxys,cellcenterposifile,plotan,plotbn,recN,lengtha,lengthb,'Snapshots',snapshotfigs);
celldensitiesplots(foldername,cellcenterposifile,plotan,plotbn,recN,lengtha,lengthb,'Cells densities',100,100,64,densityfig);
histg(foldername, cellareafile,10,plotan,plotbn,recN,areahistfig,'Areas' );
histg(foldername, cellperimeterfile,10,plotan,plotbn,recN,perihistfig,'Perimeters' );
histg(foldername, cellenergyfile,10,plotan,plotbn,recN,enerhistfig,'Energys' );
histnei( foldername,ceneibo,plotan,plotbn,recN,neihistfig,'Neighbors' );
histV( foldername,isoqu,10,plotan,plotbn,recN,isoqufig,'Isoperimetric quotients',[0,1,0,inf] );
histV( foldername,casra,10,plotan,plotbn,recN,asprafig,'Aspect ratios',[0,1,0,inf] );
histVcel( foldername,allangles,20,plotan,plotbn,recN,anglesfig,'Angles',[0,360,0,inf] );
histVcel( foldername,alledges,20,plotan,plotbn,recN,edgesfig,'Edges','auto' );
histV( foldername,cellvxn,20,plotan,plotbn,recN,nmofedgesfig,'Number of edges','auto');
histV( foldername,cellcvx,10,plotan,plotbn,recN,nmofobtangfig,'Number of obtuse angles',[0,10,0,inf]);
histV( foldername,cellvxr,10,plotan,plotbn,recN,ratofobtangfig,'Ratio of obtuse angles',[0,1,0,inf]);

plotvelocities;

