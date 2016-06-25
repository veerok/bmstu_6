program main;

{$mode objfpc}{$m+}

uses crt;

// =============================================================================

type

  ProductClass = class

  private
    name: string;
    amount: integer;
    cost: double;
   
  public
    constructor create(n: string; a: integer; c: double);
    function getAmount(): integer;
    function getCost(): double;
    function getPrice(): double;
    procedure info();
  end;

constructor ProductClass.create(n: string; a: integer; c: double);
  begin
    self.name:=n;
    self.amount:=a;
    self.cost:=c;
  end;

function ProductClass.getAmount() : integer;
  begin
    result := self.amount;
  end;

function ProductClass.getCost() : double;
  begin
    result := self.cost;
  end;

function ProductClass.getPrice() : double;
  begin
    result := self.cost * self.amount;
  end;

procedure ProductClass.info();
  begin
    writeln('Товар "', self.name, '" в количестве ', self.amount, 'шт. по цене ', self.cost);
  end;




type
  TProductArray = array of ProductClass;





type

  StoreClass = class

  private
    products: TProductArray;
   
  public
    constructor create(const productList: TProductArray);
    function count(): integer;
    function getPrice(): double;
    procedure info();
  end;

constructor StoreClass.create(const productList: TProductArray);
  begin
    self.products:=productList;
  end;

function StoreClass.count(): integer;
  begin
    result := length(self.products);
  end;

function StoreClass.getPrice() : double;
  var i: integer; sum: double = 0;
  begin
    for i:=0 to self.count-1 do sum := sum + self.products[i].getPrice();
  end;

procedure StoreClass.info();
  var i: integer;
  begin
    for i:=0 to self.count-1 do self.products[i].info();
  end;

// =============================================================================

var
  product: ProductClass;
  products: TProductArray;
  store: StoreClass;
begin
  product := ProductClass.create('Ручка', 500, 23.64);
  product.info();

  setlength(products, 3);
  products[0] := product;
  products[1] := ProductClass.create('Плюшевый мишка', 150, 5312.96);
  products[2] := ProductClass.create('iPhone', 56, 60000.32);
  store := StoreClass.create(products);
  writeln('Количество товарных позиций  ', store.count());
  store.info();
  writeln('Суммарная стоимость  ', store.getPrice());
  // writeln('Product price: ', product.getPrice(1));
end.

