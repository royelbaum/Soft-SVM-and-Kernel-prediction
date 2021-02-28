function Ypredict=predict_kernel(Xtrain,Xtest,alpha,sigma)
  [m1,d]=size(Xtest);
  [m2,d]=size(Xtrain);
  
  for i=1:m1 
    tmp=0;
    for j=1:m2
      tmp=tmp+ alpha(j)*kernel(Xtest(i,:),Xtrain(j,:),sigma);
    end
    if tmp>0
      Ypredict(i,1)=1;
    else
      Ypredict(i,1)=-1;
    end
    end
end
