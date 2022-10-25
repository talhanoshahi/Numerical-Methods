% octave code
% the files should CSV files
mat_a_file = input ("Enter the filename of file containing matrix A: " , "s");
mat_b_file = input ("Enter the filename of file containing matrix B: " , "s");

% reading the files to store the data in a matrix
A = csvread (mat_a_file);
B = csvread (mat_b_file);

fprintf("\nThe matrix A read from the file is:\n");
disp (A);
fprintf("The matrix B read from the file is:\n");
disp (B);

% checking if matrix A is a square matrix
size_a = size(A);
if size_a(1) != size_a(2)
  fprintf ("\nerror: A is not a sqaure matrix\n");
  quit;
end

% both no. of columns and no. of rows will be equal as for square matrix
len_a = length(A);

% checking if the matrix is diagnolly dominant
dominant = true;
i = 1;
while i < len_a

  if max(A(i , :) > A(i , i))
    fprintf("\nThe matrix A is not diagnolly dominant.\n");
    dominant = false;
    break;
  end

  i++;
end

if dominant == false

  fprintf ("Rearranging the matrix A to make it diagnolly dominant.\n");

  while i < len_a
  
    if max(A(i , :)) > A(i , i)
    
      for j = i:len_a

	if max(A(j , :)) == A(j , i)

	  temp_a = A(j , :);
	  A(j , :) = A(i , :);
	  A(i , :) = temp_a;

	  temp_b = B(j);
	  B(j) = B(i);
	  B(i) = temp_b;
	  
	end
      
      end
    
    end

    i++;
    
  end
  
end

fprintf ("\nThe rearranged matrix A is:\n")
disp (A);
fprintf ("The rearranged matrix B is:\n");
disp (B);

% checking if any diagonal value is zero
for i = 1:len_a

  if A(i , i) == 0
    fprintf ("The matrix A have 0 in the diagnol at A(%d , %d).\n" , i , i);
    fprintf ("The solution of a matrix having 0 in diagonal is not possible.");

    quit;
  end
end


XO = zeros (1 , len_a);
N = input("\nEnter the number of iterations: ");
tolerance = input ("Enter the tolerance: ");
x = XO;
k = 1;

while k < N
  
  for i = 1:len_a

    sum_jacobi = 0;
    sum_seidel = 0;

    % loop for the Seidel summation
    for j = 1:(i-1)
	
      if (i == j)
	continue;
      end

      sum_seidel = sum_seidel + (A(i , j) * x(j));
      
    end

    % loop for the Jacobi summation
    for j = (i+1):len_a

      if (i == j)
	continue;
      end

      sum_jacobi = sum_jacobi + (A(i , j) * XO(j));
      
    end      

    x(i) = (B(i) - sum_seidel - sum_jacobi)/A(i , i);

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
disp (x);
fprintf ("\nTotal iterations: %d\n" , k );

answer_file = input ("\nEnter the name of the file to store answer matrix in: " ,"s");
fprintf ("Witing the answer matrix to the file \"%s\".\n" , answer_file);
csvwrite (answer_file , x);
