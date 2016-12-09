    pacetep=7;
    CCn(:,1)=CePofile(2*pacetep-1,:)';
    CCn(:,2)=CePofile(2*pacetep,:)';
    vAst=vAs{pacetep};
    vcst=cell(cellnmd,1);
    for j=1:cellnmd,
        vcst{j}=vcs{pacetep,j};
    end
       figure;
    axis equal;
    axis([0,lengtha,0,lengthb]);
    Plotfig6s(sp,vAst,vcst,CCn,0,lengtha,0,lengthb,0,lengtha,0,lengthb);

    title(['stepnum= ',num2str(recN*(pacetep-1))]);