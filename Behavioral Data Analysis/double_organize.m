function after = double_organize(before)

% PURPOSE: To remove all the zero doubles and reduce the double array size
% INPUT('before'): The double array you would like to reduce
% OUTPUT('after'): The double array after you reduce the size

for i = 1:size(before,1)
    if isnan(before(i,1))
        before(i,1) = 0;
    end
end

after = before(before~=0);