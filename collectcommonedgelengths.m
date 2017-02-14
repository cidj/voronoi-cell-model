addpath([pwd,'/vorosim']);
for i=4:4:56,
    for j=3:0.5:8,
        % for i=4:4:56,
        %     for j=3:0.5:8,
        thefolder=['multiu_L',num2str(i),'c36u3A36aa1000_0.5_',num2str(j),'_1n1200000r2000s301'];
        if(exist([thefolder,'\anaresult.mat'],'file'))
            %             if(exist(thefolder,'dir'))
            
            if(exist([thefolder,'\allmultiuedges.mat'],'file'))
                disp([thefolder,'\allmultiuedges.mat already exists.']);
            else
                load([thefolder,'\anaresult.mat']);
                load([thefolder,'\parameter0.mat']);
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
                disp([thefolder,'\allmultiuedges.mat generated.']);
            end
        else
            disp([thefolder,'\anaresult.mat does not exists.']);
        end
    end
    
    
end
