unit Uvenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, DB, StdCtrls, Mask, DBCtrls, ADODB, Grids,
  DBGrids, Buttons, ComCtrls, IdBaseComponent, IdComponent, IdIPWatch;

type
  Tfrmvenda = class(TForm)
    Image1: TImage;
    ds_nf: TDataSource;
    ds_itens_vendas: TDataSource;
    lbl_valor_total: TLabel;
    edt_valor_total: TDBEdit;
    lbl_data: TLabel;
    edt_data: TDBEdit;
    lbl_hora: TLabel;
    edt_hora: TDBEdit;
    cmb_cliente: TDBLookupComboBox;
    lbl_cliente: TLabel;
    lbl_funcionario: TLabel;
    DBGrid1: TDBGrid;
    cons_cliente: TADOQuery;
    cons_funcionario: TADOQuery;
    ds_cliente: TDataSource;
    ds_funcionario: TDataSource;
    cons_clienteid_cliente: TAutoIncField;
    cons_clientenome_cliente: TStringField;
    cmb_funcionario: TDBLookupComboBox;
    cmb_tipo_doc: TDBComboBox;
    lbl_tipo_doc: TLabel;
    Timer1: TTimer;
    IP: TIdIPWatch;
    StatusBar: TStatusBar;
    edt_prod: TEdit;
    DBGrid2: TDBGrid;
    cons_produto: TADOQuery;
    ds_produto: TDataSource;
    lbl_desconto: TLabel;
    edt_desconto: TDBEdit;
    cons_produtoid_produto: TAutoIncField;
    cons_produtonome_prod: TStringField;
    cons_produtomarca: TStringField;
    cons_produtovalor_venda: TBCDField;
    cons_produtodata_modificacao: TDateField;
    cons_produtovalor_forn: TBCDField;
    cons_produtoqtd: TIntegerField;
    cons_produtouni_medida: TStringField;
    cons_produtoobservacao: TStringField;
    cons_produtoestoque_minimo: TIntegerField;
    cons_produtoperecivel: TSmallintField;
    cons_produtoprazo_validade: TDateField;
    cons_produtocor: TStringField;
    cons_produtonome_fantasia: TStringField;
    cons_produtonome_funcionario: TStringField;
    cons_produtocategoria: TStringField;
    lbl_cons_produto: TLabel;
    lbl_produtos: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edt_prodChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmvenda: Tfrmvenda;

implementation

uses UDM, Ufrmlogin, DateUtils;

{$R *.dfm}








procedure Tfrmvenda.Timer1Timer(Sender: TObject);
begin
  if GetKeyState(VK_INSERT)=1 then
    StatusBar.Panels[0].Text:='INS'
  else
    StatusBar.Panels[0].Text:='';
  if GetKeyState(VK_NUMLOCK)=1 then
    StatusBar.Panels[1].Text:='NUM'
  else
    StatusBar.Panels[1].Text:='';
  if GetKeyState(VK_CAPITAL)=1 then
    StatusBar.Panels[2].Text:='CAPS'
  else
    StatusBar.Panels[2].Text:='';
  if GetKeyState(VK_SCROLL)=1 then
    StatusBar.Panels[3].Text:='SCROLL'
  else
    StatusBar.Panels[3].Text:='';
  StatusBar.Panels[4].Text:=TimeToStr(time);
  StatusBar.Panels[5].Text:=FormatDateTime('dd/mm/yyyy',date);
  StatusBar.Panels[6].Text:='Usuário:'+frmlogin.edtlogin.text;
   StatusBar.Panels[7].Text:='IP: '+IP.LocalIP;
  StatusBar.Panels[8].Text:='Nome na Rede: '+IP.LocalName;
  edt_hora.Text:=TimeToStr(time);

end;

procedure Tfrmvenda.FormActivate(Sender: TObject);
begin
  edt_data.Text:=DateToStr(Date);

end;

procedure Tfrmvenda.edt_prodChange(Sender: TObject);
begin
  if(edt_prod.Text <> '')then
    begin
     With cons_produto do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria and produto.nome_prod like '+QuotedStr(edt_prod.Text+'%'));
              Open;
      end;
       if(cons_produto.recordcount = 0)then
         begin
            Application.MessageBox('Não foram encontrados produtos','Atenção',MB_OK);
         end;
    end;
end;







end.
