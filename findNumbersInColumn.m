function numbersInColumn = findNumbersInColumn(matrix, cell)
% output a vector containing the non-zero numbers in the column

transposedMatrix=matrix';
tempNumbersInColumn=transposedMatrix(cell(2),:);

% to strip away zeros
numbersInColumn = setdiff(tempNumbersInColumn, [0]);

return