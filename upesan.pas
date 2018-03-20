unit upesan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shellapi, filectrl, xpman, jpeg, ExtCtrls, StdCtrls, upnf, ComCtrls,
  StrUtils, mmsystem;

type
  Tfpesan = class(TForm)
    b0: TButton;
    b1: TButton;
    gb0: TGroupBox;
    gb1: TGroupBox;
    i0: TImage;
    l0: TLabel;
    l1: TLabel;
    l2: TLabel;
    l3: TLabel;
    l4: TLabel;
    l5: TLabel;
    l6: TLabel;
    p0: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure b0Click(Sender: TObject);
    procedure i0MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Deklarasi hanya untuk penggunaan dalam unit ini saja }
  public
    { Deklarasi untuk penggunaan ke semua unit yang terintegerasi }
  end;

var
  fpesan: Tfpesan;

implementation

uses
  uutama;

{$R *.dfm} //template tweaked by : Araachmadi Putra Pambudi

procedure Tfpesan.FormCreate(Sender: TObject);
var
  tli: TListItem;
begin
  if futama.ub0 then
  begin
    l1.Font := futama.e1.Font;
    l0.Font := l1.Font;
    if FileExists(futama.e3.Text) then
      i0.Picture.LoadFromFile(futama.e3.Text);
    futama.b2.Click;
    if futama.cb0.Checked then
      FormStyle := fsStayOnTop
    else
      FormStyle := fsNormal;
    tli := futama.lv0.Items.Item[strtoint(ParamStr(1))];
    l0.Caption := futama.e0.Text;
    l1.Caption := tli.SubItems.Strings[1];
    l2.Caption := 'Jam : ' + tli.SubItems.Strings[0];
    l4.Caption := 'Hari / Tanggal : ' + FormatDateTime('dddd, dd MMMM yyyy', StrToDate(tli.Caption));
    l3.Caption := l2.Caption;
    l5.Caption := l4.Caption;
    gantifu(fpesan);
    futama.Hide;
    b0.Hide;
  end;
end;

procedure Tfpesan.b1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure Tfpesan.b0Click(Sender: TObject);
begin
  futama.Show;
  gantifu(futama);
  try
    futama.mm0.Stop;
    futama.mm0.Close;
  except
  end;
  hide;
end;

procedure Tfpesan.i0MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  perform(WM_SYSCOMMAND, $F012, 0);
end;

end.

