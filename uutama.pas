unit uutama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, shellapi, filectrl, xpman, StdCtrls, ComCtrls, ExtDlgs, jpeg,
  inifiles, ActnList, ExtCtrls, MPlayer;

type
  Tfutama = class(TForm)
    al: TActionList;
    ala0: TAction;
    b0: TButton;
    b1: TButton;
    b2: TButton;
    b3: TButton;
    b4: TButton;
    b5: TButton;
    b6: TButton;
    b7: TButton;
    b8: TButton;
    b9: TButton;
    cb0: TCheckBox;
    dtp0: TDateTimePicker;
    dtp1: TDateTimePicker;
    e0: TEdit;
    e1: TEdit;
    e2: TEdit;
    e3: TEdit;
    gb0: TGroupBox;
    lb0: TLabel;
    lb1: TLabel;
    lb2: TLabel;
    lb3: TLabel;
    lb4: TLabel;
    lb5: TLabel;
    lv0: TListView;
    m0: TMemo;
    mm0: TMediaPlayer;
    sb0: TStatusBar;
    t0: TTimer;
    procedure ala0Execute(Sender: TObject);
    procedure b0Click(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure b7Click(Sender: TObject);
    procedure b8Click(Sender: TObject);
    procedure b9Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure lv0DblClick(Sender: TObject);
    procedure m0Change(Sender: TObject);
    procedure m0KeyPress(Sender: TObject; var Key: Char);
    procedure t0Timer(Sender: TObject);
  private
    { Deklarasi hanya untuk penggunaan dalam unit ini saja }
    procedure WMHotKey(var Msg: TWMHotKey); message WM_HOTKEY;
  public
    { Deklarasi untuk penggunaan ke semua unit yang terintegerasi }
    ui0, ui1: integer;
    ub0, ub1: Boolean;
  end;

var
  futama: Tfutama;

implementation

uses
  upnf, upesan, uthread;

{$R *.dfm} //template tweaked by : Araachmadi Putra Pambudi

procedure Tfutama.WMHotKey(var Msg: TWMHotKey);
begin
  if Msg.HotKey = ui1 then
    application.MainForm.Show;
end;

procedure Tfutama.b0Click(Sender: TObject);
var
  tfd: TFontDialog;
begin
  tfd := TFontDialog.Create(nil);
  tfd.Font := e1.Font;
  tfd.Options := [fdLimitSize, fdEffects];
  tfd.MaxFontSize := 20;
  if tfd.Execute then
  begin
    e1.Text := FontToString(tfd.Font);
    e1.Font := tfd.Font;
    simpancfg;
  end;
  tfd.Free;
end;

procedure Tfutama.FormCreate(Sender: TObject);
var
  es: ElingoSvc;
begin
  ui1 := GlobalAddAtom('ui1');
  RegisterHotKey(handle, ui1, MOD_CONTROL + MOD_SHIFT, VK_TAB);
  if ExtractFileName(application.ExeName) = 'elingo-msg.exe' then
  begin
    bacacfg;
    if StrToInt(ParamStr(1)) > upnf.ui0 then
      Application.Terminate;
    ub0 := True;
  end
  else
  begin
    es := ElingoSvc.Create(true);
    ub0 := false;
    bacacfg;
    dtp0.Date := Now;
    dtp1.Time := Now;
    es.FreeOnTerminate := True;
    es.Resume;
  end;
end;

procedure Tfutama.b2Click(Sender: TObject);
begin
  if mm0.Mode = mpPlaying then
  begin
    mm0.Stop;
    mm0.Close;
    mm0.Notify := True;
  end
  else
  begin
    if FileExists(e2.Text) then
    begin
      mm0.FileName := e2.Text;
      mm0.Open;
      mm0.Position := 0;
      mm0.Play;
      mm0.Notify := True;
    end;
  end;
end;

procedure Tfutama.b8Click(Sender: TObject);
var
  tli: TListItem;
begin
  if not ub1 then
  begin
    tli := lv0.Items.Add;
    tli.Caption := FormatDateTime('dd/mm/yyyy', dtp0.Date);
    tli.SubItems.Add(FormatDateTime('hh:mm', dtp1.Time));
    tli.Subitems.Add(m0.Text);
  end
  else
  begin
    lv0.Enabled := true;
    lv0.Items.BeginUpdate;
    tli := lv0.Items.Item[lv0.itemindex];
    tli.Caption := FormatDateTime('dd/mm/yyyy', dtp0.Date);
    tli.SubItems.Strings[0] := FormatDateTime('hh:mm', dtp1.Time);
    tli.SubItems.Strings[1] := m0.Text;
    lv0.Items.EndUpdate;
  end;
  simpancfg;
  b9.Click;
end;

procedure Tfutama.m0Change(Sender: TObject);
begin
  b8.Enabled := Length(m0.Text) >= 5;
  b9.Enabled := b8.Enabled;
  lb5.Caption := 'Pesan : ' + inttostr(255 - Length(m0.Text)) + ' karakter';
  m0.Text := StringReplace(m0.Text, #13, '', [rfReplaceAll]);
end;

procedure Tfutama.ala0Execute(Sender: TObject);
begin
  if lv0.Focused then
    if (lv0.SelCount <> 0) and (lv0.ItemIndex >= 0) then
    begin
      lv0.DeleteSelected;
      simpancfg;
    end;
  if m0.Focused then
    m0.SelText := '';
end;

procedure Tfutama.b9Click(Sender: TObject);
begin
  m0.Clear;
  b9.Enabled := False;
  b8.Enabled := False;
end;

procedure Tfutama.b5Click(Sender: TObject);
var
  s: string;
begin
  gantifu(fpesan);
  hide;
  if m0.Text = '' then
    s := 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam in dignissim nibh, ut iaculis massa. Vestibulum tincidunt interdum nisl sed blandit. Fusce in erat accumsan, ornare lorem non, tempor leo.'
  else
    s := m0.Text;
  with fpesan do
  begin
    l1.Font := futama.e1.Font;
    l0.Font := l1.Font;
    if FileExists(futama.e3.Text) then
      i0.Picture.LoadFromFile(futama.e3.Text);
    b2.Click;
    if futama.cb0.Checked then
      FormStyle := fsStayOnTop
    else
      FormStyle := fsNormal;
    l1.Caption := s;
    l0.Caption := e0.Text;
    Show;
  end;
end;

procedure Tfutama.t0Timer(Sender: TObject);
begin
  sb0.Panels.Items[0].Text := FormatDateTime('dddd, dd MMMM yyyy', now);
  sb0.Panels.Items[1].Text := FormatDateTime('HH:mm:ss', now);
end;

procedure Tfutama.m0KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure Tfutama.b6Click(Sender: TObject);
begin
  simpancfg;
end;

procedure Tfutama.b1Click(Sender: TObject);
var
  tod: topendialog;
begin
  tod := topendialog.Create(nil);
  tod.InitialDir := ExtractFilePath(e2.Text);
  tod.Filter := 'Format Standar Audio (*.wav;*.mp3)|*.wav;*.mp3';
  tod.Title := 'Telusuri File Nada';
  if tod.Execute then
    e2.Text := tod.FileName;
  tod.Free;
end;

procedure Tfutama.b3Click(Sender: TObject);
var
  topd: topenpicturedialog;
begin
  topd := topenpicturedialog.Create(nil);
  topd.InitialDir := ExtractFilePath(e3.Text);
  topd.Filter := 'Format Standar Gambar (*.jpg;*.jpeg;*.bmp;*.emf;*.wmf)|*.jpg;*.jpeg;*.bmp;*.emf;*.wmf';
  topd.Title := 'Telusuri File Gambar Latar';
  if topd.Execute then
    e3.Text := topd.FileName;
  topd.Free;
end;

procedure Tfutama.b4Click(Sender: TObject);
begin
  if FileExists(e3.text) then
    ShellExecute(handle, 'open', pchar(e3.Text), nil, nil, sw_show);
end;

procedure Tfutama.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  b: boolean;
begin
  b := MessageBox(Handle, 'Tetap biarkan aplikasi bekerja di latar?'#13'Jika Ya, maka aplikasi akan kembali bekerja untuk memonitor jadwal selanjutnya.'#13 + 'Gunakan CTRL+SHIFT+TAB untuk memunculkan jendela ini kembali.'#13#13'Jika Tidak, maka aplikasi akan dihentikan sepenuhnya', 'Menutup Aplikasi', 32 + 4) = mrYes;
  CanClose := not b;
  Application.MainForm.Hide;
end;

procedure Tfutama.b7Click(Sender: TObject);
begin
  showmessage('Diprogram oleh : Arachmadi Putra Pambudi');
end;

procedure Tfutama.lv0DblClick(Sender: TObject);
var
  tli: tlistitem;
begin
  try
    lv0.Enabled := False;
    tli := lv0.Items.Item[lv0.itemindex];
    m0.Text := tli.SubItems.Strings[1];
    dtp0.Date := StrToDate(tli.Caption);
    dtp1.Time := StrToTime(tli.SubItems.Strings[0]);
    ub1 := true;
  except
    lv0.Enabled := true;
  end;
end;

end.

