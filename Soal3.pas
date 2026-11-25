program Contoh5;
// KISI-KISI SOAL 1: Array, FOR, REPEAT-UNTIL, FUNCTION, CASE/IF-ELSE,
//                   rata-rata, nilai maks dan min
// Tema: suhu harian 6 hari
uses crt;

const
  HARI = 6;

type
  TSuhu = array[1..HARI] of integer;

var
  suhu  : TSuhu;
  i     : integer;
  rata  : real;
  ulang : char;

// FUNCTION: rata-rata suhu
function HitungRata(a: TSuhu): real;
var
  i, total: integer;
begin
  total := 0;
  for i := 1 to HARI do
    total := total + a[i];
  HitungRata := total / HARI;
end;

// FUNCTION: suhu tertinggi
function CariMax(a: TSuhu): integer;
var
  i, m: integer;
begin
  m := a[1];
  for i := 2 to HARI do
    if a[i] > m then
      m := a[i];
  CariMax := m;
end;

// FUNCTION: suhu terendah
function CariMin(a: TSuhu): integer;
var
  i, m: integer;
begin
  m := a[1];
  for i := 2 to HARI do
    if a[i] < m then
      m := a[i];
  CariMin := m;
end;

// FUNCTION: menghitung berapa hari suhunya di atas rata-rata
function HariDiAtasRata(a: TSuhu; r: real): integer;
var
  i, jml: integer;
begin
  jml := 0;                          // penghitung, mulai dari 0
  for i := 1 to HARI do
    if a[i] > r then
      jml := jml + 1;
  HariDiAtasRata := jml;
end;

// FUNCTION + CASE dengan RENTANG: trunc() membuang angka di belakang koma
function Cuaca(r: real): string;
begin
  case trunc(r) of
    -50..19: Cuaca := 'DINGIN';
    20..29 : Cuaca := 'SEJUK';
    30..39 : Cuaca := 'PANAS';
  else
    Cuaca := 'SANGAT PANAS';
  end;
end;

begin
  // REPEAT luar: seluruh program bisa diulang
  repeat
    clrscr;
    writeln('=== SUHU HARIAN ', HARI, ' HARI ===');

    // FOR: isi array
    for i := 1 to HARI do
    begin
      // REPEAT dalam: validasi suhu -10 sampai 50
      repeat
        write('Suhu hari ke-', i, ' (-10 s/d 50): ');
        readln(suhu[i]);
        if (suhu[i] < -10) or (suhu[i] > 50) then
          writeln('Suhu tidak masuk akal, ulangi!');
      until (suhu[i] >= -10) and (suhu[i] <= 50);
    end;

    rata := HitungRata(suhu);

    writeln;
    writeln('Rata-rata       : ', rata:0:1, ' derajat (', Cuaca(rata), ')');
    writeln('Tertinggi       : ', CariMax(suhu));
    writeln('Terendah        : ', CariMin(suhu));
    writeln('Selisih         : ', CariMax(suhu) - CariMin(suhu));
    writeln('Hari di atas rata-rata: ', HariDiAtasRata(suhu, rata));

    writeln;
    write('Ulangi program (y/t)? ');
    readln(ulang);
  until (ulang = 't') or (ulang = 'T');
end.
