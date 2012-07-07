unit Ufrmrelfornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, QuickRpt, ExtCtrls, DB, ADODB;

type
  Tfrmrelfornecedores = class(TForm)
    cons_fornecedor: TADOQuery;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    cons_fornecedorid_fornecedor: TAutoIncField;
    cons_fornecedornome_fantasia: TStringField;
    cons_fornecedorrazao_social: TStringField;
    cons_fornecedorcnpj: TStringField;
    cons_fornecedorinscricao: TStringField;
    cons_fornecedornome_tipo: TStringField;
    cons_fornecedorddd: TStringField;
    cons_fornecedortelefone_forn: TStringField;
    cons_fornecedornome_bairro: TStringField;
    cons_fornecedorendereco: TStringField;
    cons_fornecedornum: TStringField;
    cons_fornecedorfax: TStringField;
    cons_fornecedorativo: TSmallintField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelfornecedores: Tfrmrelfornecedores;

implementation

uses Uconsfornecedor, Ucadfornecedor;

{$R *.dfm}

procedure Tfrmrelfornecedores.FormCreate(Sender: TObject);
var
i:integer;
begin
     i:=0;
  while i <= Screen.FormCount - 1 do { Conta até o último formulário da tela }
    begin
      if( Screen.Forms[i] = frmconsfornecedor ) then
        begin
          with cons_fornecedor do
            begin
              Close;
              SQL.Clear;
              SQL.Text:=frmconsfornecedor.qconsulta.SQL.Text;
              Active:=true;
              Open;
           end;
          i := Screen.FormCount;
        end
        else
          begin
        cons_fornecedor.sql.Text:='select '+
'fornecedor.id_fornecedor,'+
'fornecedor.nome_fantasia,'+
'fornecedor.razao_social,'+
'fornecedor.cnpj,'+
'fornecedor.inscricao,'+
'tipo_telefone.nome_tipo,'+
'fornecedor.ddd,'+
'fornecedor.telefone_forn,'+
'bairro.nome_bairro,'+
'fornecedor.endereco,'+
'fornecedor.num,'+
'fornecedor.fax,'+
'fornecedor.ativo '+
'from fornecedor,tipo_telefone,bairro '+
'where fornecedor.id_tipo_tel = tipo_telefone.id_tipo and '+
'fornecedor.id_bairro = bairro.id_bairro';
        cons_fornecedor.Open;
          end;
        Inc(i);
     end;
     if(cons_fornecedor.RecordCount=0)then
      begin
        if(Application.MessageBox('Não há registros de Fornecedores, quer cadastrar fornecedores agora?','Atenção',MB_YESNO)=idyes)then
          begin
            Application.CreateForm(Tfrmcadfornecedores, frmcadfornecedores);
            frmcadfornecedores.showmodal;
            frmcadfornecedores.free;
          end;
      end
      else
        begin
          QuickRep1.Preview;
          QuickRep1.Free;
      end;
end;

end.
