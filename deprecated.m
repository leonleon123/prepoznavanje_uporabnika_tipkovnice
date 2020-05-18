s = 0;
p = zeros(1,256);
old=DisableKeysForKbCheck([13]);

while 1
    [secs, keyCode, deltaSecs] = KbWait();
    %[keyIsDown, secs, keyCode, deltaSecs] = KbCheck();
    if ~all(keyCode==p)
        find(keyCode)
        k = KbName(keyCode);
        if iscell(k)
            fprintf('%s %5f\n',string(k(1)),secs-s);
        else
            fprintf('%s %5f\n',k,secs-s);
        end

        s = secs;
        p = keyCode;
    end
end