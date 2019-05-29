n_protein = 2059;
load('F:\Membrance Protein.PSSM实验\序列\D4_training_2059_sequence.mat');
Dir_f = 'F:\Membrance Protein.PSSM实验\D4_pssm\D4_pssm\train\PSSM\';
val_name = '.pssm';
fileNames_PSSM = [];
for i=1:n_protein
    path_way = [Dir_f num2str(i-1) val_name];
    lujing=cellstr(path_way);
    fileNames_PSSM = [fileNames_PSSM;lujing];
end
lg = 30;
feature_PSSM = [];
for i=1:n_protein
    pp = s(1,i);
    files_name = cell2mat(fileNames_PSSM(i));
    protein_s=cell2mat(pp);
    l_seq = size(protein_s,2);
    %read PSSM file
    PSSM_Matrix = Read_Text_files_PSSM(files_name,l_seq);
    y_v = 1./(1+exp(-PSSM_Matrix));
    [ FEAT ] = PseudoPSSM( y_v, lg );
    feature_PSSM=[feature_PSSM;FEAT'];
    i
end