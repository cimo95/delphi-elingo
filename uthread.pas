unit uthread;

interface

uses
  Classes, IniFiles, SysUtils, Forms, Windows, ShellAPI;

type
  ElingoSvc = class(TThread)
  private
    ui0, ui1: integer;
    function fReadDT(fi: integer): integer;
  protected
    procedure Execute; override;
  end;

implementation

uses
  uutama, upnf;

function ElingoSvc.fReadDT(fi: integer): integer;
var
  tif: TIniFile;
  i: integer;
  s0, s1: string;
begin
  try
    tif := TIniFile.Create(ExtractFilePath(application.exename) + 'atur.ini');
    ui0 := tif.ReadInteger('atur', 'jumlah', 1);
    result := -1;
    s0 := FormatDateTime('dd/MM/yyyy', Now);
    s1 := FormatDateTime('hh:mm', Now);
    if tif.ReadString('jadwal-' + inttostr(fi), 'tgl', '12/06/1991') = s0 then
      if tif.ReadString('jadwal-' + inttostr(fi), 'wkt', '10:00') = s1 then
        result := fi;
  except
    on e: Exception do
    begin
      writemp(ExtractFilePath(application.ExeName) + 'error.log', 'fReadDT : ' + e.Message);
    end;
  end;
end;

procedure ElingoSvc.Execute;
begin
  wriTemp(ChangeFileExt(application.ExeName, '.log'), 'SVCX BEGIN : ' + DateTimeToStr(now));
  while not terminated do
  begin
    try
      if fReadDT(ui1) <> -1 then
      begin
        if fileexists(foldertemp + 'atur.ini') then
          DeleteFile(PChar(foldertemp + 'atur.ini'));
        if fileexists(foldertemp + 'elingo-msg.exe') then
          DeleteFile(PChar(foldertemp + 'elingo-msg.exe'));
        CopyFile(PChar(ExtractFilePath(application.ExeName) + 'atur.ini'), pchar(foldertemp + 'atur.ini'), false);
        CopyFile(PChar(ExtractFilePath(application.ExeName) + 'elingo.exe'), pchar(foldertemp + 'elingo-msg.exe'), false);
        Application.MainForm.WindowState := wsMinimized;
        Application.MainForm.Show;
        ShellExecute(0, 'open', PChar(foldertemp + 'elingo-msg.exe'), PChar(IntToStr(fReadDT(ui1))), nil, sw_show);
        Application.MainForm.Hide;
        Application.MainForm.WindowState := wsNormal;
        Sleep(59000);
      end;
      if ui1 = (ui0 - 1) then
        ui1 := 0
      else
        Inc(ui1);
      Sleep(1000);
    except
      on e: Exception do
      begin
        writemp(ExtractFilePath(application.ExeName) + 'error.log', 'uthread : ' + e.Message);
      end;
    end;
  end;
end;

end.

