function [solution, solved] = solveSudokuBacktrack(sudokuMatrix, previousCell)
% solve a Sudoku puzzle using backracking

% display partial solution so we can watch the solver in action
% (disable this to increase speed of solver)
%sudokuMatrix

% look for an empty cell,
% and return with success if there are none
startingCell = previousCell;
nextEmpty = findNextEmpty(sudokuMatrix, startingCell);
if nextEmpty == [0,0],
    solution = sudokuMatrix;
    solved = true;
    return
end

currentCell = nextEmpty;
% find the possible values for the empty cell, 
% and return with failure if there are none
possibilities = findPossibilities(sudokuMatrix,currentCell);
if isempty(possibilities),
    solution = [];
    solved = false;
    return
end


% try all the possible values for the empty cell,
% and return with success if a solution is found
for i = 1:length(possibilities),
    guess = possibilities(i);
    sudokuMatrix(currentCell(1),currentCell(2)) = guess;
    [solution, solved] = solveSudokuBacktrack(sudokuMatrix, currentCell);
    if solved == true,
        return;
    end
end

% if execution reaches this point, no solution was found for current
% branch, and we now backtrack
return
