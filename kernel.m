function k = kernel(Xi,Xj,sigma)
  expT=-(norm(Xi-Xj))^2;
  exp1=expT/(2*sigma);
  k=exp(exp1);
end
