% load(parameterfile);
% rng('default');
XY = creatdots( unitv,unith,unitlattx,unitlatty );
% XY = creatdotsnonrand( unitv,unith,unitlattx,unitlatty );
[XY,va,vb,pArea,pPerimeter] = makeready_ext1( cellnm,unitnm, XY,lengtha,lengthb, 0.7);
CePo=zeros(cellnm,2);
for i=1:cellnm,
    CePo(i,:)=XY(cell2unit(i,1,unitnm),:);
end
CePo=cellcentre( pArea, XY,CePo,lengtha,lengthb,cellnm,unitnm );

As=cellarea( cellnm,unitnm, pArea );
Ps=celledgefo( cellnm,unitnm, pPerimeter,va,vb);
Es=cellener4(sp,a1,a2,a3,A0,Ps,As);
totenergy=sum(Es);
status=0;
recA=[status,As'];
recP=[status,Ps'];
recE=[status,Es'];
recXY=[[status;status],XY'];
recCePo=[[status;status],CePo'];
save(cellareafile,'recA','-ascii');
save(cellperimeterfile,'recP','-ascii');
save(cellenergyfile,'recE','-ascii');
save(unitposifile,'recXY','-ascii');
save(cellcenterposifile,'recCePo','-ascii');

rcpA=[status,pArea'];
rcpP=[status,pPerimeter'];
save(unitareafile,'rcpA','-ascii');
save(unitperimeterfile,'rcpP','-ascii');
disp('Cells initialized!');