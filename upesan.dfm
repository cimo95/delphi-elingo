object fpesan: Tfpesan
  Left = 405
  Top = 149
  BorderStyle = bsNone
  Caption = 'Hai !'
  ClientHeight = 440
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'segoe ui'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object i0: TImage
    Left = 0
    Top = 0
    Width = 624
    Height = 440
    Align = alClient
    AutoSize = True
    Center = True
    Stretch = True
    OnMouseDown = i0MouseDown
  end
  object l0: TLabel
    Left = 16
    Top = 8
    Width = 86
    Height = 37
    Caption = 'JUDUL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'segoe ui'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gb0: TGroupBox
    Left = 16
    Top = 48
    Width = 441
    Height = 225
    Caption = 'Mengingatkan :'
    TabOrder = 0
    object l1: TLabel
      Left = 2
      Top = 15
      Width = 437
      Height = 208
      Align = alClient
      Caption = 'Tidak ada pesan :3'
      WordWrap = True
      OnMouseDown = i0MouseDown
    end
  end
  object gb1: TGroupBox
    Left = 16
    Top = 288
    Width = 441
    Height = 73
    Caption = 'Hari Ini :'
    Color = clBtnFace
    Ctl3D = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 1
    object l5: TLabel
      Left = 17
      Top = 41
      Width = 293
      Height = 25
      Caption = 'Hari / Tanggal : Sabtu, 10 Juni 1995'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'segoe ui'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object l3: TLabel
      Left = 17
      Top = 17
      Width = 91
      Height = 25
      Caption = 'Jam : 10.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'segoe ui'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object l2: TLabel
      Left = 16
      Top = 16
      Width = 91
      Height = 25
      Caption = 'Jam : 10.00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'segoe ui'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object l4: TLabel
      Left = 16
      Top = 40
      Width = 293
      Height = 25
      Caption = 'Hari / Tanggal : Sabtu, 10 Juni 1995'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'segoe ui'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
  end
  object p0: TPanel
    Left = 0
    Top = 399
    Width = 624
    Height = 41
    Align = alCustom
    TabOrder = 2
    object l6: TLabel
      Left = 12
      Top = 13
      Width = 228
      Height = 13
      Caption = 'Hak Cipta '#169' 2018 Cimosoft Codelicious, Org'
    end
    object b1: TButton
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Baiklah'
      TabOrder = 0
      OnClick = b1Click
    end
    object b0: TButton
      Left = 536
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Tutup'
      TabOrder = 1
      OnClick = b0Click
    end
  end
end
