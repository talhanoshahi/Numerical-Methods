% octave code

a = input ("Enter the first expected root: ");
b = input ("Enter the last expected root: ");

fprintf ("Enter the equation: \n");
fprintf ("Example: @(x) x^3-x-1\n");

str = input ("Equation: " , 's');
f = str2func (str);

if f  (a) * f (b) > 0 % condition checks if the sign of both expected roots are different or not
	fprintf ("\nPlease recheck the range!!!\n");
	exit;
end

midpoint = (a + b) / 2;

tolerance = input ("Enter the tolerance: "); % how many digits after decimal should the answer be accurate

while abs(f(midpoint)) > tolerance

  if f(midpoint) == 0
    break;
  end
  
  while true

    if f(a) * f (midpoint) < 0
      b = midpoint;
      break;
    end

    a = midpoint;
    break;

  end

  midpoint = (a + b) / 2;

end

fprintf ("\nThe root is: %d\n", midpoint);
