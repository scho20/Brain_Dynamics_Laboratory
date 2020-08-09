function after = cell_organize(before)

% PURPOSE: To remove all the empy cells and reduce the cell array size
% INPUT('before'): The cell array you would like to reduce
% OUTPUT('after'): The cell array after you reduce the size

for i = 1:size(before,1)
    if isempty(before{i,1})
        before{i,1} = [];
    end
end

after = before(~celfun(@isempty, before));