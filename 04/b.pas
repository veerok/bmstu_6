program main;

{$mode objfpc}{$H+}

uses math;


function getFac(iterations: integer): double;
var
  i: integer;
  sum: double;
begin
  sum := 0;

  for i:=1 to iterations+1 do
  begin
    sum := sum + 1 / (i*(i+1)*(i+2)*(i+3));
  end;
  result := sum;
end;







