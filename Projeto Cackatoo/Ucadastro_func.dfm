object frmcadfuncionarios: Tfrmcadfuncionarios
  Left = 542
  Top = 333
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cackatoo - Cadastro de Funcion'#225'rios'
  ClientHeight = 280
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001001010000000000000680500001600000028000000100000002000
    0000010008000000000000010000000000000000000000010000000000000000
    0000CCE5BF0099D8FF0066FFFF007FE599004CE5FF003399FF004CFFA5004CE5
    590059BF3F00B2CCFF0019FF4C000CBF00000CBF190000E533008C8CFF0019D8
    0C003FD8660033A5FF00BFCCFF000CD826007FFFFF004CFFBF007F7F7F003FA5
    FF00CCCCFF0026BF000033FF4C00B2B2FF0066BFFF004CA5FF000066E50072BF
    FF0099E5E50059A5FF003399000026BF3300D8D8FF0026A5000033E54C0000FF
    26007FBFFF0059F2CC0072FFD8000C8CFF000CFF26007FF2990066FFF20033FF
    99004CFF7F004CF259003F3FFF0033E566000CCC000019F2190019FF3F000CBF
    0C0000D8190099CC7F008CD87F003FE5660000CC33009999FF004CE566003FB2
    FF004CF2A50059FF99004CB2FF003FFF3F0066B23F00BFBFFF000000FF0019B2
    00000CD84C00D8E5FF000099FF008CF2FF0072D8FF0066B2FF003FFF5900E5E5
    FF003FF24C000C99FF0033B2000026F27F0066E5B2001999FF00BFF2CC00D8FF
    D80000FF330099CCFF000026D8006666FF0059FF72002699FF00000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000005019000019000000000000570000
    2525503E19191C5000000057112E0000250F1C1C1C00545700573C284F000000
    000000003F00304914362D44003B000000000058513D315D44592D2438090000
    000000114927371B590E0D26230000000000044142070B32393526263A000000
    00002A152F16081A4848484500003346004A0A0A21081A53264826000000475B
    1F56182913100C264823000000005C1C2C4B4B1E0A3426234500000000004E5C
    1E4052064C2B5501000000000000405E171756224D0300000000000000005A12
    431D20020300000000000000000000150505051500000000000000000000FFFF
    0000F37E0000C0380000C1210000FD020000F8000000F8010000F0010000F003
    000020070000000F0000001F0000003F000000FF000001FF000083FF0000}
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btn_cad_func: TBitBtn
    Left = 8
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Cadastrar'
    TabOrder = 0
  end
  object btncancelarfunc: TBitBtn
    Left = 96
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 1
  end
  object btnfecharcadfunc: TBitBtn
    Left = 184
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btnfecharcadfuncClick
  end
  object DataSource1: TDataSource
    DataSet = dm.tbfuncionarios
    Enabled = False
    Left = 248
    Top = 112
  end
end