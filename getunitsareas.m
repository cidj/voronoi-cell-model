addpath([pwd,'/vorosim']);
for i=4:4:56,
    for j=0:0.5:8,
        % for i=4:4:56,
        %     for j=3:0.5:8,
        thefolder=['multiu_L',num2str(i),'c36u2A36aa100_0.5_',num2str(j),'_1n1200000r2000s301'];
        if(exist([thefolder,'\anaresult.mat'],'file'))
            if(exist([thefolder,'\pArealis.mat'],'file'))
                disp([thefolder,'\pArealis.mat already exists.']);
            else
                load([thefolder,'\anaresult.mat']);
                load([thefolder,'\parameter0.mat']);
                pArealis=zeros(timen,dotnm);
                for lt=1:timen,

                    XY_ext=ext9(lengtha,lengthb,ZZ{lt});

                    [va,vb]=voronoiDiagram(delaunayTriangulation(XY_ext));
                    vb0=dex9(vb,dotnm);
                    pArealis(lt,:) = AreaandPerimeter( va,vb0,dotnm )';
                end
                save([thefolder,'\pArealis.mat'],'pArealis');
                disp([thefolder,'\pArealis.mat generated.']);
            end
        else
            disp([thefolder,'\anaresult.mat does not exists.']);
        end
    end
    
    
end
