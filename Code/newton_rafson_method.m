% octave code 

a = input ("Enter the initial range guess: ");
b = input ("Enter the final range guess: ");

fprintf ("Enter the equation: \n");
fprintf ("Example: @(x) x^3-x-1\n");

str = input ("Equation: " , 's');
f = str2func (str);

if f(a) > 0 ||  f(b) < 0
	fprintf ("\nPlease recheck the range!!!\n");
	exit;
end;

tolerance = input ("Enter the tolerance: ");

x_prev = (a+b)/2;

f_deri = (f(x_prev + 1e-6) - f(x_prev)) / (1e-6);
x_n = x_prev - (f(x_prev) / f_deri);

while f(x_n) > tolerance
	
	if f(x_n) == 0
		break;
	end;

	x_prev = x_n;

	f_deri = (f(x_prev + 1e-6) - f(x_prev)) / (1e-6);
	x_n = x_prev - (f(x_prev) / f_deri);

end;

fprintf ("\nThe root is: %d\n" , x_n);


