function firstEmpty=findFirstEmpty(matrix)
% output a 2-element vector containing the coordinates of the first empty
% matrix element (reading left->right, top->bottom)
%
% If there are no empty elements, output [0,0]

% return value will be [0,0] unless an empty element is found 
firstEmpty=[0,0];

for j = 

for i = 1:size(matrix,1),
    for j = 1:size(matrix,2),
        if matrix(i,j)==0,
            firstEmpty=[i,j];
            return;    % return immediately when an empty element is found
        end
    end
end

% function will have returned prior to this point if an empty element was found
return
