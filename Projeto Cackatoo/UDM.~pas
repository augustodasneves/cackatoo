unit UDM;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDM = class(TDataModule)
    dbconexao: TADOConnection;
    tbproduto: TADOTable;
    tbfuncionarios: TADOTable;
    tbfornecedor: TADOTable;
    tbusuario: TADOTable;
    tbnota_fiscal: TADOTable;
    tbcategoria: TADOTable;
    tbcategoriacategoria: TStringField;
    tbcliente: TADOTable;
    tbcategoriaid_categoria: TAutoIncField;
    tbitens_venda: TADOTable;
    tblog: TADOTable;
    tbentrega: TADOTable;
    tbentregaid_entrega: TAutoIncField;
    tbentregaid_nf: TIntegerField;
    tbentregaid_bairro: TIntegerField;
    tbentregahorario_entregue: TDateTimeField;
    tbentregapendente: TSmallintField;
    tbbairro: TADOTable;
    tbbairroid_bairro: TAutoIncField;
    tbbairroid_cidade: TIntegerField;
    tbbairronome_bairro: TStringField;
    tbbairrovalor_entrega: TBCDField;
    tbcidade: TADOTable;
    tbcidadeid_cidade: TAutoIncField;
    tbcidadeid_uf: TIntegerField;
    tbcidadenome_cidade: TStringField;
    tbuf: TADOTable;
    tbufid_uf: TAutoIncField;
    tbufnome_uf: TStringField;
    tbufsigla_uf: TStringField;
    tbprodutoid_produto: TAutoIncField;
    tbprodutofornecedor_id_fornecedor: TIntegerField;
    tbprodutoid_funcionario: TIntegerField;
    tbprodutoid_categoria: TIntegerField;
    tbprodutonome_prod: TStringField;
    tbprodutomarca: TStringField;
    tbprodutovalor_venda: TBCDField;
    tbprodutodata_modificacao: TDateField;
    tbprodutovalor_forn: TBCDField;
    tbprodutoqtd: TIntegerField;
    tbprodutouni_medida: TStringField;
    tbprodutoobservacao: TStringField;
    tbprodutoestoque_minimo: TIntegerField;
    tbprodutoperecivel: TSmallintField;
    tbprodutoprazo_validade: TDateField;
    tbprodutocor: TStringField;
    tbfuncionariosid_funcionario: TAutoIncField;
    tbfuncionariosid_tipo_tel: TIntegerField;
    tbfuncionariosnome_funcionario: TStringField;
    tbfuncionariosdata_admissao: TDateField;
    tbfuncionariostelefone: TStringField;
    tbfuncionariosddd: TStringField;
    tbfuncionariossexo: TStringField;
    tbfuncionariossalario_liquido: TBCDField;
    tbfuncionariossalario_bruto: TBCDField;
    tbfuncionariosdata_nascimento: TDateField;
    tbusuarioid_usuario: TAutoIncField;
    tbusuariosenha: TStringField;
    tbusuariosenha_crip: TStringField;
    tbnota_fiscalid_nf: TAutoIncField;
    tbnota_fiscalid_funcionario: TIntegerField;
    tbnota_fiscalid_cliente: TIntegerField;
    tbnota_fiscalvalor_orc: TBCDField;
    tbnota_fiscaldata_orc: TDateField;
    tbnota_fiscalhora: TTimeField;
    tbclienteid_cliente: TAutoIncField;
    tbclienteid_tipo_telefone: TIntegerField;
    tbclienteid_bairro: TIntegerField;
    tbclientenome_cliente: TStringField;
    tbclientetelefone: TStringField;
    tbclienteendereco: TStringField;
    tbclientenum: TStringField;
    tbclienterg: TStringField;
    tbclientesexo: TStringField;
    tbclienteddd: TStringField;
    tbclientedata_nascimento: TDateField;
    tbclienteativo: TSmallintField;
    tbclientecpf: TStringField;
    tbtipo_telefone: TADOTable;
    tbfornecedorid_fornecedor: TAutoIncField;
    tbfornecedorid_tipo_tel: TIntegerField;
    tbfornecedorid_bairro: TIntegerField;
    tbfornecedornome_fantasia: TStringField;
    tbfornecedorrazao_social: TStringField;
    tbfornecedorcnpj: TStringField;
    tbfornecedortelefone_forn: TStringField;
    tbfornecedoremail: TStringField;
    tbfornecedorendereco: TStringField;
    tbfornecedornum: TStringField;
    tbfornecedorfax: TStringField;
    tbfornecedorddd: TStringField;
    tbfornecedorativo: TSmallintField;
    tbtipo_telefoneid_tipo: TAutoIncField;
    tbtipo_telefonenome_tipo: TStringField;
    tbusuarioid_funcionario: TIntegerField;
    tbusuariologin: TStringField;
    tblogid_log: TAutoIncField;
    tblogid_usuario: TIntegerField;
    tblogdata_hora: TStringField;
    tbloglocal_acesso: TStringField;
    tblogoperacao: TStringField;
    tb_a_vista: TADOTable;
    tb_a_vistaid_vista: TAutoIncField;
    tb_a_vistaid_nf: TIntegerField;
    tb_a_vistavalor_recebido: TBCDField;
    tb_a_vistatroco: TBCDField;
    tbparcelado: TADOTable;
    tbparceladoid_parcela: TAutoIncField;
    tbparceladoid_nf: TIntegerField;
    tbparceladonro_parcelas: TIntegerField;
    tbparceladovalor_parcela: TBCDField;
    tbparceladodata_parcela: TDateField;
    tbitens_vendaid_item: TIntegerField;
    tbitens_vendaid_produto: TIntegerField;
    tbitens_vendaid_nf: TIntegerField;
    tbitens_vendavalor_unitario: TBCDField;
    tbitens_vendaqtd: TIntegerField;
    tbitens_vendasubtotal: TBCDField;
    tbfornecedorinscricao: TStringField;
    tbcaixa: TADOTable;
    tbcaixaid_caixa: TAutoIncField;
    tbcaixaid_funcionario: TIntegerField;
    tbcaixavalor: TBCDField;
    tbcaixadata_fechamento: TDateField;
    tbcaixaobservacao: TStringField;
    tbclienteemail: TStringField;
    tblista_telefonica: TADOTable;
    tblista_telefonicaid_lista: TAutoIncField;
    tblista_telefonicaid_tipo: TIntegerField;
    tblista_telefonicanome: TStringField;
    tblista_telefonicatelefone: TIntegerField;
    tblista_telefonicaddd: TIntegerField;
    tbnota_fiscaldesconto: TBCDField;
    tbnota_fiscaltipo_documento: TStringField;
    tbrenda_mensal: TADOTable;
    tbretirada: TADOTable;
    tbretiradaid_retirada: TAutoIncField;
    tbretiradaid_funcionario: TIntegerField;
    tbretiradadata_retirada: TDateField;
    tbretiradavalor: TBCDField;
    tbretiradadestino: TStringField;
    tbretiradaobservacao: TStringField;
    tbrenda_mensalid_mensal: TAutoIncField;
    tbrenda_mensalid_funcionario: TIntegerField;
    tbrenda_mensalmes: TStringField;
    tbrenda_mensalvalor: TBCDField;
    tbrenda_mensalobservacoes: TStringField;
    tbMarca: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}







end.
