program Contoh12;
// KISI-KISI SOAL 4: ARRAY 2 DIMENSI, FOR bersarang,
//                   PROCEDURE (parameter VAR), FUNCTION
// Tema: penjumlahan dua matriks 2x3 (matriks TIDAK persegi)
uses crt;

const
  BARIS = 2;
  KOLOM = 3;

type
  TMat = array[1..BARIS, 1..KOLOM] of integer;

var
  matA, matB, matC : TMat;
  br, kl           : integer;
  i                : integer;

// PROCEDURE var: mengisi matriks; 'judul' hanya untuk label tampilan
// (catatan: 'label' tidak boleh jadi nama variabel karena kata cadangan Pascal)
procedure IsiMatriks(var mat: TMat; judul: string);
var
  b, k: integer;
begin
  writeln('Isi matriks ', judul);
  for b := 1 to BARIS do
    for k := 1 to KOLOM do
    begin
      write(judul, '[', b, ',', k, '] : ');
      readln(mat[b, k]);
    end;
end;

// PROCEDURE: tampilkan matriks dengan judul
procedure TampilMatriks(mat: TMat; judul: string);
var
  b, k: integer;
begin
  writeln('Matriks ', judul, ':');
  for b := 1 to BARIS do
  begin
    for k := 1 to KOLOM do
      write(mat[b, k]:6);
    writeln;
  end;
end;

// PROCEDURE dengan var pada HASIL (c): c diisi di dalam procedure
// x dan y hanya dibaca, jadi tanpa var
procedure TambahMatriks(x, y: TMat; var c: TMat);
var
  b, k: integer;
begin
  for b := 1 to BARIS do
    for k := 1 to KOLOM do
      c[b, k] := x[b, k] + y[b, k];  // elemen pada posisi sama dijumlahkan
end;

// PROCEDURE dengan DUA var: mengembalikan posisi (baris, kolom) nilai terbesar
// Procedure dipakai (bukan function) karena yang dikembalikan ada DUA nilai
procedure CariMaks(mat: TMat; var pb, pk: integer);
var
  b, k: integer;
begin
  pb := 1;
  pk := 1;
  for b := 1 to BARIS do
    for k := 1 to KOLOM do
      if mat[b, k] > mat[pb, pk] then
      begin
        pb := b;
        pk := k;
      end;
end;

// FUNCTION: total satu kolom (baris berubah, kolom tetap)
function TotalKolom(mat: TMat; k: integer): integer;
var
  b, total: integer;
begin
  total := 0;
  for b := 1 to BARIS do
    total := total + mat[b, k];
  TotalKolom := total;
end;

begin
  clrscr;
  writeln('=== PENJUMLAHAN MATRIKS ', BARIS, 'x', KOLOM, ' ===');
  IsiMatriks(matA, 'A');
  writeln;
  IsiMatriks(matB, 'B');

  TambahMatriks(matA, matB, matC);   // matC terisi hasil A + B

  writeln;
  TampilMatriks(matA, 'A');
  writeln;
  TampilMatriks(matB, 'B');
  writeln;
  TampilMatriks(matC, 'A + B');

  writeln;
  CariMaks(matC, br, kl);            // br dan kl terisi dari dalam procedure
  writeln('Nilai terbesar pada hasil: ', matC[br, kl],
          ' (baris ', br, ', kolom ', kl, ')');

  for i := 1 to KOLOM do
    writeln('Total kolom ', i, ' : ', TotalKolom(matC, i));

  readln;
end.
