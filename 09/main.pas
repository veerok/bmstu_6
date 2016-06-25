program main;

const DIMENSION = 20;

var
  i: integer;
  nums: array[1..DIMENSION] of integer = (7,3,2,7,3,1,6,6,1,2,5,7,1,3,6,12,7,9,4,2);
  res: array[integer] of integer;
  maxCount: integer = 0;
  val: integer;
begin

  write('Элементы: ');
  for i:=1 to length(nums) - 1 do write(nums[i], ' ');
  writeln;

  for i:=1 to length(nums) - 1 do res[nums[i]] := res[nums[i]] + 1;

  for i:=1 to length(nums) - 1 do begin
  	if maxCount < res[nums[i]] then begin
  		maxCount := res[nums[i]];
  		val := nums[i];
  	end;
  	// writeln(nums[i], ' === ', res[nums[i]]);
  end;

  writeln('Наиболее частый: ', val);

end.
