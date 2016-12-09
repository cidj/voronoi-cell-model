function [x,pn,ij ] = neiborbp( vva, vvb )
%NEIBORBP Summary of this function goes here
%   Detailed explanation goes here

%x gives whether the two unit are neibors.
%pn gives the index of the two vertex of the common edge.
%ij gives the index of the common edge in the two units.

a=length(vva);
b=length(vvb);
x=0;
pn=[];
ij=[];
for i=1:a,
    for j=1:b,
        if (vva(i)==vvb(j))
            if(i~=a)
                if(j==1)
                    if(vva(i+1)==vvb(2))
                        x=1;
                        ij=[i,1];
                    elseif(vva(i+1)==vvb(b))
                        x=1;
                        ij=[i,b];
                    end
                elseif(j==b)
                    if(vva(i+1)==vvb(b-1))
                        x=1;
                        ij=[i,b-1];
                    elseif(vva(i+1)==vvb(1))
                        x=1;
                        ij=[i,b];
                    end
                else
                    if(vva(i+1)==vvb(j-1))
                        x=1;
                        ij=[i,j-1];
                    elseif(vva(i+1)==vvb(j+1))
                        x=1;
                        ij=[i,j];
                    end
                end
                if(x==1)
                    pn=[vva(i),vva(i+1)];
                    return
                end
            else
                if(j==1)
                    if(vva(1)==vvb(2))
                        x=1;
                        ij=[a,1];
                    elseif(vva(1)==vvb(b))
                        x=1;
                        ij=[a,b];
                    end
                elseif(j==b)
                    if(vva(1)==vvb(b-1));
                        x=1;
                        ij=[a,b-1];
                    elseif(vva(1)==vvb(1))
                        x=1;
                        ij=[a,b];
                    end
                else
                    if(vva(1)==vvb(j-1))
                        x=1;
                        ij=[a,j-1];
                    elseif(vva(1)==vvb(j+1))
                        x=1;
                        ij=[a,j];
                    end
                end
                if(x==1)
                    pn=[vva(a),vva(1)];
                    return
                end
            end
        end
    end
end
end

