x_file = input ("Enter the file containing x-matrix: " , "s");
y_file = input ("Enter the file containing y-matrix: " , "s");

% checking if the file exists
if ~exist(x_file)
  fprintf ("\nerror: The file \"%s\" does not exist.\n" , x_file);
  exit;
end

% checking if the y_file exist
if ~exist(y_file)
  fprintf ("\nerror: The file \"%s\" does not exist.\n" , y_file);
  exit;
end

% reading the both matrices from the csv files
x = csvread (x_file);
y = csvread (y_file);

% finding the length of both matrices to check if both matrices have equal number of elements
x_len = length(x);
y_len = length(y);

if x_len ~= y_len
  fprintf ("\nerror: The length of x and y matrices does not match.\n");
  exit;
end

% creating a matrix called difference_matrix and storing the x-mat and y-mat in it
difference_columns = y_len + 1;
diffrence_rows = y_len;
difference_matrix = zeros(y_len , difference_columns);
difference_matrix (: , 1) = x;
difference_matrix (: , 2) = y;

% finding the values in difference_matrix
column_looped = 0;
for i = 3:difference_columns

  for j = 1:(diffrence_rows-column_looped-1)
    difference_matrix(j , i) = (difference_matrix(j+1 , i-1) - difference_matrix(j , i-1)) / (difference_matrix(((j+1)+column_looped) , 1) - (difference_matrix(j , 1)));
  end

  column_looped++;

end

fprintf ("\nDivided Difference matrix: \n");
disp (difference_matrix);

x_find = input ("\nEnter the value of x you want to find y at: ");

result = difference_matrix(1 , 2);
for i = 3:difference_columns

  multiplicand = 1;
  j = 0;
  while j < (i-2)
    multiplicand = multiplicand * (x_find - difference_matrix(j+1 , 1));
    j++;				  
  end

  result = result + (multiplicand * difference_matrix(1 , i));
  
end

fprintf("\nThe resulting y at x=%d is: %d\n" , x_find , result);
