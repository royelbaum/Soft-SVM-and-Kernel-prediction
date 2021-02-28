function w = softsvm(lambda, Xtrain, Ytrain)
  [m,d] = size(Xtrain);
  H=[eye(d,d)*2*lambda zeros(d,m);zeros(m,d+m)];  
  f=[zeros(1,d),ones(1,m)*(1/m)];
  A=zeros(2*m,d+m);
  for i=1:m
    for j=1:d
      A(i,j)=Ytrain(i)*Xtrain(i,j);
    end
    A(i,d+i)=1;
  end
  for i=1:m
    A(m+i,d+i)=1;
  end
  b=zeros(2*m,1);
  for i=1:m
    b(i)=1;
  end
  ans=quadprog(H,f,-A,-b);
  w= ans(1:d);
end
