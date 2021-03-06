% function [timesAverage, n] = startMeasure()
% input:
% output:
%   timesAverage ... 47x47 matrix of average times between two valid
%   key presses
%   n            ... 47x47 matrix of number of key pairs
%
% Starts the measuring process with KbQueue and sums the times between
% two valid keypresses, in the end the whole matrix is divided by the
% number of times these two keypresses were recorded, so it returns the
% average (timesAverage).
function [timesAverage, n] = startMeasure()
    lastTime=0;
    keys = [65:90, 48:57, 191, 187, 8, 9, 20, 160, 188, 190, 189, 161, 32];
    findKey = @(a) find(keys==a);
    times = zeros(length(keys), length(keys));
    n = zeros(length(keys), length(keys));
    lastKey = -1;
    lastAbsoluteKey = -1;
    KbQueueCreate();
    KbQueueStart();
    tic;
    
    while lastAbsoluteKey ~= 27
        [pressed, keyCode] = KbQueueCheck();
        if pressed
            keyCodeNum = find(keyCode);
            keyCodeNum = keyCodeNum(1);
            i = findKey(lastKey);
            j = findKey(keyCodeNum);
            if ~isempty(j)
                currentTime = toc;
                delta = currentTime-lastTime;
                lastTime = currentTime;
                if lastKey >= 0 && ~isempty(i)
                    fprintf('from:%d to:%d delta:%f\n',lastKey,keyCodeNum,delta);
                    times(i,j) = times(i,j) + delta;
                    n(i,j) = n(i,j) + 1;
                end
                lastKey = keyCodeNum;
            end
            lastAbsoluteKey = keyCodeNum;
        end
    end
    timesAverage = times./(n+(n==0));
end