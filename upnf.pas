unit upnf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  comctrls, IniFiles, Dialogs, stdctrls, Registry, ExtCtrls;

type
  TLabel = class(StdCtrls.TLabel)
  private
    fFontChanged: boolean;
  public
    procedure Paint; override;
  end;

procedure StringToFont(sFont: string; Font: TFont);

function FontToString(Font: TFont): string;

procedure bacaCfg;

procedure simpanCfg;

function FolderTemp: string;

procedure gantiFU(ff: TForm);

procedure wriTemp(fs0, fs1: string);

var
  fFon: TFont;
  iLastCnt: integer;

implementation

uses
  uutama, upesan;

var
  th: thandle;

const
  csfsBold = '|Bold';
  csfsItalic = '|Italic';
  csfsUnderline = '|Underline';
  csfsStrikeout = '|Strikeout';

{**
 * Fungsi dan/atau prosedur berikut menggunakan fungsi yang dibuat oleh pihak ketiga :
 * AntiAliasing oleh mghie dari Stack Overflow (https://stackoverflow.com/questions/921249/font-smoothing-in-delphi)
 * MyMessageDlg oleh Alex Egorov, Mohammad dari Stack Overflow (https://stackoverflow.com/questions/5417843/generic-dialog-with-custom-captions-for-buttons)
 **}

//prosedur untuk membuat font mengaktifkan AntiAliasing
procedure TLabel.Paint;
var
  LF: TLogFont;
begin
  if not fFontChanged then
  begin
    Win32Check(GetObject(Font.Handle, SizeOf(TLogFont), @LF) <> 0);
    LF.lfQuality := ANTIALIASED_QUALITY;
    Font.Handle := CreateFontIndirect(LF);
    fFontChanged := TRUE;
  end;
  inherited;
end;

//fungsi untuk mengambil jalur folder temporer windows
function FolderTemp: string;
var
  s: string;
  i: Integer;
begin
  SetLength(s, 255);
  i := GetTempPath(255, PChar(s));
  SetLength(s, i);
  Result := s;
end;

//fungsi untuk mengubah kembali data String ke font agar dapat digunakan
procedure StringToFont(sFont: string; Font: TFont);
var
  p: integer;
  s: string;
begin
  try
    with Font do
    begin
      p := Pos(',', sFont);
      Name := Copy(sFont, 2, p - 3);
      Delete(sFont, 1, p);
      p := Pos(',', sFont);
      Size := StrToInt(Copy(sFont, 2, p - 2));
      Delete(sFont, 1, p);
      p := Pos(',', sFont);
      s := '|' + Copy(sFont, 3, p - 4);
      Delete(sFont, 1, p);
      Color := StringToColor(Copy(sFont, 3, Length(sFont) - 3));
      Style := [];

      if (Pos(csfsBold, s) > 0) then
        Style := Style + [fsBold];

      if (Pos(csfsItalic, s) > 0) then
        Style := Style + [fsItalic];

      if (Pos(csfsUnderline, s) > 0) then
        Style := Style + [fsUnderline];

      if (Pos(csfsStrikeout, s) > 0) then
        Style := Style + [fsStrikeout];
    end;
  except
  end;
end;

//fungsi untuk mengubah data TFont menjadi informasi string agar dapat disimpan sebagai teks
function FontToString(Font: TFont): string;
var
  s: string;
begin
  with Font do
  begin
    s := '';
    if (fsBold in Style) then
      s := s + csfsBold;
    if (fsItalic in Style) then
      s := s + csfsItalic;
    if (fsUnderline in Style) then
      s := s + csfsUnderline;
    if (fsStrikeout in Style) then
      s := s + csfsStrikeout;
    if ((Length(s) > 0) and ('|' = s[1])) then
    begin
      s := Copy(s, 2, Length(s) - 1);
    end;
    Result := Format('"%s", %d, [%s], [%s]', [Name, Size, s, ColorToString(Color)]);
  end;
end;

//prosedur untuk menyimpan semua perubahan yang sudah dibuat termasuk data pengingatnya
procedure simpanCfg;
var
  tif: tinifile;
  i: Integer;
begin
  with futama do
  begin
    tif := tinifile.Create(extractfilepath(application.exename) + 'atur.ini');
    tif.WriteString('atur', 'judul', e0.Text);
    tif.WriteString('atur', 'font', FontToString(futama.e1.font));
    tif.WriteString('atur', 'nada', e2.text);
    tif.WriteString('atur', 'gambar', e3.text);
    tif.WriteInteger('atur', 'jumlah', lv0.Items.Count);
    tif.WriteBool('atur', 'diatas', cb0.Checked);
    for i := 0 to iLastCnt - 1 do
      tif.EraseSection('jadwal-' + inttostr(i));
    iLastCnt := lv0.Items.Count;
    for i := 0 to lv0.Items.Count - 1 do
    begin
      tif.WriteString('jadwal-' + IntToStr(i), 'tgl', lv0.Items.Item[i].Caption);
      tif.WriteString('jadwal-' + IntToStr(i), 'wkt', lv0.Items.Item[i].SubItems.Strings[0]);
      tif.WriteString('jadwal-' + IntToStr(i), 'psn', lv0.Items.Item[i].SubItems.Strings[1]);
    end;
    tif.Free;
  end;
end;

//prosedur untuk memuat semua perubahan yang sudah tersimpan termasuk data pengingatnya
procedure bacaCfg;
var
  tif: TIniFile;
  i: integer;
  tli: TListItem;
begin
  try
    with futama do
    begin
      tif := tinifile.Create(extractfilepath(application.exename) + 'atur.ini');
      e0.Text := tif.ReadString('atur', 'judul', 'Hai !');
      StringtoFont(tif.readString('atur', 'font', '"Tahoma", 10, [], [clWindowText]'), futama.e1.font);
      futama.e1.Text := tif.readString('atur', 'font', '"Tahoma", 10, [], [clWindowText]');
      e2.Text := tif.ReadString('atur', 'nada', '');
      e3.Text := tif.ReadString('atur', 'gambar', '');
      iLastCnt := tif.ReadInteger('atur', 'jumlah', 0);
      cb0.Checked := tif.ReadBool('atur', 'diatas', false);
      for i := 0 to iLastCnt - 1 do
      begin
        tli := lv0.Items.Add;
        tli.Caption := tif.ReadString('jadwal-' + IntToStr(i), 'tgl', '12/06/1991');
        tli.SubItems.Add(tif.ReadString('jadwal-' + IntToStr(i), 'wkt', '10:00'));
        tli.SubItems.Add(tif.ReadString('jadwal-' + IntToStr(i), 'psn', '-'));
      end;
      if not FileExists(futama.e2.Text) then
        futama.e2.Text := 'default.wav';
      if not FileExists(futama.e3.Text) then
        futama.e3.Text := 'default.jpg';
      tif.Free;
    end;
  except
    on e: exception do
      ShowMessage(e.message);

  end;
end;

//prosedur untuk mengubah form non-MainForm menjadi MainForm
procedure gantiFU(ff: TForm);
var
  P: Pointer;
begin
  P := @Application.Mainform;
  Pointer(P^) := ff;
end;

//prosedur untuk menulis jika ada error agar lebih mudah dianalisa kembali
//sebenarnya ini lebih "modern" ada juga versi awalnya yang bisa jadi lebih cepat karena saya lupa, maka saya gunakan ini saja
procedure wriTemp(fs0, fs1: string);
var
  tsl: TStringList;
begin
  tsl := TStringList.Create;
  tsl.Text := fs1;
  tsl.SaveToFile(fs0);
  tsl.Free;
end;

//untuk menghindari kres, aplikasi hanya boleh 1 instance saja selain itu langsung tutup
//anda juga bisa menambahkan blok begin end jika ingin menambahkan pesan untuk mengingatkan pengguna
{initialization
  th := CreateMutex(nil, True, pchar(ExtractFileName(application.ExeName)));
  if GetLastError = ERROR_ALREADY_EXISTS then
    ShowMessage('HANDLING ERROR !');

finalization
  if th <> 0 then
    CloseHandle(th);   }

end.

