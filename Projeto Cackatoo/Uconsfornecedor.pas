unit Uconsfornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, jpeg,
  DBCtrls;

type
  Tfrmconsfornecedor = class(TForm)
    DBGrid1: TDBGrid;
    rgpop: TRadioGroup;
    edtnome: TEdit;
    edtcodigo: TEdit;
    btnconsultar: TBitBtn;
    btncancelar: TBitBtn;
    btnfechar: TBitBtn;
    dsresultado: TDataSource;
    qconsulta: TADOQuery;
    edtendereco: TEdit;
    Image1: TImage;
    btncadforn: TBitBtn;
    lblordenado: TLabel;
    lblquantidade: TLabel;
    Button1: TButton;
    edtbairro: TDBLookupComboBox;
    dsbairro: TDataSource;
    query_bairro: TADOQuery;
    query_bairronome_bairro: TStringField;
    query_bairroid_bairro: TAutoIncField;
    procedure rgpopClick(Sender: TObject);
    procedure btnconsultarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
    procedure edtenderecoClick(Sender: TObject);
    procedure edtenderecoEnter(Sender: TObject);
    procedure edtenderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtenderecoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtenderecoExit(Sender: TObject);
    procedure edtbairroClick(Sender: TObject);
    procedure edtbairroEnter(Sender: TObject);
    procedure edtbairroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtbairroMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtbairroExit(Sender: TObject);
    procedure btncadfornClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
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
  frmconsfornecedor: Tfrmconsfornecedor;
  texto:string;


implementation

uses Ucadfornecedor, Ufrmrelfornecedores;

{$R *.dfm}

procedure Tfrmconsfornecedor.rgpopClick(Sender: TObject);
begin
  case rgpop.ItemIndex of
    1:
      begin
        edtnome.Visible:=true;
        edtnome.Clear;
        edtnome.SetFocus;
        edtcodigo.Visible:=false;
        edtendereco.Visible:=false;
        edtbairro.Visible:=false;
        btnconsultar.Default:=true;
      end;
    2:
      begin
        edtcodigo.Visible:=true;
        edtcodigo.Clear;
        edtcodigo.SetFocus;
        edtnome.Visible:=false;
        edtendereco.visible:=false;
        edtbairro.Visible:=false;
        btnconsultar.Default:=true;
      end;
    3:
      begin
        edtendereco.Visible:=true;
        edtendereco.Clear;
        edtendereco.SetFocus;
        edtcodigo.Visible:=false;
        edtnome.Visible:=false;
        btnconsultar.Default:=true;
        edtbairro.Visible:=false;
      end;
    4:
    begin
        edtendereco.Visible:=false;
        edtcodigo.Visible:=false;
        edtnome.Visible:=false;
        btnconsultar.Default:=true;
        edtbairro.Visible:=true;
        edtbairro.SetFocus;
    end;
    else
        edtnome.Visible:=false;
        edtcodigo.Visible:=false;
        edtendereco.Visible:=false;
        edtbairro.Visible:=false;
    end;
end;

