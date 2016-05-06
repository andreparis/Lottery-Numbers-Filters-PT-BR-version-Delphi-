object UnitDemo: TUnitDemo
  Left = 406
  Top = 261
  Width = 472
  Height = 262
  BorderIcons = [biSystemMenu]
  Caption = 'Acessando arquivos embutidos em um EXE'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 8
    Top = 13
    Width = 113
    Height = 13
    Caption = 'Azanona Tecnologia'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 24
    Top = 28
    Width = 163
    Height = 13
    Caption = 'Av. Viena, 360   - Porto Alegre/RS'
  end
  object Label12: TLabel
    Left = 24
    Top = 42
    Width = 174
    Height = 13
    Caption = 'Fone: (51) 3737-5222 ou  3325-2728'
  end
  object Label13: TLabel
    Left = 24
    Top = 56
    Width = 118
    Height = 13
    Caption = 'www.azanonatec.com.br'
  end
  object Label14: TLabel
    Left = 24
    Top = 70
    Width = 119
    Height = 13
    Caption = 'sac@azanonatec.com.br'
  end
  object Label15: TLabel
    Left = 24
    Top = 85
    Width = 167
    Height = 13
    Caption = 'MSN: suporte@azanonatec.com.br'
  end
  object Label16: TLabel
    Left = 24
    Top = 99
    Width = 136
    Height = 13
    Caption = 'MSN: dor_poa@hotmail.com'
  end
  object Label1: TLabel
    Left = 24
    Top = 115
    Width = 135
    Height = 13
    Caption = 'Criado por: Daniel Rodrigues'
  end
  object Bnt_Executardescompialacao: TButton
    Left = 248
    Top = 16
    Width = 193
    Height = 65
    Caption = '&Descompilar Arquivos Embutidos'
    TabOrder = 0
    OnClick = Bnt_ExecutardescompialacaoClick
  end
  object Bnt_Sair: TButton
    Left = 248
    Top = 96
    Width = 193
    Height = 33
    Caption = '&Sair'
    TabOrder = 1
    OnClick = Bnt_SairClick
  end
end
