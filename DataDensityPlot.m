function [ ] = DataDensityPlot( aa, bb, map,levels)
    map = map - min(min(map));
    map = floor(map ./ max(max(map)) * (levels-1));
    pcolor(aa,bb,map);
    shading interp;
end
