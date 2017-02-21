
% i=40000;
% edges  = getedgelengthlist( aarr{i},bcel{i},lengtha,lengthb );
% snapedges=cell2vec(edges);
% % figure;histogram(snapedges,0:0.01:15);
% 
% 
% 
% xx=10.57;
% eps=0.01;
% 
% for i=1:length(edges),
%     for j=1:length(edges{i}),
%         if(abs(edges{i}(j)-xx)<eps)
%             disp(['i=',num2str(i),' j=',num2str(j)]);
%         end
%     end
% end

% figure;
% plotpolygonwithdisplacement2(aarr{i},bcel{i},1:dotnm,0,lengtha,0,lengthb);
% rectangle('Position',[0,0,lengtha,lengthb]);

for i=1:length(markb),
    for j=1:length(markb{i}),
        if(markb{i}(j)==0)
            disp(['i=',num2str(i),' j=',num2str(j)]);
        end
    end
end