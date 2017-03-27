% Set parameters
downsampling = 16;
numTrials = 1000000;

% Set up the matrix, model downsampling using a smaller matrix
A = rand(121, int64(483/downsampling));
% Vector to save the time taken
times = [];


for i=1:numTrials
    tic;
    sum(A .* A);
    times(i) = toc;
end

disp('Mean');
disp(mean(times));
disp('Variance');
disp(var(times));