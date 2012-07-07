unit Ucad_tipo_tel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls, jpeg, ExtCtrls,
  DB;

type
  Tfrmcad_tipo_tel = class(TForm)
    Image1: TImage;
    gp_cadastro: TGroupBox;
    Label1: TLabel;
    edt_tipo_tel: TDBEdit;
    btnnovo: TBitBtn;
    btnsalvar: TBitBtn;
    btnalterar: TBitBtn;
    btnexcluir: TBitBtn;
    btncancelar: TBitBtn;
    btnfechar: TBitBtn;
    DBGrid1: TDBGrid;
    ds_tipo_tel: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btnsalvarClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnfecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure tratabotao(n:integer);
  end;

var
  frmcad_tipo_tel: Tfrmcad_tipo_tel;

implementation

uses UDM, Ucadfornecedor, Ufrmcadfuncionario;

{$R *.dfm}

procedure Tfrmcad_tipo_tel.FormActivate(Sender: TObject);
var i:integer;
begin
     dm.tbtipo_telefone.Active:=true;
  if (dm.tbtipo_telefone.RecordCount>0)then
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
       if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
       TDBEdit(Components[i]).Enabled:=false;
       tratabotao(3);
  end
  else
    begin
      Application.MessageBox('Não há nenhum registro de Tipos de telefone','Atenção',mb_ok+MB_ICONEXCLAMATION);
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
        if ((Components[i]is Tedit) or (Components[i]is TDBLookupComboBox))then  //verifica se os componentes são dbedits
      TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
      dm.tbtipo_telefone.Active:=true;
      tratabotao(1);
  end;

end;

procedure Tfrmcad_tipo_tel.tratabotao(n: integer);
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

procedure Tfrmcad_tipo_tel.btnnovoClick(Sender: TObject);
var i:integer;
begin
   DBGrid1.Enabled:=false;
  btnsalvar.Default:=true;
   for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=true;  //caso seja um dbedit, ele ativa
  tratabotao(2);
  edt_tipo_tel.SetFocus;
  dm.tbtipo_telefone.Append;
end;

procedure Tfrmcad_tipo_tel.btnsalvarClick(Sender: TObject);
var i:integer;
begin
   try
      DBGrid1.Enabled:=true;
      dm.tbtipo_telefone.Post;
      application.MessageBox('Cadastro efetuado com sucesso!','Concluído',mb_ok);
      tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
            TDBEdit(Components[i]).Enabled:=false;
      except
      Application.MessageBox('Problemas ao cadastrar categoria!','Atenção',mb_ok);
      dm.tbtipo_telefone.Cancel;
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
   if dm.tbtipo_telefone.RecordCount >0 then
    begin
      tratabotao(3);
    end
   else
    begin
      tratabotao(1);
    end;
   end;
  end;

procedure Tfrmcad_tipo_tel.btnalterarClick(Sender: TObject);
var i:integer;
begin
    try
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=true;
    dm.tbtipo_telefone.edit;
    edt_tipo_tel.SetFocus;
    tratabotao(2);
    btnsalvar.Default:=True;
  except
  Application.MessageBox('Problemas ao alterar Tipo de Telefone','Atenção',mb_ok);
  end;
end;

procedure Tfrmcad_tipo_tel.btnexcluirClick(Sender: TObject);
begin
  if (application.MessageBox('Você tem certeza que deseja excluir este tipo de telefone?','Atenção',mb_Iconquestion+Mb_yesno)=idyes)then
    begin
    try
      dm.tbtipo_telefone.Delete;
      ShowMessage('Tipo de Telefone Excluído com Sucesso!');
      if (dm.tbtipo_telefone.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
    except
    dm.tbtipo_telefone.Cancel;
  end;
end;
end;

procedure Tfrmcad_tipo_tel.btncancelarClick(Sender: TObject);
var i:integer;
begin
  DBGrid1.Enabled:=true;
  dm.tbtipo_telefone.Cancel;
    if(dm.tbtipo_telefone.recordcount>=1)then
      begin
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if (Components[i]is Tdbedit)then  //verifica se os componentes são dbedits
            begin
              TEdit(Components[i]).Enabled:=false;
            end
    end
    else
      begin
        tratabotao(1);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
            begin
              TDBEdit(Components[i]).Enabled:=false;
            end;
    end;
end;

procedure Tfrmcad_tipo_tel.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário de cadastro?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmcad_tipo_tel.btnfecharClick(Sender: TObject);
begin
  frmcad_tipo_tel.Close;
end;

procedure Tfrmcad_tipo_tel.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i:integer;
  begin
    i:=0;
  while i <= Screen.FormCount - 1 do { Conta até o último formulário da tela }
    begin
      if( Screen.Forms[i] = frmcadfornecedores ) then
        begin
          frmcadfornecedores.cmb_tipo_telefone.Refresh;
          i := Screen.FormCount;
        end;
        Inc(i);
     end;

  while i <= Screen.FormCount - 1 do { Conta até o último formulário da tela }
    begin
      if( Screen.Forms[i] = frmcadfuncionarios ) then
        begin
          frmcadfuncionarios.cmb_tipo_telefone.Refresh;
          i := Screen.FormCount;
        end;
        Inc(i);
     end;
end;

end.
