object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 496
  ClientWidth = 835
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 137
    Top = 83
    Width = 88
    Height = 13
    Caption = 'Nomre de taches: '
  end
  object Label2: TLabel
    Left = 137
    Top = 107
    Width = 100
    Height = 13
    Caption = 'Nomre de machines: '
  end
  object StringGrid1: TStringGrid
    Left = 112
    Top = 158
    Width = 417
    Height = 92
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 696
    Top = 432
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 240
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 243
    Top = 107
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit2'
  end
  object Button2: TButton
    Left = 416
    Top = 102
    Width = 75
    Height = 25
    Caption = 'Valider'
    TabOrder = 4
    OnClick = Button2Click
  end
  object StringGrid2: TStringGrid
    Left = 112
    Top = 256
    Width = 481
    Height = 129
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 344
    Top = 434
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit3'
  end
end
