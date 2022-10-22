mat_a_file = input ("Enter the filename of file containing matrix A: " , "s");
mat_b_file = input ("Enter the filename of file containing matrix B: " , "s");

A = csvread (mat_a_file)
B = csvread (mat_b_file)

len_a = length(A);

for i = 1:len_a
  
  if max(A(i , :)) != A(i , i)
    fprintf("This system of linear eqautions is not diagonally dominant at equation \"%d\".\n" , i);
    quit;
  end
  
end

XO = zeros (1 , len_a);
N = input("Enter the number of iterations: ");
tolerance = input ("Enter the tolerance: ");
x = XO;
k = 1;

while k < N
  
  for i = 1:len_a

    sum1 = 0;
    
    for j = 1:len_a

      if (i == j)
	continue;
      end

      sum1 = sum1 + (A(i , j) * XO(j));
      
    end

    x(i) = (B(i) - sum1)/A(i , i);

  end

  k = k + 1;

  if abs(x - XO) < tolerance
    break;
  end
  
  for i = 1:len_a
    XO(i) = x(i);
  end  

end


fprintf ("\nThe answer matrix is: \n");
x
csvwrite ("answer.csv" , x);
fprintf ("\nTotal iterations: %d\n" , k );
