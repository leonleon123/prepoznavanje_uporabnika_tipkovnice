% function res = mainCalculate(b)
% input:
%   b ... 47x47 matrix of averageTimes between valid keypresses
%   of the person being tested at the moment
% output:
%   res ... string, name of the alleged user who performed the measure
%   minNorm ... float, minimal norm for all users
%   x ... float, nonsense detection factor
% This is only used from main, it goes through the file structure of the
% tests and figures out who you are.
function [res, minNorm, x] = mainCalculate(b)
    cd data
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
    [minNorm, i] = min(norms);
    x=1-minNorm/max(norms);
    names = names';
    res = strtrim(names(i,:));
    cd ..
end

% function A = generateUserMatrix(userDir)
% input:
%   userDir ... string, name of the user, for which the A matrix is
%   returned
% ouptut:
%   A ...  2209xm matrix, where m is the number of test measures for the
%   person userDir, columns are all the columns from test matrices stacked
%   on top of each other.
%
% This goes through all folders in the directory data/userDir and concatenates
% all the columns stacked on top of each other. Each column of A is one
% of the test matrices transformed into a column vector.
function A = generateUserMatrix(userDir)
    A = [];
    cd(userDir)
    for dataDirTmp=ls'
        dataDir = strtrim(dataDirTmp);
        if dataDir(1) ~= '.'
            cd(dataDir)
            for data=ls'
                if data(1) ~= '.'
                    load(strtrim(data'), 'X');
                    A = [A X(:)];
                end
            end
            cd ..
        end
    end
    cd ..
end