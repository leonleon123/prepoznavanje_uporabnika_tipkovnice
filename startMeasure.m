function [timesAverage, n] = startMeasure()
    s=0;
    keys = [65:90, 48:57, 191, 187, 8, 9, 20, 160, 188, 190, 189, 161, 32];
    findKey = @(a) find(keys==a);
    times = zeros(length(keys), length(keys));
    n = zeros(length(keys), length(keys));
    lastKey = -1;
    KbQueueCreate();
    KbQueueStart();
    tic;
    
    while lastKey ~= 27
        [pressed, keyCode] = KbQueueCheck();
        if pressed
            a = toc;
            delta = a-s;
            s = a;
            keyCodeNum = find(keyCode);
            keyCodeNum = keyCodeNum(1);
            fprintf('from:%d to:%d delta:%f\n',lastKey,keyCodeNum,delta);
            if lastKey >= 0
                i = findKey(lastKey);
                j = findKey(keyCodeNum);
                if ~isempty(i) && ~isempty(j)
                    times(i,j) = times(i,j) + delta;
                    n(i,j) = n(i,j) + 1;
                end
            end
            lastKey = keyCodeNum;
        end
    end
    timesAverage = times./(n+(n==0));
end