unit Ulista_telefonica;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, DB, ADODB, Grids, DBGrids, Buttons;

type
  Tfrmlista_telefonica = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    ds_clientes: TDataSource;
    ds_fornecedores: TDataSource;
    ds_funcionarios: TDataSource;
    ds_lista_telefonica: TDataSource;
    cons_clientes: TADOQuery;
    cons_fornecedores: TADOQuery;
    cons_funcionarios: TADOQuery;
    Label1: TLabel;
    edt_ddd: TDBEdit;
    Label2: TLabel;
    edt_telefone: TDBEdit;
    Label3: TLabel;
    edt_nome: TDBEdit;
    cmb_tipo_tel: TDBLookupComboBox;
    ds_tipo_tel: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnSalvar: TBitBtn;
    btncancelar: TBitBtn;
    btnFechar: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnexcluir: TBitBtn;
    cons_clientesnome_cliente: TStringField;
    cons_clientesddd: TStringField;
    cons_clientestelefone: TStringField;
    cons_clientesnome_tipo: TStringField;
    cons_fornecedoresnome_fantasia: TStringField;
    cons_fornecedorestelefone_forn: TStringField;
    cons_fornecedoresddd: TStringField;
    cons_fornecedoresnome_tipo: TStringField;
    cons_funcionariosnome_funcionario: TStringField;
    cons_funcionariosddd: TStringField;
    cons_funcionariostelefone: TStringField;
    cons_funcionariosnome_tipo: TStringField;
    procedure tratabotao(n:integer);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmlista_telefonica: Tfrmlista_telefonica;
implementation

uses UDM;

{$R *.dfm}

procedure Tfrmlista_telefonica.btnFecharClick(Sender: TObject);
begin
  frmlista_telefonica.Close;
end;

procedure Tfrmlista_telefonica.btnNovoClick(Sender: TObject);
var i:integer;
begin
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
   TdbEdit(Components[i]).Enabled:=true;
  tratabotao(2);
  edt_nome.SetFocus;
  dm.tblista_telefonica.Append;
  btnsalvar.Default:=true;
end;

procedure Tfrmlista_telefonica.tratabotao(n: integer);
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

procedure Tfrmlista_telefonica.btncancelarClick(Sender: TObject);
var i:integer;
begin
     DBGrid1.Enabled:=true;
  dm.tblista_telefonica.Cancel;
    if(dm.tblista_telefonica.recordcount>=1)then
      begin
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is TDBedit)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
            begin
              TEdit(Components[i]).Enabled:=false;
            end
    end
    else
      begin
        tratabotao(1);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is TDBedit)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
            begin
              TDBEdit(Components[i]).Enabled:=false;
            end;
    end;
end;

procedure Tfrmlista_telefonica.btnSalvarClick(Sender: TObject);
var i:integer;
begin
    try
      DBGrid1.Enabled:=true;
      dm.tblista_telefonica.Post;
      application.MessageBox('Cadastro efetuado com sucesso!','Concluído',mb_ok);
      tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
            TDBEdit(Components[i]).Enabled:=false;
      except
      Application.MessageBox('Problemas ao cadastrar!','Atenção',mb_ok);
      dm.tblista_telefonica.Cancel;
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
   if dm.tblista_telefonica.RecordCount >0 then
    begin
      tratabotao(3);
    end
   else
    begin
      tratabotao(1);
    end;
   end;
end;

procedure Tfrmlista_telefonica.btnAlterarClick(Sender: TObject);
var i:integer;
begin
   try
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=true;
    dm.tblista_telefonica.edit;
    btnsalvar.Default:=True;
    edt_nome.SetFocus;
    tratabotao(2);
  except
  Application.MessageBox('Problemas ao alterar Contato','Atenção',mb_ok);
  end;
end;

procedure Tfrmlista_telefonica.btnexcluirClick(Sender: TObject);
begin
  if (application.MessageBox('Você tem certeza que deseja excluir este produto?','Atenção',mb_Iconquestion+Mb_yesno)=idyes)then
    begin
    try
      dm.tblista_telefonica.Delete;
      ShowMessage('Funcionário Excluída com Sucesso!');
      if (dm.tblista_telefonica.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
    except
      dm.tblista_telefonica.Cancel;
  end;
end;
end;

procedure Tfrmlista_telefonica.FormActivate(Sender: TObject);
var i:integer;
begin
  if (dm.tblista_telefonica.RecordCount>0)then
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
       if ((Components[i]is Tdbedit)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
       TDBEdit(Components[i]).Enabled:=false;
       tratabotao(3);
  end
  else
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
        if ((Components[i]is TDBedit)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
      TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
      dm.tblista_telefonica.Active:=true;
      tratabotao(1);
  end;
end;



procedure Tfrmlista_telefonica.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar a lista telefônica?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

end.
