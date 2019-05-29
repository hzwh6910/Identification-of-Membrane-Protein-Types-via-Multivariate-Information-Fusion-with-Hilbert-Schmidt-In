%D1_telΪNx1;D1_tel1ΪNx8(1 -1);D1_tel2ΪNx8(1 0);
D1_train=D4_train_PSSM;
D1_test=D4_test_PSSM;
train_X = [D1_train];
test_X = [D1_test];
%D1_tel2=D1_Test_label;
%D1_trl2=D1_Train_label;
%[D1_trl1,D1_tel1]=translate_label(D1_Train_label,D1_Test_label);
COM_X = [train_X;test_X];
COM_X = line_map(COM_X);
c=5;
train_X_S = COM_X(1:2059,:);
test_X_S = COM_X(2060:end,:);
gamma_list = [2^-3,2^-2,2^-4,2^-2,2^-4]
feature_id=[1,400;401,800;801,1840;1841,2090;2091,2710]
[predict_y,Scores,kernel_weights] = mk_svm(train_X_S,feature_id,D4_trl,test_X_S,D4_tel,c,gamma_list);
%[predict_y,Scores] = mkl_SRC_hsic(train_X_S,feature_id,D1_trl,test_X_S,1,gamma_list);
[ACC,L_list,ac_list,acc,sum] = Accuracy( predict_y,D4_tel )