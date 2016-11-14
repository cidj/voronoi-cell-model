fid = fopen('1KJ1.pdb', 'rt');
XX = textscan(fid, '%s %d %s %s %s %d %f %f %f %f %f %s %s', 'CollectOutput', true);
fclose(fid);
kinds=13;
le=length(XX{1});
AA=cell(le,1);
BB=cell(1,kinds);

for i=1:le,
        BB{1}=XX{1}(i);
        BB{2}=XX{2}(i);
        BB{3}=XX{3}(i,1);
        BB{4}=XX{3}(i,2);
        BB{5}=XX{3}(i,3);
        BB{6}=XX{4}(i);
        BB{7}=XX{5}(i,1);
        BB{8}=XX{5}(i,2);
        BB{9}=XX{5}(i,3);
        BB{10}=XX{5}(i,4);
        BB{11}=XX{5}(i,5);
        BB{12}=XX{6}(i,1);
        BB{13}=XX{6}(i,2);
    AA{i}=BB;
end

% 第n行对应的就是AA{n}
%想得到第n行的各个部分，用AA{n}{i}即可。i=1,2,3,4,5,6分别代表这一行的六个值。
%下面就可以进行处理了。

for i=1:le,
    if(strcmp(AA{i}{4},'GLY')&&strcmp(AA{i}{3},'CA')||not(strcmp(AA{i}{4},'GLY'))&&strcmp(AA{i}{3},'CB')),
%         disp([AA{i}{1},num2str(AA{i}{2}),AA{i}{3},num2str(AA{i}{4}),num2str(AA{i}{5}),AA{i}{6}]);
        % disp([AA{i}{1},AA{i}{2},AA{i}{3},AA{i}{4},AA{i}{5},AA{i}{6},AA{i}{7},AA{i}{8},AA{i}{9},AA{i}{10},AA{i}{11},AA{i}{12},AA{i}{13}])
       %  disp([AA{i}{6},AA{i}{7},AA{i}{8},AA{i}{9}]);
       disp([num2str(AA{i}{6}),'    ',num2str(AA{i}{7}),'    ',num2str(AA{i}{8}),'    ',num2str(AA{i}{9})]);
    end
end
        