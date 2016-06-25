program main;

{$mode objfpc}{$H+}

uses
 Sysutils;

const
  FILE_PATH = './file.txt';

var
  AnFile: TextFile;
  text: string;
  lines: array of string;
  i: integer = 1;
  j: integer;
  num: integer;
begin

  writeln('Какую строку удалить? ');
  readln(num);

  // Указываем файлы, которые будем использовать
  assignFile(AnFile, FILE_PATH);

  // Открываем файл на чтение
  reset(AnFile);

  while not eof(AnFile) do begin

  	setlength(lines, i+1);
    // Считываем символ в переменную
    readln(AnFile, text);
    writeln('Исходник строка №', i, ': ', text);
    lines[i] := text;

    inc(i);

  end;

  // Открываем файл на запись
  rewrite(AnFile); 

  writeln;

  for j:=1 to length(lines) - 1 do begin
	if j <> num then begin
  	  writeln('Рез.строка №', j, ': ', lines[j]);
  	  writeln(AnFile, lines[j]);
    end;
  end;

  closeFile(AnFile);

end.

