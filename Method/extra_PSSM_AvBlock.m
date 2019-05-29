n_protein = 2625;
load('E:\Membrance Protein.实验\序列\D4_testing_2625_sequence.mat ');
Dir_f = 'E:\Membrance Protein.实验\D4_pssm\D4_pssm\test\PSSM\';
val_name = '.pssm';
fileNames_PSSM = [];
for i=1:n_protein
    path_way = [Dir_f num2str(i-1) val_name];
    lujing=cellstr(path_way);
	fileNames_PSSM = [fileNames_PSSM;lujing];
end
feature_AvBlock=[];
for i=1:n_protein
    Seq_Length = length(s{1,i});
    files_name = cell2mat(fileNames_PSSM(i));
    PSSM_Matrix = Read_Text_files_PSSM(files_name,Seq_Length);
    P = PSSM_Matrix;
    FF = AvBlock(P);
    feature_AvBlock(i,:)=FF(:);i
end