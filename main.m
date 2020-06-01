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
    [name, minNorm, x] = mainCalculate(averageMatrix(:));
    fprintf('minimal norm: %f\n', minNorm);
    % fprintf('average time from space to shift: %f\n', averageMatrix(47,42));
    % fprintf('average time from space to capslock: %f\n', averageMatrix(47,41));
    tol = 0.02;
    if(x < tol), fprintf('could not detect\n');
    else, fprintf('we know who you are, %s >:)\n', name);
    end
end