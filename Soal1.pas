program ArrayRecordDanWithDo;

uses crt;

const
  MAKS_DATA = 3;


function akhir (a,b,c : integer): integer;
begin
akhir := a * 0.3+b * 0.4+ c * 0.3;
end;

type
  Mahasiswa = record
    UTS, UAS, Tugas: Integer;
    nama: string;
  end;


var
  daftarMhs: array[1..MAKS_DATA] of Mahasiswa;
  i, jumlah: integer;




begin
  clrscr;
  
  write('Masukkan jumlah mahasiswa (maks ', MAKS_DATA, '): ');
  readln(jumlah);

  if jumlah > MAKS_DATA then 
    jumlah := MAKS_DATA;

  writeln;
  writeln('=== INPUT DATA MAHASISWA ===');
  
  for i := 1 to jumlah do
  begin

    with daftarMhs[i] do
    begin
      writeln('Data Mahasiswa ke-', i);
      write('Nama  : '); readln(nama);      
      write('UTS : '); readln(UTS);  
       write('UAS   : '); readln(UAS);
       write('Tugas   : '); readln(Tugas);  
      writeln('----------------------------');
    end;
  end;

  clrscr;
  writeln('=== HASIL DATA MAHASISWA KELAS ===');
  
  for i := 1 to jumlah do
  begin
    with daftarMhs[i] do
    begin
  
    end;
  end;

  writeln;
  writeln('Tekan Enter untuk keluar...');
  readln;
end.