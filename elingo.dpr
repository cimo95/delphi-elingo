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
