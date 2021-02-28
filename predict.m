function Ypredict=predict(Xtrain,W)
  [m,d]=size(Xtrain);
  for i=1:m
    tmp=0;
    for j=1:d
      tmp=tmp+Xtrain(i,j)*W(j);
    end
    if tmp>0
      Ypredict(i,1)=1;
    else
      Ypredict(i,1)=-1;
    end
   end
end
