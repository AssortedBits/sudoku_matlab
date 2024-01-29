function [solution, solved] = solveSudokuBacktrack_optimized(sudokuMatrix, previousCell)
% solve a Sudoku puzzle using backtracking

% display partial solution so we can watch the solver in action
% (disable this to increase speed of solver)
%sudokuMatrix

% look for next empty cell,
% and return with success if there are none
while true,

    nextEmpty = findNextEmpty(sudokuMatrix, previousCell);

    if nextEmpty == [0,0]
        solution = sudokuMatrix;
        solved = true;
        return
    end

% find the possible values for the empty cell, 
% and return with failure if there are none
possibilities = findPossibilities(sudokuMatrix,nextEmpty);
if isempty(possibilities),
    solution = [];
    solved = false;
    return
end

% try all the possible values for the empty cell,
% and return with success if a solution is found
testCell = nextEmpty;
for i = 1:length(possibilities),
    guess = possibilities(i);
    sudokuMatrix(testCell(1), testCell(2)) = guess;
    [solution, solved] = solveSudokuBacktrack_optimized(sudokuMatrix, testCell);
    if solved == true,
        return;
    end
end

% if execution reaches this point, no solution was found for current
% branch, and we now backtrack
return

