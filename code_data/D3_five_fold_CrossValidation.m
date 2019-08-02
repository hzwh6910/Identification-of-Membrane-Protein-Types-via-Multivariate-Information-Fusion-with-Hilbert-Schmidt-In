clear;
%acc_time =[];%Average results of each 50% cross validation;
acc_fold =[];% Results of cross-validation per fold;
for t=1:5  % Do 5 times cross-validations
    seed = 12345678;
    rand('seed', seed);
    %load data
    load('data\dataset3\train_label.mat');
    load('data\dataset3\D3_train_PSSM_AvBlock.mat');
    load('data\dataset3\D3_train_PSSM_DCT.mat');
    load('data\dataset3\D3_train_PSSM_DWT.mat');
    load('data\dataset3\D3_train_PSSM_HOG.mat');
    load('data\dataset3\D3_train_PSSM_Pse.mat');
    train_label = train_label;
    train_X=[D3_train_PSSM_AvBlock,D3_train_PSSM_DCT,D3_train_PSSM_DWT,D3_train_PSSM_HOG,D3_train_PSSM_Pse];
    train_X_S = line_map(train_X);
    [row,col]=size(train_X_S);%The data set is an M by N matrix, where each row represents a sample;
    indices=crossvalind('Kfold',train_X_S(1:row,col),5);%Random subcontracting;
   
    
    for k=1:5 %Cross-validation k=5 5 packages in turn as the test set;
        test = (indices == k); %Gets the cell number of the test set element in the dataset;
        train = ~test; %he training set elements are numbered as non-test set elements;
        train_data=train_X_S(train,:);%Divide the data of train sample from the data set;
        train_target=train_label(train,:); %Get the test target for the sample set, in this case the actual classification case;
        test_data=train_X_S(test,:);%The test sample set;
        test_target=train_label(test,:);
        c=1.25+2^-5;
        gamma_list = [2^-2,2^-2,2^-3,2^-2,2^-4];
        feature_id=[1,400;401,800;801,1840;1841,2090;2091,2710]
        %cg_str = ' -c 8 -g 0.0625 -b 1';
        %model1=svmtrain(train_target,train_data(:,2091:2710),cg_str);
        %[predict_y,accuracy,Scores_f1]=svmpredict(test_target,test_data(:,2091:2710),model1,'-b 1');
        [accuracy,predict_y,Scores,kernel_weights] = mk_svm(train_data,feature_id,train_target,test_data,test_target,c,gamma_list);
        acc_fold = [acc_fold,accuracy(1,1)];
    end
    %acc_fold_mean=mean(acc_fold,2);
    %acc_time = [acc_time,acc_fold_mean];
end
%The mean and standard deviation of the five cross-validations will be calculated below;
mean_accuracy = mean(acc_fold);%Calculate the mean;
std_accuracy = std(acc_fold,0,2);%Calculate standard deviation;
disp(acc_fold);
fprintf('mean_accuracy=%g\n',mean_accuracy);
fprintf('std_accuracy=%g\n',std_accuracy);
