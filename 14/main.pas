program main;

{$mode objfpc}{$m+}

// =============================================================================

type

  ExpressionClass = class
  private
  	amount: integer;
    numbers: array[0..10] of integer;
    signs: array[0..10] of char;
   
  public
    constructor init(n: array of integer; s: array of char);
    function getAmount(): integer;
    function exec(): double;
  end;

constructor ExpressionClass.init(n: array of integer; s: array of char);
  begin
  	self.amount := length(n);
  	self.numbers := n;
  	self.signs := s;
  end;

function ExpressionClass.getAmount() : integer;
  begin
  	result := self.amount;
  end;


// Описать объект, включающий заданные поля и методы. Написать программу, которая
// создает  объект и тестирует его методы.  
// Объект - выражение, состоящее из целых чисел и знаков операций (скобок нет).
// Параметры: массив значений чисел (n<10), количество чисел и массив знаков операций.
// Методы: инициализирующая процедура и процедура, вычисляющая результат. 

function ExpressionClass.exec() : double;
  var i: integer; val: double = 0;
  begin
  	val := self.numbers[0];
  	for i:=1 to length(self.numbers) - 2 do begin
  		writeln('======> prev val: ', val, ' number: ', self.numbers[i], ' operation: ', self.signs[i-1]);
  		if self.signs[i-1] = '+' then val := val + self.numbers[i];
  		if self.signs[i-1] = '-' then val := val - self.numbers[i];
  		if self.signs[i-1] = '/' then val := val / self.numbers[i];
  		if self.signs[i-1] = '*' then val := val * self.numbers[i];
  	end;
    result := val;
  end;

// =============================================================================

var
  exp: ExpressionClass;
  nList: array[1..10] of integer = (3,2,1,1,1,4,2,1,1,1);
  sList: array[1..10] of char = ('*','+','+','+','/','-','+','+','+','+');
  res: double;
begin
  exp := ExpressionClass.init(nList, sList);
  writeln('Amount of the elements: ', exp.getAmount());
  res := exp.exec();
  writeln('Результат: ', res);
end.

