% load('thedataAB.mat');
figure;
jj=0;
for i=1:length(aarr),
%     for i=2:3,
    %     hold on
    if (mod(i-1,500)==0)
% % if(i==200000)
%         disp(i);
        jj=jj+1;
        subplot(2,4,jj);
%                 figure;
        
%         plotpolygon( aarr{i},bcel{i},1:dotnm,lengtha,lengthb  );
        
        
        veclist=ext9(lengtha,lengthb,[0,0]);
% veclist=[0,0];
        
        for j=1:size(veclist,1),
%             % for j=5,
%             
% %             [ pace,angle ] = changetoangledis(veclist(j,1),veclist(j,2));
%             
            plotpolygonwithdisplacement(aarr{i},bcel{i},1:dotnm,veclist(j,1),lengtha,veclist(j,2),lengthb);
%                        
        end
        hold off
        title(['i=',num2str(i)]);
        axis([0,lengtha,0,lengthb]);
%  axis([-0.5*lengtha,1.5*lengtha,-0.5*lengthb,1.5*lengthb]);
        
        
%             rectangle('Position',[0 0 lengtha lengthb]);
        
    end
    
end
 theEE=mean(tEEs,2);
figure;plot(1:length(theEE),theEE);xlabel('steps(10^3)');ylabel('Energy(kT)');
% axis([0,400,-38,-30]);
%  thePP=mean(tPPs,2);
% figure;plot(1:length(thePP),thePP);xlabel('steps(10^3)');ylabel('Perimeter');
%  theAA=mean(tAAs,2);
% figure;plot(1:length(theAA),theAA);xlabel('steps(10^3)');ylabel('Area');



