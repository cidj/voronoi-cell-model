namelist=[5,20,50,100];
for it=2:6,
    for jt=1:length(namelist),
        kt=namelist(jt);
        thefolder=['multi_L36c36u',num2str(it),'A36aa',num2str(kt),'_0.5_4.5_1n2000000r1000s1001'];
        if(~exist([thefolder,'\classfiedangles.mat'],'file')),
        
        load([thefolder,'\anaresult.mat']);
        load([thefolder,'\parameter0.mat']);
        vtangcs=cell(timen,cellnm);
        utangcs=cell(timen,cellnm);
        fourlencs=zeros(timen,1);
        for lt=1:timen,
            [~,~,va,vb0,vb]=unitneibors(ZZ{lt},lengtha,lengthb);
            [vtang,vcels,~,fourlen]=vertexangles(ceineibodet(lt,:),va,vb0,vb,unitnm,lengtha,lengthb);
            vtangc=orgnivertangs(vtang,vcels);           
            utangc=angleclassfy(vtangc,cellangles(lt,:));
            vtangcs(lt,:)=vtangc;
            utangcs(lt,:)=utangc;
            fourlencs(lt)=fourlen;
            if(mod(lt,500)==0)
                disp(lt);
            end
            
        end
        save([thefolder,'\classfiedangles.mat'],'vtangcs','utangcs','fourlencs');
        disp(['processed: ', thefolder]);
        end
        disp(['exist: ', thefolder]);
    end
end

