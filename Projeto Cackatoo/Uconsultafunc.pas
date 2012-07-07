unit Uconsultafunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, Buttons, ExtCtrls, ComCtrls,
  jpeg;

type
  Tfrmconsfunc = class(TForm)
    DBGrid1: TDBGrid;
    dsresultado: TDataSource;
    qconsulta: TADOQuery;
    rgpop: TRadioGroup;
    edtnome: TEdit;
    edtcodigo: TEdit;
    btnconsultar: TBitBtn;
    btncancelar: TBitBtn;
    btnfechar: TBitBtn;
    Image1: TImage;
    btncadfunc: TBitBtn;
    lblordenado: TLabel;
    lblquantidade: TLabel;
    btngera_rel: TButton;
    qconsultaid_funcionario: TAutoIncField;
    qconsultanome_funcionario: TStringField;
    qconsultadata_admissao: TDateField;
    qconsultasexo: TStringField;
    qconsultanome_tipo: TStringField;
    qconsultaddd: TStringField;
    qconsultatelefone: TStringField;
    qconsultasalario_liquido: TBCDField;
    qconsultasalario_bruto: TBCDField;
    qconsultadata_nascimento: TDateField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgpopClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnconsultarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure edtnomeClick(Sender: TObject);
    procedure edtnomeEnter(Sender: TObject);
    procedure edtnomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtnomeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtnomeExit(Sender: TObject);
    procedure edtcodigoClick(Sender: TObject);
    procedure edtcodigoEnter(Sender: TObject);
    procedure edtcodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcodigoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtcodigoExit(Sender: TObject);
    procedure btncadfuncClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btngera_relClick(Sender: TObject);
    procedure edtcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private

    { Private declarations }
  public
  procedure WM_Move(var msg: TWMMove);
    message WM_MOVE;
    { Public declarations }
  end;

var
  frmconsfunc: Tfrmconsfunc;
  texto:string;

implementation

uses Ufrmcadfuncionario, Ufrmrelfuncionarios;

{$R *.dfm}

procedure Tfrmconsfunc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure Tfrmconsfunc.rgpopClick(Sender: TObject);
begin
  case rgpop.ItemIndex of
    1:
      begin
        edtnome.Visible:=true;
        edtnome.Clear;
        edtnome.SetFocus;
        edtcodigo.Visible:=false;
        btnconsultar.Default:=true;
      end;
    2:
      begin
        edtcodigo.Visible:=true;
        edtcodigo.Clear;
        edtcodigo.SetFocus;
        edtnome.Visible:=false;
        btnconsultar.Default:=true;
      end;
    else
        edtnome.Visible:=false;
        edtcodigo.Visible:=false;
    end;
end;

procedure Tfrmconsfunc.FormActivate(Sender: TObject);
begin
  edtnome.Visible:=false;
  edtcodigo.Visible:=false;
  btnconsultar.Click;
end;

