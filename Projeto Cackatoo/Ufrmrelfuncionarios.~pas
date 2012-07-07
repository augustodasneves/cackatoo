unit Ufrmrelfuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QRCtrls, DB, ADODB, QuickRpt, ExtCtrls;

type
  Tfrmrelfuncionarios = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    cons_funcionarios: TADOQuery;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel9: TQRLabel;
    QRDBText6: TQRDBText;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRSysData4: TQRSysData;
    QRLabel12: TQRLabel;
    QRSysData3: TQRSysData;
    cons_funcionariosid_funcionario: TAutoIncField;
    cons_funcionariosnome_funcionario: TStringField;
    cons_funcionariosdata_admissao: TDateField;
    cons_funcionariossexo: TStringField;
    cons_funcionariosnome_tipo: TStringField;
    cons_funcionariosddd: TStringField;
    cons_funcionariostelefone: TStringField;
    cons_funcionariossalario_liquido: TBCDField;
    cons_funcionariossalario_bruto: TBCDField;
    cons_funcionariosdata_nascimento: TDateField;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrelfuncionarios: Tfrmrelfuncionarios;

implementation

uses Uconsultafunc, Ufrmcadfuncionario;

{$R *.dfm}

procedure Tfrmrelfuncionarios.FormCreate(Sender: TObject);
var
i:integer;
begin
    i:=0;
  while i <= Screen.FormCount - 1 do { Conta até o último formulário da tela }
    begin
      if( Screen.Forms[i] = frmconsfunc ) then
        begin
          with cons_funcionarios do
            begin
              Close;
              SQL.Clear;
              SQL.Text:=frmconsfunc.qconsulta.SQL.Text;
              Active:=true;
              Open;
           end;
          i := Screen.FormCount;
        end
        else
          begin
            cons_funcionarios.sql.Text:='select '+
                  'funcionarios.id_funcionario,'+
                  'funcionarios.nome_funcionario,'+
                  'funcionarios.data_admissao,'+
                  'funcionarios.sexo,'+
                  'tipo_telefone.nome_tipo,'+
                  'funcionarios.ddd,'+
                  'funcionarios.telefone,'+
                  'funcionarios.salario_liquido,'+
                  'funcionarios.salario_bruto,'+
                  'funcionarios.data_nascimento '+
                  'from funcionarios,tipo_telefone '+
                  'where tipo_telefone.id_tipo=funcionarios.id_tipo_tel';
            cons_funcionarios.Open;
          end;
        Inc(i);
     end;
      if(cons_funcionarios.RecordCount=0)then
      begin
        if(Application.MessageBox('Não há registros de Funcionários, quer cadastrar funcionários agora?','Atenção',MB_YESNO)=idyes)then
          begin
            Application.CreateForm(Tfrmcadfuncionarios, frmcadfuncionarios);
            frmcadfuncionarios.showmodal;
            frmcadfuncionarios.free;
          end;
      end
      else
        begin
          QuickRep1.Preview;
          QuickRep1.Free;
      end;
end;

end.
