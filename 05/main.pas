program main;

{$mode objfpc}{$H+}

const
  DIMENSION = 30;

var
  i: integer;
  isFitting: boolean;
  min: integer;
  position: integer;
  list: array of integer;
begin

  min := 0;

  // Определяем длину массива чисел с которым будем работать.
  SetLength(list, DIMENSION);

  // Наполняем массив случайными числами
  for i := 1 to high(list) do list[i] := random(100);

  for i := 1 to high(list) do write(list[i], ' ');

  writeln;

  position := 1;

  // Переносим подходящее число в позицию следующую после последнего найденого
  // подходящего числа (потом массив мы просто обрежем, тем самым удалив все
  // не подходящие условию числа из массива)
  for i := 1 to high(list) do begin

    // Булеан определяет подходит число по условию или нет. Проверяемое число
    // должно быть строго больше последнего найденного минимального числа,
    isFitting := min < list[i];

    write(min, ' < ', list[i]);

    if isFitting then begin

      // Число нам подходит
      write(' - keep this number');

      // Запоминаем его, чтобы в следующей итерации с ним сравнивать
      min := list[i];

      // writeln('=========== char => position: ', list[i], ' => ', position);

      // Кладем значение сразу после другого подходящего значения. Таким образом
      // все подходящие значения перекочуют в начало массива, который в самом
      // конце мы просто обрежем.
      list[position] := list[i];

      // Увеличиваем значение индекса под которым будет размещен следующий
      // подходящий элемент на единицу.
      inc(position);
    end;

    writeln;

  end;

  // Обрезаем массив.
  setlength(list, position - 1);

  writeln('===== Amount of the fittable elements is ', position);

  for i:=1 to length(list) do begin
    write(list[i], ' ');
  end;

end.
