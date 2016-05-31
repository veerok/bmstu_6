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
var
result, sample: double;
counter: integer;
begin

// 9,073415289388
 sample := 0.05;
  counter := 1;
repeat
  result := getFac(counter);
  writeLn('Iteration ', counter, ' result ', result);
  inc(counter);
 until result > sample; 
end. 






