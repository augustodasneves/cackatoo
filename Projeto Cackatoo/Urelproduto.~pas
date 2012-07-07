unit Urelproduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, ADODB;

type
  Tfrmrelproduto = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand3: TQRBand;
    ADOQuery1: TADOQuery;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel12: TQRLabel;
    QRSysData3: TQRSysData;
    ADOQuery2: TADOQuery;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    lbltotal_valor: TQRLabel;
    valor_total: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText8: TQRDBText;
    ADOQuery2sumvalor_venda: TBCDField;
    ADOQuery1id_produto: TAutoIncField;
    ADOQuery1nome_prod: TStringField;
    ADOQuery1marca: TStringField;
    ADOQuery1valor_venda: TBCDField;
    ADOQuery1data_modificacao: TDateField;
    ADOQuery1valor_forn: TBCDField;
    ADOQuery1qtd: TIntegerField;
    ADOQuery1uni_medida: TStringField;
    ADOQuery1observacao: TStringField;
    ADOQuery1estoque_minimo: TIntegerField;
    ADOQuery1perecivel: TSmallintField;
    ADOQuery1prazo_validade: TDateField;
    ADOQuery1cor: TStringField;
    ADOQuery1nome_fantasia: TStringField;
    ADOQuery1nome_funcionario: TStringField;
    ADOQuery1categoria: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelproduto: Tfrmrelproduto;

implementation

uses Uconsproduto, Ucadproduto;

{$R *.dfm}

procedure Tfrmrelproduto.FormCreate(Sender: TObject);
var
i:integer;
begin
    i:=0;
  while i <= Screen.FormCount - 1 do { Conta até o último formulário da tela }
    begin
      if( Screen.Forms[i] = frmconsproduto ) then
        begin
          with ADOQuery1 do
            begin
              Close;
              SQL.Clear;
              SQL.Text:=frmconsproduto.qconsulta.SQL.Text;
              Active:=true;
              Open;
           end;
          i := Screen.FormCount;
        end
        else
          begin
            ADOQuery1.sql.Text:='select '+
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
                  'produto.id_categoria = categoria.id_categoria';
            ADOQuery1.Open;
          end;
        Inc(i);
     end;

  if(ADOQuery1.RecordCount=0)then
      begin
        if(Application.MessageBox('Não há registros de Produtos, quer cadastrar Produtos agora?','Atenção',MB_YESNO)=idyes)then
          begin
            Application.CreateForm(Tfrmcadproduto, frmcadproduto);
            frmcadproduto.showmodal;
            frmcadproduto.free;
          end;
      end
      else
        begin
          ADOQuery2.Open;
          lbltotal_valor.Visible:=true;
          valor_total.Visible:=true;
          QuickRep1.Preview;
          QuickRep1.Free;
      end;
end;

end.
