function[ACC,L_list,ac_list,acc,sum]=Accuracy(predict_y,predict_label)
L=size(predict_label,1);
C=predict_label(L,1)
L_list=[];
ac_list=[]
for i=1:C
    k=0
    m=0
    for j=1:L
        if predict_label(j,1)==i
            k=k+1;
            if predict_y(j,1)==i
                m=m+1
            end
        end
     end
    L_list(i,1)=k;
    ac_list(i,1)=m;
end
L_list=L_list(1:C,1)
ac_list=ac_list(1:C,1)
sum=0
acc=[];

for i=1:C
    sum=sum+ac_list(i,1);
    acc(i,1)=ac_list(i,1)/L_list(i,1);
end
ACC=sum/L;
end
    