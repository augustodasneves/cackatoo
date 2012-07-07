unit Umd;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm = class(TDataModule)
    dbconexao: TADOConnection;
    tbusuarios: TADOTable;
    tbusuariosLogin: TStringField;
    tbusuariosSenha: TStringField;
    tbfuncionarios: TADOTable;
    tbfuncionarioscod_funcionario: TAutoIncField;
    tbfuncionariosnome_funcionario: TStringField;
    tbfuncionariosdata_admissao: TDateField;
    tbfuncionariostelefone: TStringField;
    tbprodutos: TADOTable;
    tbprodutoscod_prod: TAutoIncField;
    tbprodutosnome_prod: TStringField;
    tbprodutosmarca: TStringField;
    tbprodutosvalor: TFloatField;
    tbprodutosfornecedor: TStringField;
    tbforn: TADOTable;
    tborc: TADOTable;
    tborccod_orc: TAutoIncField;
    tborcnome_prod: TStringField;
    tborcvalor_orc: TFloatField;
    tborcdata_orc: TDateField;
    tbforncod_forn: TAutoIncField;
    tbforncnpj: TStringField;
    tbfornnome_forn: TStringField;
    tbforntelefone_forn: TStringField;
    tbfornemail: TStringField;
    tbforncod_prod: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
