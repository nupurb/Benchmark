% Set parameters
numTrials = 50;

% make a random matrix A, whose width depends on the downsampling rate
downsampling = 5;
AHeight = 121;
AWidth = ceil(483/downsampling);
A = rand(AHeight, AWidth);

BSizes = 1000:2000:30000;
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

clf;
calibrateSensor(BSizes, averageTimes);
hold on;
xlabel('Width of B');
ylabel('Average Time for conv2 of A and B');
title(sprintf('Avg time for conv2 varying width of B --- A has dim: %d x %d', AWidth, AHeight));
hold off;
% plot(BSizes, averageTimes, 'bo');
% 
% xlabel('Width of B');
% ylabel('Average Time for conv2 of A and B');
% title(sprintf('Avg time for conv2 varying width of B --- A has dim: %d x %d', AWidth, AHeight));
% p = polyfit(BSizes, averageTimes, 1);
% yfit = polyval(p, BSizes);
% hold on;
% plot(BSizes, yfit);
% hold off;
% legend('Observed', 'Fit');
% 
% % computing r^2
% yresid = averageTimes - yfit;
% SSresid = sum(yresid.^2);
% SStotal = (length(averageTimes)-1) * var(averageTimes);
% rsq = 1 - SSresid/SStotal;



disp "BSizes"
disp(BSizes);
disp "averageTimes"
disp(averageTimes');
disp "variances"
disp(variances');

fprintf(1, 'Fit: y = %dx + %d \n', p(1), p(2));
fprintf(1, 'R^2: %d \n', rsq);

save('BSizes.mat', 'BSizes');
save('averageTimes.mat', 'averageTimes');
save('variances.mat', 'variances');

% save the plot
saveas(gcf, 'convtest_50trials_fullA.png');
