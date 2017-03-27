function [ mdl, mdlCIs ] = calibrateSensor( inputs, outputs )

mdl = fitlm(inputs, outputs);
mdlCIs = coefCI(mdl); %default 95% CI

hold on;
plot(inputs, outputs, 'o', 'LineWidth', 2.0);
axis([min(inputs) max(inputs) min(outputs) max(outputs)]);
predX = min(inputs):0.1:max(inputs);
predY = predict(mdl, predX');
plot(predX, predY, '-');
legend('Data', 'Linear fit');

fittxt = sprintf('Linear Fit: y = %.8f * x + %.12f\nSlope 95%% CI: (%.12f, %.12f)\nIntercept 95%% CI: (%.12f, %.12f)', mdl.Coefficients.Estimate(2), mdl.Coefficients.Estimate(1), mdlCIs(2, 1), mdlCIs(2, 2), mdlCIs(1, 1), mdlCIs(1, 2));
text(max(inputs)*0.1, max(outputs)*0.9, fittxt);
hold off;

% [y_predicted, y_predicted_CI] = predict(mdl, x) will give predicted
% values and confidence intervals.

end

