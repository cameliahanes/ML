function J = ComputeCost (X, y, theta)

  m = length(y);
  
  
  %compute th hypothesis matrixv (vector)
  
  h  = X * theta;

  %calculate the oost
  
  J = 1 / (2*m) * sum( (h-y).^2 ) ;
endfunction
