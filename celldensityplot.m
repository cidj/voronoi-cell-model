function [ ] = celldensityplot( x, y, xnum,ynum,levels, coo)

    [aa,bb,map] = celldensity(x, y, xnum, ynum,coo);
    map = map - min(min(map));
    map = floor(map ./ max(max(map)) * (levels-1));
    pcolor(aa,bb,map);
    shading interp;
end

