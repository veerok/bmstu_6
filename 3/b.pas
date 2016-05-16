var x,y,w,min:integer;
var answer:single;

begin
  writeln('введите x'); readln(x);
  writeln('введите y'); readln(y);
  writeln('введите w'); readln(w);
 
  min:=x;

  //находим минимум
  if (y<x) and (y<w) then
	  min:=y
  else
    if (w<x) and (w<y) then
  	  min:=w;
  answer:=min-sqr(y)-sqr(w);
  writeln(answer);
end.

