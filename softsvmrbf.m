function alpha = softsvmrbf(lambda, sigma, Xtrain, Ytrain)
  [m,d] = size(Xtrain);
  G=[ones(m,m)*2*lambda zeros(m,m);zeros(m,2*m)];
  A=[ones(m,m) eye(m,m); zeros(m,m) eye(m,m)];
  for i=1:m
    for j=1:m
      k=kernel(Xtrain(i,:),Xtrain(j,:),sigma);
      G(i,j)=G(i,j)*k;
      A(i,j)=Ytrain(i)*k;   
    end
  end
  f=[zeros(1,m),ones(1,m)*(1/m)];
  b=[ones(m,1)
  zeros(m,1)];
  ans=quadprog(G,f,-A,-b);
  alpha=ans(1:m);
end
