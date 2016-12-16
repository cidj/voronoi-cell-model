dotnm=length(dZZ);
dZZ_ext=ext9(lengtha,lengthb,dZZ);
dotnm_ext=length(dZZ_ext);

% tic;
% for i=1:1000
% vD = delaunayTriangulation(dZZ_ext);
% [va,vb] = voronoiDiagram(vD);
% [va,vb]=voronoin(dZZ_ext);
[va,vb] = voronoiDiagram(delaunayTriangulation(dZZ_ext));
% end
% toc;
% vb0=dex9(vb,dotnm);
% Poneibor_ext=cell(dotnm_ext,1);
% is1=zeros(i,j);
% tic;
% for i=1:dotnm_ext,
%     for j=i+1:dotnm_ext,
%         is1(i,j)=neiborcp(i,j,vb);
%     end
% end
% toc;
% is2=zeros(i,j);
% tic;
% for i=1:dotnm_ext,
%     for j=i+1:dotnm_ext,
%         is2(i,j)=newneiborcp( i,j,vD );
%     end
% end
% toc;
tic;
Poneibor_ext=cell(dotnm_ext,1);
for i=1:dotnm_ext,
    for j=i+1:dotnm_ext,
        [is,~,ij]=neiborcp(i,j,vb);
        if(is),
            Poneibor_ext{i}(ij(1))=j;
            Poneibor_ext{j}(ij(2))=i;
        end    
    end
end
Poneibor=reduceneibor(dex9(Poneibor_ext,dotnm),dotnm); 
toc;
%%%%%%%%%%%%%
tic;
vb0=dex9(vb,dotnm);
Poneibor1=cell(dotnm,1);
for i=1:dotnm,
    for j=i+1:dotnm,
        [ is,~,~,ij ]=neiborcpbc9( i,j,vb0,vb,dotnm );
        if(is),
            Poneibor1{i}(ij(1))=j;
            Poneibor1{j}(ij(2))=i;
        end    
    end
end
% Poneibor1=reduceneibor(Poneibor1,dotnm);  
toc;

for i=1:dotnm,
    lla=length(Poneibor{i});
    llb=length(Poneibor1{i});
    if(lla~=llb)
        disp(i);
    end
end