function numbersInSquare = findNumbersInSquare(matrix, cell)
% outputs a vector containing the non-zero numbers in the subsquare of a cell

sudokuSize = size(matrix,1);
sudokuDegree = sqrt(sudokuSize);

% determine "indices" of subsquare in larger square
squareRowIndex=ceil(cell(1)/sudokuDegree);
squareColumnIndex=ceil(cell(2)/sudokuDegree);

tempNumbersInSquare=[];
% scan across 4x4 square, picking up numbers (including zeros)
for i = (squareRowIndex*(sudokuDegree-1)+1):(squareRowIndex*sudokuDegree),
    for j = (squareColumnIndex*(sudokuDegree-1)+1):(squareColumnIndex*sudokuDegree),
        tempNumbersInSquare = union(tempNumbersInSquare,matrix(i,j));
    end
end

% to get rid of the zeros
numbersInSquare=intersect(tempNumbersInSquare,1:sudokuSize);

return
