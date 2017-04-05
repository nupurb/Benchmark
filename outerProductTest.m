
numColFilters = 100;
colFilters = rand(121, numColFilters);

% one row filter
rowFilters = rand(1, 483);

spec = rand(121, 483); % a query


matAfterColFilters = colFilters' * spec;

numSamples = 1000;

resultPrint = conv2(matAfterColFilters, rowFilters, 'valid')