function [solution, solved] = solveSudokuBacktrack(sudokuMatrix, sudokuDegree, previousCell)
% solve a Sudoku puzzle using backracking
% The extra parameters sudokuDegree and previousCell are for internal speedup

% display partial solution so we can watch the solver in action
% (disable this to increase speed of solver)
sudokuMatrix

% look for an empty cell,
% and return with success if there are none
firstEmpty = findFirstEmpty(sudokuMatrix, sudokuDegree, previousCell);
if firstEmpty == [0,0],
    solution = sudokuMatrix;
    solved = true;
    return
end

% find the possible values for the empty cell, 
% and return with failure if there are none
possibilities = findPossibilities(sudokuMatrix,sudokuDegree,firstEmpty);
if isempty(possibilities),
    solution = [];
    solved = false;
    return
end

% try all the possible values for the empty cell,
% and return with success if a solution is found
for i = 1:length(possibilities),
    guess = possibilities(i);
    sudokuMatrix(firstEmpty(1),firstEmpty(2)) = guess;
    [solution, solved] = solveSudokuBacktrack(sudokuMatrix);
    if solved == true,
        return;
    end
end

% if execution reaches this point, no solution was found for current
% branch, and we now backtrack
return
