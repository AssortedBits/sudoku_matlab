function numbersInRow = findNumbersInRow(matrix, cell)
% outputs a vector containing the non-zero numbers in row

numbersInRow = matrix(cell(1),:);

%get rid of the zeros
numbersInRow = setdiff(numbersInRow,[0]);

return