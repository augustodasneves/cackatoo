unit Ucaduf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, jpeg, ExtCtrls, DB, Mask,
  DBCtrls;

type
  Tfrmcaduf = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    btnnovo: TBitBtn;
    btnsalvar: TBitBtn;
    btnalterar: TBitBtn;
    btnexcluir: TBitBtn;
    btnfechar: TBitBtn;
    btncancelar: TBitBtn;
    ds_uf: TDataSource;
    lbl_nome: TLabel;
    edt_nome: TDBEdit;
    lbl_sigla: TLabel;
    edt_sigla: TDBEdit;
    procedure tratabotao(n:integer);
    procedure btnnovoClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btnsalvarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnfecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcaduf: Tfrmcaduf;

implementation

uses UDM,Ucadcidade;

{$R *.dfm}

procedure Tfrmcaduf.btnnovoClick(Sender: TObject);
var i:integer;
begin
   DBGrid1.Enabled:=false;
  btnSalvar.Default:=true;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).enabled:=true;  //caso seja um dbedit, ele ativa
  tratabotao(2);
  dm.tbuf.Append;
  edt_nome.SetFocus;
end;

procedure Tfrmcaduf.tratabotao(n: integer);
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



procedure Tfrmcaduf.btnalterarClick(Sender: TObject);
var i:integer;
begin
   try
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=true;
    dm.tbuf.edit;
    btnsalvar.Default:=True;
    tratabotao(2);
  except
  Application.MessageBox('Problemas ao alterar UF','Atenção',mb_ok);
  end;
end;

procedure Tfrmcaduf.btnexcluirClick(Sender: TObject);
begin
  if (application.MessageBox('Você tem certeza que deseja excluir esta UF?','Atenção',mb_Iconquestion+Mb_yesno)=idyes)then
    begin
    try
      dm.tbuf.Delete;
      ShowMessage('UF Excluída com Sucesso!');
      if (dm.tbuf.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
    except
      dm.tbuf.Cancel;
  end;
end;
end;

procedure Tfrmcaduf.btnsalvarClick(Sender: TObject);
var i:integer;
begin
   try
        dm.tbuf.post;
        Application.MessageBox('Cadastro efetuado com sucesso!','Concluído',mb_ok);
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
           if ((Components[i]is TDBedit)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
              TDBEdit(Components[i]).Enabled:=false;
              DBGrid1.Enabled:=true;
     except
        dm.tbuf.Cancel;
        DBGrid1.Enabled:=True;
        Application.MessageBox('Problemas ao cadastrar produto','Atenção',mb_ok);
    for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
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

procedure Tfrmcaduf.btncancelarClick(Sender: TObject);
var i:integer;
begin
    try
    begin
      DBGrid1.Enabled:=true;
      dm.tbuf.Cancel;
      if(dm.tbuf.recordcount>=1)then
        begin
          for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
            if ((Components[i]is Tdbedit)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBCheckBox)or (Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
              TDBEdit(Components[i]).Enabled:=false;
              tratabotao(3)
            end
          else
            begin
              for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
                if ((Components[i]is Tdbedit)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
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

procedure Tfrmcaduf.FormActivate(Sender: TObject);
var i:integer;
begin
   dm.tbuf.Active:=true;
    if (dm.tbuf.RecordCount>0)then
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
       if ((Components[i]is Tdbedit)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
       TDBEdit(Components[i]).Enabled:=false;
       tratabotao(3);
  end
  else
    begin
      Application.MessageBox('Você não tem nenhum registro de caixa','Atenção',MB_OK+MB_ICONEXCLAMATION);
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
        if ((Components[i]is Tdbedit)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
      TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
      dm.tbuf.Active:=true;
      tratabotao(1);
  end;
end;

procedure Tfrmcaduf.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário de cadastro?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmcaduf.btnfecharClick(Sender: TObject);
begin
  frmcaduf.Close;
end;

procedure Tfrmcaduf.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
   i:=0;
  while i <= Screen.FormCount - 1 do { Conta até o último formulário da tela }
    begin
      if( Screen.Forms[i] = frmcadcidade ) then
        begin
          frmcadcidade.cmb_uf.Refresh;
          i := Screen.FormCount;
        end;
        Inc(i);
     end;
end;

end.
