object futama: Tfutama
  Left = 295
  Top = 231
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Elingo 1.0'
  ClientHeight = 284
  ClientWidth = 649
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'segoe ui'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lb4: TLabel
    Left = 328
    Top = 216
    Width = 43
    Height = 13
    Caption = 'Waktu : '
    Layout = tlCenter
  end
  object lb5: TLabel
    Left = 328
    Top = 242
    Width = 102
    Height = 13
    Caption = 'Pesan : 255 karakter'
    Layout = tlCenter
  end
  object lv0: TListView
    Left = 8
    Top = 8
    Width = 313
    Height = 253
    Cursor = crHandPoint
    Columns = <
      item
        Caption = 'Tanggal'
        Width = 100
      end
      item
        Caption = 'Waktu'
      end
      item
        Caption = 'Pesan'
        Width = 150
      end>
    GridLines = True
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = lv0DblClick
  end
  object gb0: TGroupBox
    Left = 328
    Top = 8
    Width = 313
    Height = 145
    Caption = 'Personalisasi Pengingat'
    TabOrder = 1
    object lb0: TLabel
      Left = 8
      Top = 19
      Width = 37
      Height = 13
      Caption = 'Judul : '
    end
    object lb1: TLabel
      Left = 9
      Top = 42
      Width = 30
      Height = 13
      Caption = 'Font :'
    end
    object lb2: TLabel
      Left = 9
      Top = 67
      Width = 33
      Height = 13
      Caption = 'Nada :'
    end
    object lb3: TLabel
      Left = 9
      Top = 92
      Width = 34
      Height = 13
      Caption = 'Gmbr :'
    end
    object cb0: TCheckBox
      Left = 12
      Top = 120
      Width = 157
      Height = 17
      Cursor = crHandPoint
      Caption = 'Pengingat paling depan'
      TabOrder = 0
    end
    object e0: TEdit
      Left = 48
      Top = 16
      Width = 249
      Height = 21
      MaxLength = 32
      TabOrder = 1
      Text = 'Hai !'
    end
    object e1: TEdit
      Left = 48
      Top = 40
      Width = 225
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object b0: TButton
      Left = 276
      Top = 40
      Width = 21
      Height = 21
      Cursor = crHandPoint
      Caption = '...'
      TabOrder = 3
      OnClick = b0Click
    end
    object b5: TButton
      Left = 192
      Top = 120
      Width = 50
      Height = 21
      Cursor = crHandPoint
      Caption = 'Coba'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = b5Click
    end
    object b6: TButton
      Left = 248
      Top = 120
      Width = 50
      Height = 21
      Cursor = crHandPoint
      Caption = 'Simpan'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = b6Click
    end
    object e2: TEdit
      Left = 48
      Top = 65
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 6
    end
    object b1: TButton
      Left = 252
      Top = 65
      Width = 21
      Height = 21
      Cursor = crHandPoint
      Caption = '...'
      TabOrder = 7
      OnClick = b1Click
    end
    object e3: TEdit
      Left = 48
      Top = 90
      Width = 201
      Height = 21
      ReadOnly = True
      TabOrder = 8
    end
    object b3: TButton
      Left = 252
      Top = 90
      Width = 21
      Height = 21
      Cursor = crHandPoint
      Caption = '...'
      TabOrder = 9
      OnClick = b3Click
    end
    object b2: TButton
      Left = 276
      Top = 65
      Width = 21
      Height = 21
      Cursor = crHandPoint
      Caption = '>'
      TabOrder = 10
      OnClick = b2Click
    end
    object b4: TButton
      Left = 276
      Top = 90
      Width = 21
      Height = 21
      Cursor = crHandPoint
      Caption = '>'
      TabOrder = 11
      OnClick = b4Click
    end
  end
  object dtp0: TDateTimePicker
    Left = 376
    Top = 213
    Width = 186
    Height = 21
    Cursor = crHandPoint
    Date = 43170.424882094910000000
    Format = 'dddd, ddMMMMyyyy'
    Time = 43170.424882094910000000
    DateFormat = dfLong
    TabOrder = 2
  end
  object dtp1: TDateTimePicker
    Left = 568
    Top = 213
    Width = 73
    Height = 21
    Cursor = crHandPoint
    Date = 43170.424882094910000000
    Format = 'HH : mm'
    Time = 43170.424882094910000000
    Kind = dtkTime
    TabOrder = 3
  end
  object m0: TMemo
    Left = 328
    Top = 160
    Width = 313
    Height = 49
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    MaxLength = 255
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 4
    OnChange = m0Change
    OnKeyPress = m0KeyPress
  end
  object b8: TButton
    Left = 504
    Top = 240
    Width = 65
    Height = 21
    Cursor = crHandPoint
    Caption = 'SIMPAN'
    Enabled = False
    TabOrder = 5
    OnClick = b8Click
  end
  object b9: TButton
    Left = 576
    Top = 240
    Width = 65
    Height = 21
    Cursor = crHandPoint
    Caption = 'RESET'
    Enabled = False
    TabOrder = 6
    OnClick = b9Click
  end
  object sb0: TStatusBar
    Left = 0
    Top = 265
    Width = 649
    Height = 19
    Color = clWhite
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbRaised
        Text = 'Rabu, 12 Juni 1991'
        Width = 150
      end
      item
        Alignment = taCenter
        Bevel = pbRaised
        Text = '10:00:00'
        Width = 60
      end
      item
        Width = 50
      end>
  end
  object mm0: TMediaPlayer
    Left = -253
    Top = -24
    Width = 253
    Height = 30
    Visible = False
    TabOrder = 8
  end
  object b7: TButton
    Left = 472
    Top = 240
    Width = 25
    Height = 21
    Cursor = crHandPoint
    Caption = '?'
    TabOrder = 9
    OnClick = b7Click
  end
  object al: TActionList
    Left = 584
    Top = 168
    object ala0: TAction
      Caption = 'del'
      ShortCut = 46
      OnExecute = ala0Execute
    end
  end
  object t0: TTimer
    OnTimer = t0Timer
    Left = 440
    Top = 240
  end
end
