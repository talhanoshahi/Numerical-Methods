% octave code 

a = input ("Enter first guessed root: ");
b = input ("Enter last guessed root: ");

fprintf ("Enter the equation: \n");
fprintf ("Example: @(x) x^3-x-1\n");

str = input ("Equation: " , 's');
f = str2func (str);

if f(a) * f(b) > 0
	fprintf ("\nPlease recheck the range!!!\n");
	exit;
end

tolerance = input ("Enter the tolerance: ");
max_iter = input ("Enter the maximum iterations: ");

x_n = b - ( (f(b) * (b - a) ) / (f(b) - f(a) ) );

break_for = 0; % used to break the for loop

total_iters = 0; % iterations used in order to find root

for i = 1:max_iter

  while true

    if abs(x_n - b) <= tolerance
      break_for = 1;
      break;
    end;

    a = b;
    b = x_n;
    break;

  end;

  if break_for == 1
  	total_iters = i;
    break;
  end;

  x_n = b - ( (f(b) * (b - a) ) / (f(b) - f(a) ) );

end;

fprintf ("\nThe root is: %d\n" , x_n);
fprintf ("Total iterations: %d\n" , total_iters);
  
