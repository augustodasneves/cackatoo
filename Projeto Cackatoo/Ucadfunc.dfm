object frmcadprodutos: Tfrmcadprodutos
  Left = 288
  Top = 119
  Width = 438
  Height = 253
  BorderIcons = [biSystemMenu]
  Caption = 'Cackatoo - Cadastro de Produtos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 91
    Height = 13
    Caption = 'C'#243'digo do Produto:'
    FocusControl = edtcodprod
  end
  object Label2: TLabel
    Left = 8
    Top = 48
    Width = 86
    Height = 13
    Caption = 'Nome do Produto:'
    FocusControl = edtnomeprod
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 88
    Height = 13
    Caption = 'Marca do Produto:'
    FocusControl = edtmarcaprod
  end
  object Label4: TLabel
    Left = 8
    Top = 168
    Width = 82
    Height = 13
    Caption = 'Valor do Produto:'
    FocusControl = edtvalorprod
  end
  object Label5: TLabel
    Left = 8
    Top = 88
    Width = 158
    Height = 13
    Caption = 'Nome do Fornecedor do Produto:'
    FocusControl = edtnomefornprod
  end
  object edtcodprod: TDBEdit
    Left = 8
    Top = 24
    Width = 134
    Height = 21
    DataField = 'cod_prod'
    DataSource = DataSource1
    TabOrder = 0
  end
  object edtnomeprod: TDBEdit
    Left = 8
    Top = 64
    Width = 416
    Height = 21
    DataField = 'nome_prod'
    DataSource = DataSource1
    TabOrder = 1
  end
  object edtmarcaprod: TDBEdit
    Left = 8
    Top = 144
    Width = 193
    Height = 21
    DataField = 'marca'
    DataSource = DataSource1
    TabOrder = 2
  end
  object edtvalorprod: TDBEdit
    Left = 8
    Top = 184
    Width = 134
    Height = 21
    DataField = 'valor'
    DataSource = DataSource1
    TabOrder = 3
  end
  object edtnomefornprod: TDBEdit
    Left = 8
    Top = 104
    Width = 257
    Height = 21
    DataField = 'fornecedor'
    DataSource = DataSource1
    TabOrder = 4
  end
  object btncadprod: TBitBtn
    Left = 8
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 5
  end
  object btncancelaprod: TBitBtn
    Left = 96
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
  end
  object btnfechaprod: TBitBtn
    Left = 184
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 7
    OnClick = btnfechaprodClick
  end
  object DataSource1: TDataSource
    DataSet = dm.tbprodutos
    Left = 256
    Top = 16
  end
end
