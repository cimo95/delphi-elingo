{!           
 ! -- Cimosoft Deident Script Command for Pascal : Delphi
 ! -- Generated 19:00:15 19-03-2018
 !                     
 ! define mode pascal.delphi
 ! define host "D:\programfilesku\delpitu\bin\delphi32Bindo.exe"
 ! define format $fmt
 ! set $a "readInitial Type"
 ! set $b "calculate Type"
 ! set $fmt $a+$b
 ! render "D:\Proyek\Desktop\Elingo\Win\Delphi\Elingo.dpr"
 !}
program elingo;

uses
  Forms,
  uutama in 'uutama.pas' {futama},
  upnf in 'upnf.pas',
  upesan in 'upesan.pas' {fpesan},
  uthread in 'uthread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Elingo 1.0';
  Application.CreateForm(Tfutama, futama);
  Application.CreateForm(Tfpesan, fpesan);
  Application.Run;
end.
