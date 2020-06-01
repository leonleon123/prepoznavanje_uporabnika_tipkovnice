% function main()
% input:
% output:
% 
% The main method which calls startMeasure to generate the test matrix for
% the test subject. Then this matrix is passed to mainCalculate, which
% returns the alleged name of the test subject and then it prints it.
function main()
    fprintf('starting measure\n')
    averageMatrix = startMeasure();
    name = mainCalculate(averageMatrix(:));
    fprintf('we know who you are, %s >:)\n', name);
end