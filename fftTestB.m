% Set parameters
numTrials = 2000;

% Set up the matrix, model downsampling using a smaller matrix
B = rand(121, 20000);
% Vector to save the time taken
times = [];


for i=1:numTrials
    tic;
    fft2(B);
    times(i) = toc;
end

disp('Mean');
disp(mean(times));
disp('Variance');
disp(var(times));