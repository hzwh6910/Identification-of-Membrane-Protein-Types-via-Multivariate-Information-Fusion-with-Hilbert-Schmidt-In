%read protein sequence
%note the path 
fasta_file_name='E:\Pre_Mem_Protein\DCT_NMBAC\D1\D1_training.txt';
[Header, Sequence] = fastaread(fasta_file_name);
Header=Header';
Sequence=Sequence';


n_protein = size(Sequence,1);


%PSSM_file_name
%note the path
%In order to facilitate the feature extraction, we rename the original sequence name by 0 to N. 
%(N is the total number of sequences. And the order is consistent with file "D1_training.txt")
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Dir_f = 'F:\Membrance Protein.PSSMÊµÑé\D1_pssm\D1_pssm\test\PSSM\';
val_name = '.pssm';
fileNames_PSSM = [];
for i=1:n_protein
	path_way = [Dir_f '\' num2str(i-1) val_name];
	lujing=cellstr(path_way);
	fileNames_PSSM = [fileNames_PSSM;lujing];
end



feature_PSSM_DCT=[];

for i=1:n_protein
	pp = Sequence(i);
	protein_s=cell2mat(pp);
	l_seq = size(protein_s,2);
	files_name = cell2mat(fileNames_PSSM(i));
	
	%read PSSM files
	PSSM_Matrix = Read_Text_files_PSSM(files_name,l_seq);

	P = PSSM_Matrix;
	
	%The DCT algorithm
	ff=dct2(P);
	%extract the first 400 coefficients
	ff = ff(1:20,1:20);

    feature_PSSM_DCT(i,:)=ff(:);i
	

end