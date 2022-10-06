% octave code

a = input ("Enter the first expected root: ");
b = input ("Enter the last expected root: ");

str = input ("Enter the equation e.g \'@(x) x^3 + 7\'.: ", 's');
f = str2func (str); % converts the string into a function

if f  (a) * f (b) > 0 % condition checks if the sign of both expected roots are different or not
    printf ("The root of equation is not found in the given range.\n");
    printf ("help: check if both roots have the same sign. Both roots should have different signs.");
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

printf ("\nThe root is: %d\n", midpoint);
