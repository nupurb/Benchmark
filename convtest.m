% Set parameters
numTrials = 2;

% make a random matrix A, whose width depends on the downsampling rate
downsampling = 1;
AWidth = ceil(483/downsampling);
A = rand(121, AWidth);

BSizes = 1000:1000:30000;
numSizes = length(BSizes);
% Vector to save the time taken
averageTimes = [];
variances = [];
times = [];

for sizeIndex = 1:numSizes
    currentWidth = BSizes(sizeIndex);
    B = rand(121, currentWidth);

    for i=1:numTrials
        tic;
        conv2(B, A, 'valid'); % take the valid convoluton
        times(i) = toc;
    end
    
    averageTimes(sizeIndex) = mean(times);
    variances(sizeIndex) = var(times);
end

plot(BSizes, averageTimes, 'bo');
xlabel('Width of B');
ylabel('Average Time for conv2 of A and B');
p = polyfit(BSizes, averageTimes, 1);
fprintf(1, 'Fit: y = %dx + %d \n', p(1), p(2));

% computing r^2
yfit = polyval(p, BSizes);
yresid = averageTimes - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(y)-1) * var(y);
rsq = 1 - SSresid/SStotal;
fprintf(1, 'R^2: %d \n', rsq);

figure();
plot(BSizes, variances);

