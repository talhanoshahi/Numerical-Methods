% octave code

a = input ("Enter the first expected root: ");
b = input ("Enter the last expected root: ");

str = input ("Enter the equation e.g \'@(x) x^3 + 7\'.: " , 's');
f = str2func(str); % converts the string into a function

if f(a) * f(b) > 0 % condition checks if the sign of both expected roots are different or not
	printf ("The root of equation is not found in the given range.\n");
	printf ("help: check if both roots have the same sign. Both roots should have different signs.");
end

midpoint = (a*f(b) - b*f(a)) / (f(b) - f(a));

% setting the initial midpoint_n_min_1
if a < 0
  midpoint_n_min_1 = a;
end

if b < 0
  midpoint_n_min_1 = b;
end

n = 1;

tolerance = input ("Enter the tolerance: "); % how many digits after decimal should the answer be accurate

while (midpoint - midpoint_n_min_1) > tolerance

	if f(midpoint) == 0
		break;
	end

	while true
		if f(a) * f(midpoint) < 0
			b = midpoint;
			break;
		end

		a = midpoint;
		break;
	end

	if n > 1
	  midpoint_n_min_1 = midpoint;
	  midpoint = (a*f(b) - b*f(a)) / (f(b) - f(a))
	  i++;
	  continue;
	end

	midpoint = (a*f(b) - b*f(a)) / (f(b) - f(a))
	i++;
	continue;
end

printf ("The root is: %d\n" , midpoint);
