unit Ucadcidade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls, Grids, DBGrids, DBCtrls, DB,
  Mask, ADODB;

type
  Tfrmcadcidade = class(TForm)
    DBGrid1: TDBGrid;
    Image1: TImage;
    btnnovo: TBitBtn;
    btnsalvar: TBitBtn;
    btnalterar: TBitBtn;
    btnexcluir: TBitBtn;
    btncancelar: TBitBtn;
    btnfechar: TBitBtn;
    ds_cidade: TDataSource;
    ds_uf: TDataSource;
    gp_cadastro: TGroupBox;
    lbl_nome: TLabel;
    lbl_uf: TLabel;
    edt_nome: TDBEdit;
    cmb_uf: TDBLookupComboBox;
    btn_cadastra_uf: TSpeedButton;
    procedure btnnovoClick(Sender: TObject);
    procedure tratabotao(n:integer);
    procedure btnsalvarClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure edt_nomeEnter(Sender: TObject);
    procedure edt_nomeExit(Sender: TObject);
    procedure cmb_ufEnter(Sender: TObject);
    procedure cmb_ufExit(Sender: TObject);
    procedure btn_cadastra_ufClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadcidade: Tfrmcadcidade;

implementation

uses UDM,Ucaduf;

{$R *.dfm}

procedure Tfrmcadcidade.btnnovoClick(Sender: TObject);
var i:integer;
begin
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox)or(Components[i] is TButton))then  //verifica se os componentes são dbedits
   TdbEdit(Components[i]).Enabled:=true;
  tratabotao(2);
  dm.tbcidade.Append;
  edt_nome.SetFocus;
  btnsalvar.Default:=true;
end;

procedure Tfrmcadcidade.tratabotao(n: integer);
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

procedure Tfrmcadcidade.btnsalvarClick(Sender: TObject);
var i:integer;
begin
   try
        dm.tbcidade.post;
        Application.MessageBox('Cadastro efetuado com sucesso!','Concluído',mb_ok);
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
           if ((Components[i]is TDBedit)or(Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
              TDBEdit(Components[i]).Enabled:=false;
              DBGrid1.Enabled:=true;
     except
        dm.tbcidade.Cancel;
        DBGrid1.Enabled:=True;
        Application.MessageBox('Problemas ao cadastrar produto','Atenção',mb_ok);
    for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
   if dm.tbuf.RecordCount >0 then
    begin
      tratabotao(3);
    end
   else
    begin
      tratabotao(1);
    end;
  end;
end;

procedure Tfrmcadcidade.btnalterarClick(Sender: TObject);
var i:integer;
begin
   try
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=true;
    dm.tbcidade.edit;
    btnsalvar.Default:=True;
    tratabotao(2);
  except
  Application.MessageBox('Problemas ao alterar Cidade','Atenção',mb_ok);
  end;
end;

procedure Tfrmcadcidade.btnexcluirClick(Sender: TObject);
begin
   if (application.MessageBox('Você tem certeza que deseja excluir esta Cidade?','Atenção',mb_Iconquestion+Mb_yesno)=idyes)then
    begin
    try
      dm.tbcidade.Delete;
      ShowMessage('Cidade Excluída com Sucesso!');
      if (dm.tbcidade.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
    except
      dm.tbcidade.Cancel;
  end;
end;
end;

procedure Tfrmcadcidade.btncancelarClick(Sender: TObject);
var i:integer;
begin
   try
    begin
      DBGrid1.Enabled:=true;
      dm.tbcidade.Cancel;
      if(dm.tbcidade.recordcount>=1)then
        begin
          for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
            if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBCheckBox)or (Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
              TDBEdit(Components[i]).Enabled:=false;
              tratabotao(3)
            end
          else
            begin
              for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
                if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
                  TDBEdit(Components[i]).Enabled:=false;
                  tratabotao(1);
                end;
            end
    except
      begin
        Application.MessageBox('Não foi possível cancelar!','Atenção',MB_ICONEXCLAMATION);
      end;
end;
end;

procedure Tfrmcadcidade.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário de cadastro?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmcadcidade.FormActivate(Sender: TObject);
var i:integer;
begin
    dm.tbcidade.Active:=true;
    if (dm.tbcidade.RecordCount>0)then
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
       if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
       TDBEdit(Components[i]).Enabled:=false;
       tratabotao(3);
  end
  else
    begin
      Application.MessageBox('Você não tem nenhum registro de caixa','Atenção',MB_OK+MB_ICONEXCLAMATION);
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
        if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
      TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
      dm.tbcidade.Active:=true;
      tratabotao(1);
  end;
end;

procedure Tfrmcadcidade.btnfecharClick(Sender: TObject);
begin
  frmcadcidade.Close;
end;





procedure Tfrmcadcidade.edt_nomeEnter(Sender: TObject);
begin
  edt_nome.Color:=clMoneyGreen;
end;

procedure Tfrmcadcidade.edt_nomeExit(Sender: TObject);
begin
  edt_nome.Color:=clWindow;
end;

procedure Tfrmcadcidade.cmb_ufEnter(Sender: TObject);
begin
  cmb_uf.Color:=clMoneyGreen;
end;

procedure Tfrmcadcidade.cmb_ufExit(Sender: TObject);
begin
  cmb_uf.Color:=clWindow;
end;

procedure Tfrmcadcidade.btn_cadastra_ufClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcaduf,frmcaduf);
  frmcaduf.showmodal;
  frmcaduf.free;
end;

end.
