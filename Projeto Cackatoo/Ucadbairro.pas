unit Ucadbairro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, jpeg, ExtCtrls, Mask,
  DBCtrls;

type
  Tfrmcadbairro = class(TForm)
    Image1: TImage;
    btnnovo: TBitBtn;
    btnsalvar: TBitBtn;
    btnalterar: TBitBtn;
    btnexcluir: TBitBtn;
    btncancelar: TBitBtn;
    btnfechar: TBitBtn;
    DBGrid1: TDBGrid;
    ds_bairro: TDataSource;
    ds_cidade: TDataSource;
    gp_cadastro: TGroupBox;
    lbl_nome: TLabel;
    lbl_valor_entrega: TLabel;
    lbl_cidade: TLabel;
    edt_nome: TDBEdit;
    edt_valor: TDBEdit;
    cmb_cidade: TDBLookupComboBox;
    btn_cidade: TSpeedButton;
    procedure tratabotao(n:integer);
    procedure btnnovoClick(Sender: TObject);
    procedure btnsalvarClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure edt_nomeEnter(Sender: TObject);
    procedure edt_nomeExit(Sender: TObject);
    procedure edt_valorEnter(Sender: TObject);
    procedure edt_valorExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cidadeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadbairro: Tfrmcadbairro;

implementation

uses UDM,Ucadcliente,Ucadcidade, Ucadfornecedor;

{$R *.dfm}

procedure Tfrmcadbairro.btnnovoClick(Sender: TObject);
var i:integer;
begin
    DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes s�o dbedits
   TdbEdit(Components[i]).Enabled:=true;
  tratabotao(2);
  dm.tbbairro.Append;
  edt_nome.SetFocus;
  btnsalvar.Default:=true;
end;

procedure Tfrmcadbairro.tratabotao(n: integer);
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

procedure Tfrmcadbairro.btnsalvarClick(Sender: TObject);
var i:integer;
begin
   try
        dm.tbbairro.post;
        Application.MessageBox('Cadastro efetuado com sucesso!','Conclu�do',mb_ok);
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
           if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes s�o dbedits
              TDBEdit(Components[i]).Enabled:=false;
              DBGrid1.Enabled:=true;
     except
        dm.tbbairro.Cancel;
        DBGrid1.Enabled:=True;
        Application.MessageBox('Problemas ao cadastrar produto','Aten��o',mb_ok);
    for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes s�o dbedits
    TDBEdit(Components[i]).Enabled:=false;
   if dm.tbbairro.RecordCount >0 then
    begin
      tratabotao(3);
    end
   else
    begin
      tratabotao(1);
    end;
  end;
end;

procedure Tfrmcadbairro.btnalterarClick(Sender: TObject);
var i:integer;
begin
   try
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes s�o dbedits
    TDBEdit(Components[i]).Enabled:=true;
    dm.tbbairro.edit;
    btnsalvar.Default:=True;
    tratabotao(2);
  except
  Application.MessageBox('Problemas ao alterar Bairro','Aten��o',mb_ok);
  end;
end;

procedure Tfrmcadbairro.btnexcluirClick(Sender: TObject);
begin
  if (application.MessageBox('Voc� tem certeza que deseja excluir este Bairro?','Aten��o',mb_Iconquestion+Mb_yesno)=idyes)then
    begin
    try
      dm.tbbairro.Delete;
      ShowMessage('Bairro Exclu�do com Sucesso!');
      if (dm.tbbairro.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
    except
      dm.tbbairro.Cancel;
  end;
end;
end;

procedure Tfrmcadbairro.btncancelarClick(Sender: TObject);
var i:integer;
begin
    try
    begin
      DBGrid1.Enabled:=true;
      dm.tbbairro.Cancel;
      if(dm.tbbairro.recordcount>=1)then
        begin
          for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
            if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBCheckBox)or (Components[i] is TDBLookupComboBox))then  //verifica se os componentes s�o dbedits
              TDBEdit(Components[i]).Enabled:=false;
              tratabotao(3)
            end
          else
            begin
              for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
                if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes s�o dbedits
                  TDBEdit(Components[i]).Enabled:=false;
                  tratabotao(1);
                end;
            end
    except
      begin
        Application.MessageBox('N�o foi poss�vel cancelar!','Aten��o',MB_ICONEXCLAMATION);
      end;
end;
end;

procedure Tfrmcadbairro.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar o formul�rio de cadastro?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmcadbairro.FormActivate(Sender: TObject);
var i:integer;
begin
    dm.tbbairro.Active:=true;
    if (dm.tbbairro.RecordCount>0)then
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
       if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes s�o dbedits
       TDBEdit(Components[i]).Enabled:=false;
       tratabotao(3);
  end
  else
    begin
      Application.MessageBox('Voc� n�o tem nenhum registro de bairros','Aten��o',MB_OK+MB_ICONEXCLAMATION);
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
        if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes s�o dbedits
      TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
      dm.tbbairro.Active:=true;
      tratabotao(1);
  end;
end;

procedure Tfrmcadbairro.btnfecharClick(Sender: TObject);
begin
  frmcadbairro.Close;
end;

procedure Tfrmcadbairro.edt_nomeEnter(Sender: TObject);
begin
  edt_nome.Color:=clMoneyGreen;
end;

procedure Tfrmcadbairro.edt_nomeExit(Sender: TObject);
begin
  edt_nome.Color:=clWindow;
end;

procedure Tfrmcadbairro.edt_valorEnter(Sender: TObject);
begin
  edt_valor.Color:=clMoneyGreen;
end;

procedure Tfrmcadbairro.edt_valorExit(Sender: TObject);
begin
  edt_valor.Color:=clWindow;
end;

procedure Tfrmcadbairro.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i:integer;
begin
    i:=0;
  while i <= Screen.FormCount - 1 do { Conta at� o �ltimo formul�rio da tela }
    begin
      if( Screen.Forms[i] = frmcadcliente ) then
        begin
          frmcadcliente.cmb_bairro.Refresh;
          i := Screen.FormCount;
        end;
        Inc(i);
     end;

  while i <= Screen.FormCount - 1 do { Conta at� o �ltimo formul�rio da tela }
    begin
      if( Screen.Forms[i] = frmcadfornecedores ) then
        begin
          frmcadfornecedores.cmb_bairro.Refresh;
          i := Screen.FormCount;
        end;
        Inc(i);
     end;
end;

procedure Tfrmcadbairro.btn_cidadeClick(Sender: TObject);
begin
   Application.CreateForm(Tfrmcadcidade, frmcadcidade);
   frmcadcidade.ShowModal;
   frmcadcidade.Free;
end;

end.
