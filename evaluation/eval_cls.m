function [cls_error] = eval_cls(predict_file, gtruth_file, num_pred_per_image)

preds = cell(1, 5);
[predlist, preds{1}, preds{2}, preds{3}, preds{4}, preds{5}] = textread(predict_file, '%s %d %d %d %d %d');
preds = cell2mat(preds);

[filelist, labels] = textread(gtruth_file, '%s %d');

assert(length(filelist)==length(predlist), 'number of predictions does not match number of ground truth');

filemap = containers.Map(predlist, 1:length(predlist));
pred_idx = cell2mat(filemap.values(filelist));

assert(length(pred_idx)==length(unique(pred_idx)), 'predictions are not unique');

preds = preds(pred_idx, :);

for i=1:length(num_pred_per_image)
  n = num_pred_per_image(i);
  cls_error(i) = 1 - mean(any(preds(:, 1:n)==repmat(labels, [1 n]), 2));
end
