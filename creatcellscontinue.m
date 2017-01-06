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
disp('Cells-continue initialized!');