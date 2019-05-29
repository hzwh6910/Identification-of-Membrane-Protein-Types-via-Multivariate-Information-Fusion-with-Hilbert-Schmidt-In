% n_protein = 4802;
% load('D:\MATLAB 2017a\wei\locations_37.mat');
% Dir_f = 'D:\MATLAB 2017a\wei\PSSM\';  
n_protein = 2059;
load('F:\Membrance Protein.实验\序列\D4_training_2059_sequence.mat');
Dir_f = 'F:\实验\whsx\D4_train_M\'; 
val_name = '.pssm';
fileNames_PSSM = [];
for i=1:n_protein
    path_way = [Dir_f num2str(i-1) val_name];
    lujing=cellstr(path_way);
	fileNames_PSSM = [fileNames_PSSM;lujing];
end
feature_PSSM_DWT_P=[];
for i=1:n_protein
    Seq_Length = length(s{1,i});
	files_name = cell2mat(fileNames_PSSM(i));
	PSSM_Matrix = Read_Text_files_PSSM(files_name,Seq_Length);
	P = PSSM_Matrix;
	P = P';
	FF = GetDWT(P);
    feature_PSSM_DWT_P(i,:)=FF(:);i
end
