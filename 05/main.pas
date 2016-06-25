program main;

{$mode objfpc}{$H+}

var
  i: integer;
  b: boolean;
  min: integer;
  pointer: integer;
  list: array [1..30] of integer = (15, 29, 76, 79, 63, 95, 12, 2, 85, 6, 85, 51, 98, 98, 45, 85, 69, 62, 33, 34, 52, 86, 74, 47, 5, 17, 97, 75, 99, 9);
begin

  min := 0;
  pointer := 0;

  for i:=1 to length(list) do begin
    b := min < list[i];
    write(min, ' < ', list[i], ' = ', b, ' - ');
    if b then begin
      write('keep this number');
      min := list[i];
      pointer := pointer + 1;
      list[pointer] := list[i];
    end else begin
      write('remove');
    end;
    writeln;
  end;

  // setlength(list, 2);

  writeln('===== The pointer is ', pointer);


  for i:=1 to length(list) do begin
    writeln(list[i]);
  end;


end.
