function main()
    fprintf('starting measure\n')
    b = startMeasure();
    name = mainCalculate(b(:));
    fprintf('we know who you are, %s >:)\n', name);
end