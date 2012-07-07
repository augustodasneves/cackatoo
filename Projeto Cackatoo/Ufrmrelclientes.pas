unit Ufrmrelclientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, QRCtrls, QuickRpt, ExtCtrls, StdCtrls, Mask, DBCtrls;

type
  Tfrmrelclientes = class(TForm)
    ADOQuery1: TADOQuery;
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData3: TQRSysData;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand4: TQRBand;
    QRSysData2: TQRSysData;
    QRSysData4: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    ADOQuery1id_cliente: TAutoIncField;
    ADOQuery1nome_cliente: TStringField;
    ADOQuery1nome_tipo: TStringField;
    ADOQuery1ddd: TStringField;
    ADOQuery1telefone: TStringField;
    ADOQuery1nome_bairro: TStringField;
    ADOQuery1endereco: TStringField;
    ADOQuery1num: TStringField;
    ADOQuery1rg: TStringField;
    ADOQuery1sexo: TStringField;
    ADOQuery1data_nascimento: TDateField;
    ADOQuery1ativo: TSmallintField;
    ADOQuery1cpf: TStringField;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    QRDBText3: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText11: TQRDBText;
    ADOQuery1email: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelclientes: Tfrmrelclientes;

implementation

uses Ufrmconscliente, Ucadcliente;

{$R *.dfm}

procedure Tfrmrelclientes.FormCreate(Sender: TObject);
var
i:integer;
begin
    i:=0;
  while i <= Screen.FormCount - 1 do { Conta até o último formulário da tela }
    begin
      if( Screen.Forms[i] = frmconscliente ) then
        begin
          with ADOQuery1 do
            begin
              Close;
              SQL.Clear;
              SQL.Text:=frmconscliente.qconsulta.SQL.Text;
              Active:=true;
              Open;
           end;
          i := Screen.FormCount;
        end
        else
          begin
            ADOQuery1.sql.Text:='select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = bairro.id_bairro';
            ADOQuery1.Open;
          end;
        Inc(i);
     end;
     if(ADOQuery1.RecordCount=0)then
      begin
        if(Application.MessageBox('Não há registros de clientes, quer cadastrar clientes agora?','Atenção',MB_YESNO)=idyes)then
          begin
            Application.CreateForm(Tfrmcadcliente, frmcadcliente);
            frmcadcliente.showmodal;
            frmcadcliente.free;
          end;
      end
      else
        begin
          QuickRep1.Preview;
          QuickRep1.Free;
      end;
end;
end.
