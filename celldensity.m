function [ gridx,gridy,gridnn ] = celldensity( x, y, gridna, gridnb, coo )

le=length(x);
lengthx=coo(2)-coo(1);
lengthy=coo(4)-coo(3);

deltax = lengthx / gridna;
deltay = lengthy / gridnb;

fudge = sqrt(deltax^2 + deltay^2);

gridx=zeros(gridna,gridnb);
gridy=zeros(gridna,gridnb);
gridnn=zeros(gridna,gridnb);
for i= 1:gridna,
    for j=1:gridnb,
        gridx(i,j)=coo(1)+(i-0.5)*deltax;
        gridy(i,j)=coo(3)+(j-0.5)*deltay;
        for k=1:le,
            disx=perodist(gridx(i,j)-x(k),lengthx);
            disy=perodist(gridy(i,j)-y(k),lengthy);
            d=sqrt(disx^2+disy^2);
            dd=d+fudge;
            gridnn(i,j)=gridnn(i,j)+1/dd^2;
        end
    end
end
end

