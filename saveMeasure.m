function saveMeasure(user, text, i)
    if exist(sprintf('tests/%s', user)) ~= 7
        mkdir(sprintf('tests/%s', user));
    end
    if exist(sprintf('tests/%s/%s', user, text)) ~= 7
        mkdir(sprintf('tests/%s/%s', user, text));
    end
    path = sprintf('tests/%s/%s/%d.mat', user, text, i);
    X = startMeasure();
    save(path, 'X');
end