namelist=[1000];
for it=10,
    for jt=1:length(namelist),
        kt=namelist(jt);
        thefolder=['multi_L36c36u',num2str(it),'A36aa',num2str(kt),'_0.5_9_1n600000r500s601'];
        load([thefolder,'\parameter0.mat']);
        load([thefolder,'\anaresult.mat']);        
        allmultiuedges=cell(timen,cellnm);
        for lt=1:timen,
            [ ~,~,va,vb0,vb ]  = unitneibors( ZZ{lt},lengtha,lengthb );
            for mt=1:cellnm,
                for nt=1:length(ceineibodet{lt,mt}),
                    [ bo,lent ] = istwocellconnect( mt,ceineibodet{lt,mt}(nt),unitnm,va,vb0,vb,dotnm,lengtha,lengthb );
                    if(bo)
                        allmultiuedges{lt,mt}=[allmultiuedges{lt,mt},lent];
                    else
                        disp('bo error');
                    end
                end
            end
        end
         save([thefolder,'\allmultiuedges.mat'],'allmultiuedges');
        disp(thefolder);
    end
end
