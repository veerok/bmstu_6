program main;

{$mode objfpc}{$H+}

const
  LETTER = 'a';

type
  TStringArray = array of string;

var
  i: integer;
  text: string = 'abcde fghij qwert ddsaf abcdk wabcu dfdef opit.';
  symbol: char;
  sWord: string = '';
begin

  writeln('До:    ', text);

  for i := 1 to length(text) do begin

    symbol := text[i];

    // Если символ НЕ попал в диапазон алфавита - значит "слово" закончилось и
    // мы можем проверить наличие подстроки `LETTER`.
    if (symbol > #122) or (symbol < #65) then begin

    	// Если слово начинается с букв А,В,С, то третью букву слова заменить на Y
    	if (sWord[1] = 'a') and (sWord[2] = 'b') and (sWord[3] = 'c') then
    		text[ i - length(sWord) + 2 ] := 'y';

    	// Если слова оканчивается на D,E,F, то предпоследнюю букву заменить на О
    	if (sWord[3] = 'd') and (sWord[4] = 'e') and (sWord[5] = 'f') then
    		text[ i - (length(sWord) - 3) ] := 'o';

    	sWord := '';
    end else begin
		sWord := concat(sWord, symbol);
    end;

  end;

  writeln('После: ', text);

end.
