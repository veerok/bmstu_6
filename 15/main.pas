program main;

{$mode objfpc}{$m+}

// =============================================================================

type

  // Тип "точка на плоскости"
  point = record x, y:real; end;

  TriangleClass = class

    private
      a: point;
      b: point;
      c: point;
     
    public
      constructor init(ap:point; bp:point; cp:point);
      procedure info(); virtual;
      function square(): double; virtual;
      function get(dimension: string): point;
      function getALength(): double;
      function getBLength(): double;
      function getCLength(): double;
    end;
  
    constructor TriangleClass.init(ap:point; bp:point; cp:point);
      begin
        self.a := ap;
        self.b := bp;
        self.c := cp;
      end;
    
    procedure TriangleClass.info();
      begin
      	writeln('Первая точка: x = ', self.a.x, ', y = ', self.a.y);
      	writeln('Первая точка: x = ', self.b.x, ', y = ', self.b.y);
      	writeln('Первая точка: x = ', self.c.x, ', y = ', self.c.y);
      	writeln('Длина стороны A: ', self.getALength());
      	writeln('Длина стороны B: ', self.getBLength());
      	writeln('Длина стороны C: ', self.getCLength());
      end;

    function TriangleClass.getALength() : double; begin result := sqrt(sqr(self.a.x-self.b.x)+sqr(self.a.y-self.b.y)); end;
    function TriangleClass.getBLength() : double; begin result := sqrt(sqr(self.a.x-self.c.x)+sqr(self.a.y-self.c.y)); end;
    function TriangleClass.getCLength() : double; begin result := sqrt(sqr(self.b.x-self.c.x)+sqr(self.b.y-self.c.y)); end;

    function TriangleClass.square() : double;
      var
        aLength: double;
		bLength: double;
		cLength: double;
		p: double;
      begin
		p := self.getALength() + self.getBLength() + self.getCLength(); 
        result := sqrt(p*(p-aLength)*(p-bLength)*(p-cLength));
      end;

    function TriangleClass.get(dimension: string): point;
      begin
      	if dimension = 'a' then result := self.a;
      	if dimension = 'b' then result := self.b;
      	if dimension = 'c' then result := self.c;
      end;


type

  TriangularPrismClass = class(TriangleClass)

    private
      depth: integer;
     
    public
      constructor init(ap:point; bp:point; cp:point; d: integer);
      procedure info(); override;
      function square(): double; override;
    end;
  
    constructor TriangularPrismClass.init(ap:point; bp:point; cp:point; d: integer);
      begin
        inherited init(ap, bp, cp);
        self.depth := d;
      end;

    procedure TriangularPrismClass.info();
      begin
        inherited info();
      	writeln('Глубина: ', self.depth);
      end;

    function TriangularPrismClass.square() : double;
      var
        squareVal: double;
        psum, s2, s3: double;
      begin
      	squareVal := inherited square();
      	psum := (self.getALength() + self.getBLength() + self.getCLength()) * self.depth;
        result := squareVal * 2 + psum;
      end;


var
  a,b,c:point;
  p:point;
  t:TriangleClass;
  tp:TriangleClass;
begin
  // writeln('Введите первую точку'); read(a.x,a.y);     
  // writeln('Введите вторую точку'); read(b.x,b.y); 
  // writeln('Введите третью точку'); read(c.x,c.y); 

  a.x := 0; a.y := 2;
  b.x := 1; b.y := 7;
  c.x := 3; c.y := 0;

  t := TriangleClass.init(a, b, c);
  t.info();
  writeln('Площадь ', t.square());
  p := t.get('c');
  writeln('Координаты запрошенной точки: ', p.x, p.y);


  writeln;
  writeln;


  tp := TriangularPrismClass.init(a, b, c, 5);
  tp.info();
  writeln('Площадь ', tp.square());
end.