procedure Tfrmconsfunc.btnconsultarClick(Sender: TObject);
begin
  with qconsulta do
    begin
      Close;
      sql.Clear;
      case rgpop.ItemIndex of
        0:
          sql.Add(
                  'select '+
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
                  'where tipo_telefone.id_tipo=funcionarios.id_tipo_tel');
        1:
          sql.Add('select '+
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
                  'where tipo_telefone.id_tipo=funcionarios.id_tipo_tel '+
                  'and funcionarios.nome_funcionario like '+QuotedStr(edtnome.Text+'%'));


        2:
          sql.Add('select '+
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
                  'where tipo_telefone.id_tipo=funcionarios.id_tipo_tel'+
                  ' and funcionarios.id_funcionario = '
                  +quotedstr(edtcodigo.text));
      end;
      try
        texto:=sql.text;
        open;
          if(qconsulta.RecordCount=0)then
          begin
            if(Application.MessageBox('Não há registro de funcionários referente à consulta,'+#13+ 'quer cadastrar um novo funcionário agora?','Atenção',MB_YESNO+MB_ICONQUESTION)=idyes)then
              begin
                Application.CreateForm(Tfrmcadfuncionarios,frmcadfuncionarios);
                frmcadfuncionarios.ShowModal;
                frmcadfuncionarios.Free;
              end;
          end;
      except
        Application.MessageBox('Problema da Consulta','Atenção',MB_ICONQUESTION);
        exit;
      end;
    end;
     if((rgpop.ItemIndex=0) and(qconsulta.RecordCount>1))then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Funcionários cadastrados';
      end
    else if((qconsulta.RecordCount=1)and (rgpop.ItemIndex=0))then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Funcionário Cadastrado';
      end
      else if(qconsulta.RecordCount=1)then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Resultado para a Consulta';
      end
    else
      begin
       lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Resultados para a consulta';
      end;
end;

procedure Tfrmconsfunc.btncancelarClick(Sender: TObject);
begin
  qconsulta.Close;
  qconsulta.SQL.Clear;
  qconsulta.SQL.Add('select '+
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
                  'where tipo_telefone.id_tipo=funcionarios.id_tipo_tel');
  qconsulta.Open;
  frmconsfunc.rgpop.ItemIndex:=0;
  frmconsfunc.edtnome.Visible:=false;
  frmconsfunc.edtcodigo.Visible:=false;
  frmconsfunc.DBGrid1.Refresh;
  lblquantidade.Caption:='';
end;

procedure Tfrmconsfunc.btnfecharClick(Sender: TObject);
begin
     frmconsfunc.Close;
end;

procedure Tfrmconsfunc.WM_Move(var msg: TWMMove);
begin
  if Left < 0 then
    left:=0;
   if top < 0then
    top:=0;
   if screen.Width-(left+width)< 0 then
    left:=screen.Width - width;
   if screen.Height-(top+height) <0 then
    top:=screen.Height-Height;
end;

procedure Tfrmconsfunc.edtnomeClick(Sender: TObject);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsfunc.edtnomeEnter(Sender: TObject);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsfunc.edtnomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsfunc.edtnomeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsfunc.edtnomeExit(Sender: TObject);
begin
  edtnome.Color:=clWindow;
end;

procedure Tfrmconsfunc.edtcodigoClick(Sender: TObject);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsfunc.edtcodigoEnter(Sender: TObject);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsfunc.edtcodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsfunc.edtcodigoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsfunc.edtcodigoExit(Sender: TObject);
begin
  edtcodigo.Color:=clWindow;
end;

procedure Tfrmconsfunc.btncadfuncClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadfuncionarios,frmcadfuncionarios);
  frmcadfuncionarios.showmodal;
  frmcadfuncionarios.free;
end;

procedure Tfrmconsfunc.DBGrid1TitleClick(Column: TColumn);
var
campo:string;
cons:string;
begin
  if texto = '' then
    cons := 'select * from produto'
  else
    cons := texto;
  campo:=column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure
  qconsulta.sql.clear; // LIMPA A QUERY
  qconsulta.sql.add(cons +' order by '+campo); // ESCREVE O SELECT COM O ORDER BY
  qconsulta.Open; // ABRE A QUERY COM A ORDEM ESCOLHIDA.
  lblordenado.caption:='Classificado por : [ '+Column.Title.Caption+' ]';
end;

procedure Tfrmconsfunc.btngera_relClick(Sender: TObject);
begin
 if DBGrid1.FieldCount = 0 then
   begin
     if (Application.MessageBox('É necessário consultar para gerar um relatório','Atenção',MB_OK+MB_ICONERROR))=1 then
       begin
          rgpop.SetFocus;
       end;
   end
 else
   begin
    Application.CreateForm(Tfrmrelfuncionarios,frmrelfuncionarios);
    frmrelfuncionarios.Free;
   end;
end;

procedure Tfrmconsfunc.edtcodigoKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;

procedure Tfrmconsfunc.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário de consulta?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

end.
