% function saveMeasure(user, text, i)
% input:
%   user ...  string, name of the user saving the measure
%   text ...  string, name of the text being measured
%   i    ...  int, nubmer of measure being saved
% ouput:
%
% This function calls startMeasure and saves the result into
% data/user/text/i.mat
function saveMeasure(user, text, i)
    if exist(sprintf('data/%s', user)) ~= 7
        mkdir(sprintf('data/%s', user));
    end
    if exist(sprintf('data/%s/%s', user, text)) ~= 7
        mkdir(sprintf('data/%s/%s', user, text));
    end
    path = sprintf('data/%s/%s/%d.mat', user, text, i);
    X = startMeasure();
    save(path, 'X');
end