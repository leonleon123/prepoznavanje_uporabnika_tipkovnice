% function main()
% input:
% output:
% 
% The main method which calls startMeasure to generate the test matrix for
% the test subject. Then this matrix is passed to mainCalculate, which
% returns the alleged name of the test subject and then it prints it.
function main()
    fprintf('starting measure\n')
    timesAverage = startMeasure();
    [name, relError] = mainCalculate(timesAverage(:));
%     fprintf('average time from space to shift: %f\n', averageMatrix(47,42));
%     fprintf('average time from space to capslock: %f\n', averageMatrix(47,41));
    tol = 0.1;
    fprintf("relative error: %f\n", relError);
    if(relError < tol), fprintf('could not identify\n');
    else, fprintf('we know who you are, %s >:)\n', name);
    end
end