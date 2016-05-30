program main;

{$mode objfpc}{$H+}

uses math;

var
  i: integer;
  y: double;

begin
  y := 0;
  for i:=21 downto 1 do begin
    y := sqrt(y + i * 3);
    writeLn(i * 3, tmp, y, ' ');
  end;
  writeLn('Результат: ', y);
end.

