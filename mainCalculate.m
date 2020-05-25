function res = mainCalculate(b)
    cd tests
    norms = [];
    names = [];
    for userDirTmp=ls'
        if userDirTmp(1) ~= '.'
            userDir = strtrim(userDirTmp');
            names = [names userDirTmp];
            A = generateUserMatrix(userDir);
            [U,S,~] = svd(A);
            y = (U*S)\b;
            norms = [norms norm(U'*b - S*y)];
        end
    end
    [~,i] = min(norms);
    names = names';
    res = strtrim(names(i,:));
    cd ..
end

function A = generateUserMatrix(userDir)
    A = [];
    if userDir(1) ~= '.'
        cd(userDir)
        for testDirTmp=ls'
            testDir = strtrim(testDirTmp);
            if testDir(1) ~= '.'
                cd(testDir)
                for test=ls'
                    if test(1) ~= '.'
                        load(strtrim(test'), 'X');
                        A = [A X(:)];
                    end
                end
                cd ..
            end
        end
        cd ..
    end
end