procedure Tfrmconsfornecedor.btnconsultarClick(Sender: TObject);
begin
  with qconsulta do
    begin
      Close;
      sql.Clear;
      case rgpop.ItemIndex of
        0:sql.Add('select '+
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
'fornecedor.id_bairro = bairro.id_bairro'
);


        1:sql.Add('select '+
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
'fornecedor.id_bairro = bairro.id_bairro and fornecedor.nome_fantasia like'+QuotedStr(edtnome.Text+'%'));


        2:sql.Add('select '+
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
'fornecedor.id_bairro = bairro.id_bairro and fornecedor.id_fornecedor ='+quotedstr(edtcodigo.text));


        3:sql.Add('select '+
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
'fornecedor.id_bairro = bairro.id_bairro and fornecedor.endereco like '+Quotedstr(edtendereco.Text+'%'));


        4:sql.Add('select '+
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
'fornecedor.id_bairro like '+Quotedstr(edtbairro.KeyValue));
      end;
      try
        texto:=sql.Text;
        open;
          if(qconsulta.RecordCount=0)then
          begin
            if(Application.MessageBox('N�o h� registro de fornecedores referente � consulta,'+ #13 +'quer cadastrar um novo fornecedor agora?','Aten��o',MB_YESNO+MB_ICONQUESTION)=idyes)then
              begin
                Application.CreateForm(Tfrmcadfornecedores,frmcadfornecedores);
                frmcadfornecedores.ShowModal;
                frmcadfornecedores.Free;
              end;
          end;
      except
        Application.MessageBox('Problemas ao Consultar!','Aten��o',MB_ICONERROR+mb_OK);
        exit;
      end;
    end;
    if((rgpop.ItemIndex=0) and(qconsulta.RecordCount>1))then
      begin
        lblquantidade.Caption:='H� '+IntToStr(qconsulta.RecordCount)+' Fornecedores cadastrados';
      end
    else if((qconsulta.RecordCount=1)and (rgpop.ItemIndex=0))then
      begin
        lblquantidade.Caption:='H� '+IntToStr(qconsulta.RecordCount)+' Fornecedor Cadastrado';
      end
      else if(qconsulta.RecordCount=1)then
      begin
        lblquantidade.Caption:='H� '+IntToStr(qconsulta.RecordCount)+' Resultado para a Consulta';
      end
    else
      begin
       lblquantidade.Caption:='H� '+IntToStr(qconsulta.RecordCount)+' Resultados para a consulta';
      end;
end;

procedure Tfrmconsfornecedor.btncancelarClick(Sender: TObject);
begin
  qconsulta.Close;
  qconsulta.SQL.Clear;
  qconsulta.SQL.Add('select '+
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
'fornecedor.id_bairro = bairro.id_bairro');
  qconsulta.Open;
  frmconsfornecedor.rgpop.ItemIndex:=0;
  frmconsfornecedor.edtnome.Visible:=false;
  frmconsfornecedor.edtcodigo.Visible:=false;
  frmconsfornecedor.edtendereco.Visible:=false;
  frmconsfornecedor.edtbairro.Visible:=false;
  frmconsfornecedor.DBGrid1.Refresh;
  lblquantidade.Caption:='';
end;

procedure Tfrmconsfornecedor.btnfecharClick(Sender: TObject);
begin
     frmconsfornecedor.Close;
end;

procedure Tfrmconsfornecedor.FormActivate(Sender: TObject);
begin
   edtnome.Visible:=false;
  edtcodigo.Visible:=false;
  edtbairro.Visible:=false;
  btnconsultar.Click;
end;

procedure Tfrmconsfornecedor.WM_Move(var msg: TWMMove);
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

procedure Tfrmconsfornecedor.edtnomeClick(Sender: TObject);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtnomeEnter(Sender: TObject);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtnomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtnomeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtnomeExit(Sender: TObject);
begin
  edtnome.Color:=clWindow;
end;

procedure Tfrmconsfornecedor.edtcodigoClick(Sender: TObject);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtcodigoEnter(Sender: TObject);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtcodigoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtcodigoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtcodigoExit(Sender: TObject);
begin
  edtcodigo.Color:=clWindow;
end;

procedure Tfrmconsfornecedor.edtenderecoClick(Sender: TObject);
begin
  edtendereco.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtenderecoEnter(Sender: TObject);
begin
  edtendereco.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtenderecoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  edtendereco.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtenderecoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtendereco.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtenderecoExit(Sender: TObject);
begin
  edtendereco.Color:=clWindow;
end;

procedure Tfrmconsfornecedor.edtbairroClick(Sender: TObject);
begin
  edtbairro.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtbairroEnter(Sender: TObject);
begin
edtbairro.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtbairroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  edtbairro.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtbairroMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtbairro.Color:=clMoneyGreen;
end;

procedure Tfrmconsfornecedor.edtbairroExit(Sender: TObject);
begin
  edtbairro.Color:=clWindow;
end;

procedure Tfrmconsfornecedor.btncadfornClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadfornecedores, frmcadfornecedores);
  frmcadfornecedores.ShowModal;
  frmcadfornecedores.Free;
end;

procedure Tfrmconsfornecedor.DBGrid1TitleClick(Column: TColumn);
var
campo:string;
cons:string;
begin
  if texto = '' then
    cons := 'select * from produto'
  else
    cons := texto;
  campo:=column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  application.processmessages; // para considerar algo que aconte�a no dbgrid durante a entrada nesta procedure
  qconsulta.sql.clear; // LIMPA A QUERY
  qconsulta.sql.add(cons +' order by '+campo); // ESCREVE O SELECT COM O ORDER BY
  qconsulta.Open; // ABRE A QUERY COM A ORDEM ESCOLHIDA.
  lblordenado.caption:='Classificado por : [ '+Column.Title.Caption+' ]';
end;

procedure Tfrmconsfornecedor.Button1Click(Sender: TObject);
begin
   if DBGrid1.FieldCount = 0 then
   begin
     if (Application.MessageBox('� necess�rio consultar para gerar um relat�rio','Aten��o',MB_OK+MB_ICONERROR))=1 then
       begin
          rgpop.SetFocus;
       end;
   end
 else
   begin
      Application.CreateForm(Tfrmrelfornecedores,frmrelfornecedores);
      frmrelfornecedores.Free;
   end;
end;

procedure Tfrmconsfornecedor.edtcodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente N�meros');
    end;
end;

procedure Tfrmconsfornecedor.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar o formul�rio de consulta?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

end.
