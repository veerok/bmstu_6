var x, y, f:double; r:integer = 1;

begin
	write('введите x и y: ');
	readln(x, y);

	if (x >= 1) and (x <= 2) and (y >= -1) and (y <= 0) and (r >= (x-1) * (x-1) + (y+1) * (y+1)) then begin
		writeln ('Попало');
	end else begin
		writeln('Не попало');
	end;
end.

