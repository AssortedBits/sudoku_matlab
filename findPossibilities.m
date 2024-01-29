function possibilities = findPossibilities(matrix,cell)
% output a vector containing possible (i.e. allowable) guess numbers for a cell

% determine disallowed numbers (numbers that are already used in the row, column,
% or subsquare)
numbersInSquare = findNumbersInSquare(matrix, cell);
numbersInRow = findNumbersInRow(matrix, cell);
numbersInColumn = findNumbersInColumn(matrix, cell);

sudokuSize = size(matrix, 1);
% remove disallowed (i.e. already used) numbers from list of possibilities
tempPossibilities = 1:sudokuSize;
tempPossibilities = setdiff(tempPossibilities,numbersInSquare);
tempPossibilities = setdiff(tempPossibilities,numbersInRow);
tempPossibilities = setdiff(tempPossibilities,numbersInColumn);

possibilities = tempPossibilities;

return
