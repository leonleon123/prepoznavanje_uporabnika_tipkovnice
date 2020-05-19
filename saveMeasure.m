function saveMeasure(name, i)
    path = sprintf('%s/%d.mat', name, i);
    X = startMeasure();
    save(path, 'X');
end