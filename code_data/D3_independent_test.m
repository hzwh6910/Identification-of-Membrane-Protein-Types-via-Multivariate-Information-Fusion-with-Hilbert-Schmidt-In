clear;
%load data;
load('data\dataset3\train_label.mat');
load('data\dataset3\test_label.mat');
load('data\dataset3\D3_test_PSSM_AvBlock.mat');
load('data\dataset3\D3_test_PSSM_DCT.mat');
load('data\dataset3\D3_test_PSSM_DWT.mat');
load('data\dataset3\D3_test_PSSM_HOG.mat');
load('data\dataset3\D3_test_PSSM_Pse.mat');
load('data\dataset3\D3_train_PSSM_AvBlock.mat');
load('data\dataset3\D3_train_PSSM_DCT.mat');
load('data\dataset3\D3_train_PSSM_DWT.mat');
load('data\dataset3\D3_train_PSSM_HOG.mat');
load('data\dataset3\D3_train_PSSM_Pse.mat');
train_label = train_label;
test_label=test_label;
train_X=[D3_train_PSSM_AvBlock,D3_train_PSSM_DCT,D3_train_PSSM_DWT,D3_train_PSSM_HOG,D3_train_PSSM_Pse];
test_X=[D3_test_PSSM_AvBlock,D3_test_PSSM_DCT,D3_test_PSSM_DWT,D3_test_PSSM_HOG,D3_test_PSSM_Pse];
COM_X = [train_X;test_X];
COM_X = line_map(COM_X);
c=5;
train_X_S = COM_X(1:3073,:);
test_X_S = COM_X(3074:end,:);
gamma_list = [2^-2,2^-2,2^-3,2^-2,2^-4]
feature_id=[1,400;401,800;801,1840;1841,2090;2091,2710]
%cg_str = '-c 2 -g 0.0625 -b 1';
%model1=svmtrain(train_label,train_X_S(:,2091:2710),cg_str);
%[predict_y,accuracy1,Scores_f1]=svmpredict(test_label,test_X_S(:,2091:2710),model1,'-b 1');
[accuracy,predict_y,Scores,kernel_weights] = mk_svm(train_X_S,feature_id,train_label,test_X_S,test_label,c,gamma_list);
