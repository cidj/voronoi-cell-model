lvb=zeros(dotnm_ext,1);
lvP=zeros(dotnm_ext,1);
comp=zeros(dotnm_ext,1);
for i=1:dotnm_ext,
    l=length(vb{i});
    lvb(i)=l;
    ll=length(Poneibor_ext{i});
    lvP(i)=ll;
    comp(i)=l-ll;
end
    