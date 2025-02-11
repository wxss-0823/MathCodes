load thin5.mat
thin5 = path_loss_final;
load wide35.mat
wide35 = path_loss_final;
diff = thin5 - wide35;
path_loss_final = diff;