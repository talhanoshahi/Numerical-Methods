a = input ("Enter first guessed root: ");
b = input ("Enter last guessed root: ");

f = @(x) 4*x^3 + 2*x^2 - 8*x - 8;

if f(a) * f(b) > 0
  fprintf ("\nInvalid Range, root not in range\n");
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

fprintf ("The root is: %d\n" , x_n);
fprintf ("Total iterations: %d\n" , total_iters);
  
