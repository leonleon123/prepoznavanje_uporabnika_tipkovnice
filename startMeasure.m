function [timesAverage] = startMeasure()
    s=0;
    tic;
    keys = [65:90, 48:57, 191, 187, 8, 9, 20, 160, 188, 190, 189, 161, 32];
    poisci = @(a) find(keys==a);
    casi = zeros(length(keys), length(keys));
    n = ones(length(keys), length(keys));
    lastKey = -1;
    KbQueueCreate();
    KbQueueStart();
    
    while lastKey ~= 27
        [pressed, keyCode] = KbQueueCheck();
        if pressed
            a = toc;
            delta = a-s;
            s = a;
            keyCodeNum = find(keyCode);
            if length(keyCodeNum) > 1
                keyCodeNum = keyCodeNum(1);
            end
            fprintf('from:%d to:%d\n',lastKey,keyCodeNum);
            if lastKey >= 0
                i = poisci(lastKey);
                j = poisci(keyCodeNum);
                if ~isempty(i) && ~isempty(j)
                    casi(i,j) = casi(i,j) + delta;
                    n(i,j) = n(i,j) + 1;
                end
            end
            lastKey = keyCodeNum;
        end
    end
    timesAverage = casi./n;
end