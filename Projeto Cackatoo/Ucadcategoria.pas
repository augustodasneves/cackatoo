unit Ucadcategoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Buttons, Grids, DBGrids, Mask, DBCtrls, jpeg,
  ExtCtrls;

type
  Tfrmcadcategoria = class(TForm)
    DBGrid1: TDBGrid;
    btnnovo: TBitBtn;
    btnsalvar: TBitBtn;
    btnalterar: TBitBtn;
    btnexcluir: TBitBtn;
    btnfechar: TBitBtn;
    btncancelar: TBitBtn;
    DataSource1: TDataSource;
    Image1: TImage;
    gp_cadastro: TGroupBox;
    Label1: TLabel;
    edtcategoria: TDBEdit;
    procedure btnnovoClick(Sender: TObject);
    procedure btnsalvarClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure edtcategoriaClick(Sender: TObject);
    procedure edtcategoriaEnter(Sender: TObject);
    procedure edtcategoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcategoriaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtcategoriaExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure tratabotao(n:integer);
    { Public declarations }
  end;

var
  frmcadcategoria: Tfrmcadcategoria;

implementation

uses UDM, Ucadproduto;

{$R *.dfm}

procedure Tfrmcadcategoria.btnnovoClick(Sender: TObject);
var
  i:integer;
begin
  DBGrid1.Enabled:=false;
  btnsalvar.Default:=true;
   for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
   if (Components[i]is TDBedit)then  //verifica se os componentes s�o dbedits
    TDBEdit(Components[i]).Enabled:=true;  //caso seja um dbedit, ele ativa
  tratabotao(2);
  edtcategoria.SetFocus;
  dm.tbcategoria.Append;
end;

procedure Tfrmcadcategoria.btnsalvarClick(Sender: TObject);
var
  i:integer;
  categoria:string;
begin
categoria:=edtcategoria.text;
if(categoria = '')then
  begin
    if Application.MessageBox('Informe a Categoria por Favor','Aten��o',+MB_OK+MB_ICONERROR)=1 then
      begin
        edtcategoria.SetFocus;
        dm.tbcategoria.Append;
      end;
    end
  else
    begin
     try
      DBGrid1.Enabled:=true;
      dm.tbcategoria.Post;
      application.MessageBox('Cadastro efetuado com sucesso!','Conclu�do',mb_ok);
      tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
          if (Components[i]is TDBedit)then  //verifica se os componentes s�o dbedits
            TDBEdit(Components[i]).Enabled:=false;
      except
      Application.MessageBox('Problemas ao cadastrar categoria!','Aten��o',mb_ok);
      dm.tbcategoria.Cancel;
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
   if (Components[i]is TDBedit)then  //verifica se os componentes s�o dbedits
    TDBEdit(Components[i]).Enabled:=false;
   if dm.tbcategoria.RecordCount >0 then
    begin
      tratabotao(3);
    end
   else
    begin
      tratabotao(1);
    end;
   end;
  end;
 end;
procedure Tfrmcadcategoria.btncancelarClick(Sender: TObject);
var
  i:integer;
begin
  DBGrid1.Enabled:=true;
  dm.tbcategoria.Cancel;
    if(dm.tbcategoria.recordcount>=1)then
      begin
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
          if (Components[i]is Tdbedit)then  //verifica se os componentes s�o dbedits
            begin
              TEdit(Components[i]).Enabled:=false;
            end
    end
    else
      begin
        tratabotao(1);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
          if (Components[i]is TDBedit)then  //verifica se os componentes s�o dbedits
            begin
              TDBEdit(Components[i]).Enabled:=false;

            end;
    end;
end;

procedure Tfrmcadcategoria.btnfecharClick(Sender: TObject);
begin
    frmcadcategoria.Close;
end;


procedure Tfrmcadcategoria.btnalterarClick(Sender: TObject);
var
  i:integer;
