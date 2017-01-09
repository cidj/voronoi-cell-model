tp=700;
xyfilename1='un_L25c36u1A36aa20_0.5_-2_1n1000000r1000s501/XY.txt';
cefilename1='un_L25c36u1A36aa20_0.5_-2_1n1000000r1000s501/CePo.txt';
xyfilename2='un_L25c36u3A36aa20_0.5_-2_1n1000000r1000s501/XY.txt';
cefilename2='un_L25c36u3A36aa20_0.5_-2_1n1000000r1000s501/CePo.txt';

xy1=loadtimepoint( xyfilename1,2,tp );
ce1=loadtimepoint( cefilename1,2,tp );
xy2=loadtimepoint( xyfilename2,2,tp );
ce2=loadtimepoint( cefilename2,2,tp );

sp=[];
lengtha=25;
lengthb=25;
unitnm1=1;
unitnm2=3;
figure;
subplot(1,2,1);
Plotfig5(xy1,ce1,lengtha,lengthb,unitnm1,0,lengtha,0,lengthb);
% Plotfig6(sp,xy1,ce1,lengtha,lengthb,unitnm1,0,lengtha,0,lengthb,0);
axis equal;
axis([0,lengtha,0,lengthb]);
% title('1-unit cells');
subplot(1,2,2);
Plotfig5(xy2,ce2,lengtha,lengthb,unitnm2,0,lengtha,0,lengthb);
% Plotfig6(sp,xy2,ce2,lengtha,lengthb,unitnm2,0,lengtha,0,lengthb,0);
axis equal;
axis([0,lengtha,0,lengthb]);
% title('3-unit cells');

% suptitle('Snapshots');


