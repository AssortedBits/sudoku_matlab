function nextEmpty = findNextEmpty(matrix, startingCell)
% output a 2-element vector containing the coordinates of the next empty
% matrix element, starting from startingCell 
% and reading left->right, top->bottom
%
% If there are no empty elements, output [0,0]

% return value will be [0,0] unless an empty element is found 
nextEmpty=[0,0];

matrixWidth = size(matrix,1);
matrixHeight = size(matrix,2);

%search until end of current row, starting at startingCell
if startingCell(2) <= matrixWidth
    row = startingCell(1);
    for column = startingCell(2):matrixWidth,
        if matrix(row, column) == 0,
            nextEmpty = [row, column];
            return;
        end
    end
end
%search next rows
if startingCell(1) < matrixHeight,
    for row = (startingCell(1)+1):matrixHeight,
        for column = 1:matrixWidth,
            if matrix(row, column) == 0,
                nextEmpty = [row,column];
                return;    % return immediately when an empty element is found
            end
        end
    end
end

% function will have returned prior to this point if an empty element was found
return