begin
   try
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
   if (Components[i]is TDBedit)then  //verifica se os componentes s�o dbedits
    TDBEdit(Components[i]).Enabled:=true;
    dm.tbcategoria.edit;
    edtcategoria.SetFocus;
    tratabotao(2);
    btnsalvar.Default:=True;
  except
  Application.MessageBox('Problemas ao alterar Categoria','Aten��o',mb_ok);
  end;
end;

procedure Tfrmcadcategoria.btnexcluirClick(Sender: TObject);
begin
  if (application.MessageBox('Voc� tem certeza que deseja excluir esta categoria?','Aten��o',mb_Iconquestion+Mb_yesno)=idyes)then
    begin
    try
      dm.tbcategoria.Delete;
      ShowMessage('Categoria Exclu�da com Sucesso!');
      if (dm.tbcategoria.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
    except
    dm.tbcategoria.Cancel;
  end;
end;
end;
procedure Tfrmcadcategoria.tratabotao(n: integer);
begin

  case n of
    1://Quando abre e executa o Form
      begin

        btnNovo.Enabled:=true;
        btnSalvar.Enabled:=false;
        btnCancelar.Enabled:=false;
        btnAlterar.Enabled:=false;
        btnExcluir.Enabled:=false;
        btnFechar.Enabled:=true;

      end;
    2://Quando clica em Novo
      begin

        btnNovo.Enabled:=false;
        btnSalvar.Enabled:=true;
        btnCancelar.Enabled:=true;
        btnAlterar.Enabled:=false;
        btnExcluir.Enabled:=false;
        btnFechar.Enabled:=false;

      end;

    3://Quando clica em Salvar
      begin

        btnNovo.Enabled:=true;
        btnSalvar.Enabled:=false;
        btnCancelar.Enabled:=false;
        btnAlterar.Enabled:=true;
        btnExcluir.Enabled:=true;
        btnFechar.Enabled:=true;

      end;

  end;

end;

procedure Tfrmcadcategoria.FormActivate(Sender: TObject);
var
  i:integer;
begin
     dm.tbcategoria.Active:=true;
  if (dm.tbcategoria.RecordCount>0)then
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
       if (Components[i]is Tedit)then  //verifica se os componentes s�o dbedits
       TDBEdit(Components[i]).Enabled:=false;
       tratabotao(3);
  end
  else
    begin
      Application.MessageBox('N�o h� nenhum registro de categoria','Aten��o',mb_ok+MB_ICONEXCLAMATION);
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
        if ((Components[i]is Tedit) or (Components[i]is TDBLookupComboBox))then  //verifica se os componentes s�o dbedits
      TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
      dm.tbcategoria.Active:=true;
      tratabotao(1);
  end;

end;

procedure Tfrmcadcategoria.FormClick(Sender: TObject);
begin
  frmcadcategoria.WindowState:=wsMaximized;
end;

procedure Tfrmcadcategoria.edtcategoriaClick(Sender: TObject);
begin
  edtcategoria.color:=clMoneyGreen;
end;

procedure Tfrmcadcategoria.edtcategoriaEnter(Sender: TObject);
begin
  edtcategoria.color:=clMoneyGreen;
end;

procedure Tfrmcadcategoria.edtcategoriaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  edtcategoria.color:=clMoneyGreen;
end;

procedure Tfrmcadcategoria.edtcategoriaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtcategoria.color:=clMoneyGreen;
end;

procedure Tfrmcadcategoria.edtcategoriaExit(Sender: TObject);
begin
  edtcategoria.color:=clWindow;
end;

procedure Tfrmcadcategoria.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  With Application
Do CanClose := MessageBox ( 'Deseja fechar o formul�rio de cadastro?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmcadcategoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var i:integer;
  begin
  while i <= Screen.FormCount - 1 do { Conta at� o �ltimo formul�rio da tela }
    begin
      if( Screen.Forms[i] = frmcadproduto) then
        begin
          frmcadproduto.cmb_categoria.Refresh;
          i := Screen.FormCount;
        end;
        Inc(i);
     end;
end;

end.
