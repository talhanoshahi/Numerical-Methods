A = [ 10 , -1 , 2 , 0;
      -1 , 11 , -1 , 3;
      2 , -1 , 10 , -1;
      0 , 3 , -1 , 8; ];

B = [ 6 ; 25 ; -11 ; 15 ];
XO = zeros (1 , length(A));
N = input("Enter the number of iterations: ");
tolerance = input ("Enter the tolerance: ");
x = XO;
n = length(A);
k = 1;

while k < N
  
  for i = 1:n

    sum1 = 0;
    
    for j = 1:n

      if (i == j)
	continue;
      end

      sum1 = sum1 + (A(i , j) * XO(j));
      
    end

    x(i) = (B(i) - sum1)/A(i , i);

  end

  if abs(x - XO) < tolerance
    break;
  end
  
  for i = 1:n
    XO(i) = x(i);
  end
  
  k = k + 1;

end


fprintf ("\nThe answer matrix is: \n");
x
fprintf ("\nTotal iterations: %d\n" , k );
