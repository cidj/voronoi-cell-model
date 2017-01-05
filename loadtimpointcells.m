XY=loadtimepoint(unitposifile,2,tp);
CePo=loadtimepoint(cellcenterposifile,2,tp);
As=loadtimepoint(cellareafile,1,tp);
Ps=loadtimepoint(cellperimeterfile,1,tp);
Es=loadtimepoint(cellenergyfile,1,tp);
totenergy=sum(Es);
pArea=loadtimepoint(unitareafile,1,tp);
pPerimeter=loadtimepoint(unitperimeterfile,1,tp);