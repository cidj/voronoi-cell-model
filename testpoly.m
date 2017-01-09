for i=1:101,
    for j=1:36
    a=ispolycw(cvxys{i,j}(:,1),cvxys{i,j}(:,2));
    b=ployorder(cvxys{i,j});
    if(a~=b)
        pause;
    else
        disp(i);
    end
    end
end