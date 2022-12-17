uses crt;
procedure writemenu;
const
  menu: array[1..6] of string =
('формулировка задания',
 'ввод переменных',
 'найти приблизительное значение',
 'найти точное значение',
 'найти погрешность',
 'выход');
 begin
  clrscr;
  println('Меню работы с программой:');
  for var i:= 1 to 6 do
    begin
      println(i,'-',menu[i]);
    end;
end;
procedure S(x1, x2:real; n: integer; var S:real);
begin
  var r,h:real;
  h:=(x2-x1)/n;
  x1:=x1+h;
  for var i:=1 to n do begin
  r:=2*power(x1,3)+2*power(x1,2)+(-3)*x1+17;
  S:=S+r*h;
  x1:=x1+h;
  end;
  writeln('приблизительное вычисление = ',S:0:5);
end;
procedure F( x1, x2:real; var p:real);
begin
  var F1, F2, F: real;
  F1:=2*power(x1,3)/2+2*power(x1,2)+(-3)*x1/2+17*x1;
  F2:=2*power(x2,3)/2+2*power(x2,2)+(-3)*x2/2+17*x2;;
  F:=F2-F1;
  writeln('точное вычисление = ', F:0:5);
end;
procedure V(var a,g:real; var j:integer);
begin
 a:=readreal('Введите пределы интегрирования');
 g:=readreal;
 j:=readinteger('Введите значение n');
end;
begin 
  var p, r, x1, x2:real;
 var n:integer;
 var d: char;
 writemenu;
 while true do begin
 d:=ReadKey;
 clrscr;

 case d of 
   '1': println('вычислить площадь фигуры, ограниченной кривой: 2*x^3+(2)*x^2+(-3)*x+(17) и осью OX, с применением метода правых прямоугольников');
   '2': V(x1, x2, n);
   '3': S(x1, x2, n, r);
   '4': F(x1, x2, p);
   '5': if (p<>0) and (r<>0) then writeln('погрешность = ', p-r:0:5)
   else println('не хватает данных для вычислений');
   '6': exit;
   '0': writemenu;
 end; 
if d<>'0' then println('чтобы вернуться в меню нажмите 0');
 end; 
end.
