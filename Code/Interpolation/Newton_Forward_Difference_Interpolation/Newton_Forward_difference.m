x_file = input ("Enter the name of the csv file containing x matrix: " , "s");
y_file = input ("Enter the name of the csv file containing y matrix: " , "s");

% checking if the x_file exist or not
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

% checking if the data is equispaced by using a user-defined funtion
if is_equispaced (x , x_len) == false
  fprintf ("\error: The data in the x-matrix must be equispaced but is not in this case.\n");
  fprintf ("Equispaced means that the diffrence between any two consecutive entries should be the same.\n");
  exit;
end

% creating a matrix called delta_matrix and storing the x-mat and y-mat in it
delta_columns = y_len + 1;
delta_matrix = zeros(y_len , delta_columns);
delta_matrix (: , 1) = csvread ("x_mat.csv");
delta_matrix (: , 2) = csvread ("y_mat.csv");

% finding the value of y-deltas
column_looped = 0;
for i = 3:y_len
  
  for j = 1:(y_len-column_looped-1)
    delta_matrix (j , i) = delta_matrix (j+1 , i-1) - delta_matrix (j , i-1);
  end

  column_looped++;

end

fprintf ("\nThe resulting delta matrix is: \n");
disp(delta_matrix);

required_x = input("\nEnter the value of x you find to find y at: ");
x_difference = x(2) - x(1);
midpoint = (required_x - x(1)) / x_difference;

result = y(1);
for i = 3:delta_columns
  new_midpoint = midpoint;

  j = 0;
  while j < (i-2)
    if j > 0
      new_midpoint = new_midpoint * (midpoint - j);
    end

    j++;
  end

  result = result + ((new_midpoint * delta_matrix(1,i)) / factorial(i-2))
  
end

fprintf("\nThe resulting y at x=%d is: %d\n" , required_x , result);
