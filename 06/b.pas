program main;

{$mode objfpc}{$H+}

const
  DIMENSION = 8;

type
  MArray = array[0..DIMENSION, 0..DIMENSION] of integer;

function getColumnSum(matrix: MArray; column: integer): integer;
  var i: integer;
      sum: integer = 0;
  begin
    for i:=1 to length(matrix) - 1 do begin
      sum := sum + matrix[i][column];
    end;
    result := sum;
  end;

var
  i, j, sum: integer;
  matrix: MArray;
  founded: array of integer;
  processed: array of integer;
  sss: boolean;
  result: boolean = false;
begin

  // Распечатываем номера столбцов
  for i:=1 to 8 do write(i, chr(9));
  writeln; writeln;
  // Наполняем матрицу случайными числами и выводим ее на экран
  for i:=1 to length(matrix) - 1 do begin for j:=1 to length(matrix[i]) -1 do begin matrix[i][j] := random(20); write(matrix[i][j], chr(9)); end; writeln; end;

  // matrix[8][8] := 18 + 2;
  // matrix[8][6] := 35;

  matrix[8][8] := 128 + 2;
  matrix[8][2] := 352;
  matrix[8][4] := 1;

  writeln;

  // Распечатываем сумму по каждому столбцу
  for i:=1 to 8 do write(getColumnSum(matrix, i), chr(9));

  writeln; writeln;

  // Пробегаемся по столбцам (из DEMENSION кол-во)
  for i:=1 to 8 do begin

    // Записываем номер столбца в список (ведь у каждой суммы минимум 1 столбец)
    setlength(founded, 1);
    founded[0] := i;

    // Получае сумму элементов этой колонки
    sum := getColumnSum(matrix, i);

    // Еще раз пробегаемся по слобцам
    for j:=1 to 8 do begin

      // Игнорируем столбец для которого мы ищем слобцы с той же суммой
      if j <> i then

        // Нашли слобец у которого сумма элементов такая же
        if getColumnSum(matrix, j) = sum then begin
          // Увеличили мощность массива на 1 доп. элемент
          setlength(founded, length(founded)+1);
          // Добавляем элемент в массив столбцов соответствующих по сумме
          // итерируемому столбцу
          founded[length(founded)-1] := j;
        end;

    end;

    // Флаг, определяющий обработана ли была сумма или нет
    sss := true;

    for j:=0 to length(processed)-1 do if processed[j] = sum then sss := false;

    if sss then begin

      // Если найдено более 2 столбцов с такой суммой выполняем:
      if length(founded) > 1 then begin
        write('У строк: ');
        result := true;
        for j:=0 to length(founded)-1 do write(founded[j], ' ');
        write(' одинаковая сумма: ', sum);
        writeln;
      end;

      // Вносим сумму в массив обработанных
      setlength(processed, length(processed)+1);
      processed[length(processed)-1] := sum;
    end;

  end;

  if not(result) then writeln('Нет столбцов с одинаковой суммой');

end.
