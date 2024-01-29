function [solution, solved] = solveSudoku(sudokuMatrix)

if size(sudokuMatrix,1) ~= size(sudokuMatrix,2),
    solution = [];
    solved = false;
    fprintf('error: sudoku matrix is not square');
    return;
end

if floor(sqrt(size(sudokuMatrix,1))) < sqrt(size(sudokuMatrix,1)),
    solution = [];
    solved = false;
    fprintf('error: sudoku matrix must have dimensions square x square');
    return;
end

firstCell = [1,1];
[solution, solved] = solveSudokuBacktrack(sudokuMatrix, firstCell);

return;
