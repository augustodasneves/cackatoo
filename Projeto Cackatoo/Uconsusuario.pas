unit Uconsusuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DB, ADODB, Buttons, jpeg;

type
  Tfrmconsusuario = class(TForm)
    btnconsultar: TBitBtn;
    btncancelar: TBitBtn;
    btnfechar: TBitBtn;
    qconsulta: TADOQuery;
    dsresultado: TDataSource;
    rgpop: TRadioGroup;
    DBGrid1: TDBGrid;
    edtnome: TEdit;
    Image1: TImage;
    btncadusu: TBitBtn;
    lblordenado: TLabel;
    lblquantidade: TLabel;
    procedure rgpopClick(Sender: TObject);
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
    procedure btncadusuClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconsusuario: Tfrmconsusuario;
  texto:string;

implementation

uses Ucadusuario;

{$R *.dfm}

procedure Tfrmconsusuario.rgpopClick(Sender: TObject);
begin
  case rgpop.ItemIndex of
    1:
      begin
        edtnome.Visible:=true;
        edtnome.Clear;
        edtnome.SetFocus;
        btnconsultar.Default:=true;
      end;
      else
        edtnome.Visible:=false;
    end;
end;

procedure Tfrmconsusuario.btnconsultarClick(Sender: TObject);
begin
   with qconsulta do
    begin
      Close;
      sql.Clear;
      case rgpop.ItemIndex of
        0:
          sql.Add('select login from usuario');
        1:
          sql.Add('select login from usuario where login like '+QuotedStr(edtnome.Text+'%'));
      end;
      try
        texto:=sql.Text;
        open;
          if(qconsulta.RecordCount=0)then
          begin
           lblquantidade.Color:=clRed;
            end;
      except
        Application.MessageBox('Problemas ao Consultar!','Atenção',MB_ICONERROR+mb_OK);
        exit;
      end;
    end;
    if((rgpop.ItemIndex=0) and(qconsulta.RecordCount>1))then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Usuários cadastrados';
      end
    else if((qconsulta.RecordCount=1)and (rgpop.ItemIndex=0))then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Usuário Cadastrado';
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
procedure Tfrmconsusuario.btncancelarClick(Sender: TObject);
begin
  qconsulta.Close;
  qconsulta.SQL.Clear;
  qconsulta.SQL.Add('select login from usuarios');
  qconsulta.Open;
  frmconsusuario.rgpop.ItemIndex:=0;
  frmconsusuario.edtnome.Clear;
  frmconsusuario.edtnome.Visible:=false;
  frmconsusuario.DBGrid1.Refresh;
end;

procedure Tfrmconsusuario.btnfecharClick(Sender: TObject);
begin
    frmconsusuario.Close;
end;

procedure Tfrmconsusuario.edtnomeClick(Sender: TObject);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsusuario.edtnomeEnter(Sender: TObject);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsusuario.edtnomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsusuario.edtnomeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsusuario.edtnomeExit(Sender: TObject);
begin
  edtnome.Color:=clWindow;
end;

procedure Tfrmconsusuario.btncadusuClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadusuarios,frmcadusuarios);
  frmcadusuarios.showmodal;
  frmcadusuarios.free;
end;

procedure Tfrmconsusuario.DBGrid1TitleClick(Column: TColumn);
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

procedure Tfrmconsusuario.FormActivate(Sender: TObject);
begin
  btnconsultar.Click;
end;

procedure Tfrmconsusuario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário de consulta?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

end.
