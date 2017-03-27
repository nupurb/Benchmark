% Set parameters
numTrials = 100000;

% Set up the matrix, model downsampling using a smaller matrix
A = rand(121, 483);
% Vector to save the time taken
times = [];


for i=1:numTrials
    tic;
    fft2(A);
    times(i) = toc;
end

disp('Mean');
disp(mean(times));
disp('Variance');
disp(var(times));