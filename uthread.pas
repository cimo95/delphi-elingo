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
    ui0 := tif.ReadInteger('atur', 'jumlah', 0);
    result := -1;
    s0 := FormatDateTime('dd/MM/yyyy', Now);
    s1 := FormatDateTime('hh:mm', Now);
    if tif.ReadString('jadwal-' + inttostr(fi), 'tgl', '10/06/1995') = s0 then
      if tif.ReadString('jadwal-' + inttostr(fi), 'wkt', '10:00') = s1 then
        result := fi;
  except
    on e: Exception do
    begin
      writemp('fReadDT : ' + e.Message, ExtractFilePath(application.ExeName) + 'error.log');
    end;
  end;
end;

procedure ElingoSvc.Execute;
begin
  while not terminated do
  begin
    try
      if fReadDT(ui1) <> -1 then
      begin
        DeleteFile(PChar(foldertemp + 'atur.ini'));
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
        writemp('uthread : ' + e.Message, ExtractFilePath(application.ExeName) + 'error.log');
      end;
    end;
  end;
end;

end.

