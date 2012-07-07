unit Ucadretirada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DB, jpeg, ExtCtrls, Grids, DBGrids, ComCtrls,
  Mask, Buttons;

type
  Tfrmretirada = class(TForm)
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnAlterar: TBitBtn;
    btnexcluir: TBitBtn;
    btncancelar: TBitBtn;
    btnFechar: TBitBtn;
    GroupBox1: TGroupBox;
    lbl_valor: TLabel;
    lbl_data: TLabel;
    lbl_funcionario: TLabel;
    lbl_observacao: TLabel;
    btn_cadastra_funcionario: TSpeedButton;
    edt_valor: TDBEdit;
    edt_data: TDBEdit;
    cmb_funcionario: TDBLookupComboBox;
    calendario_1: TMonthCalendar;
    edt_observacao: TDBEdit;
    DBGrid1: TDBGrid;
    Image1: TImage;
    ds_retirada: TDataSource;
    ds_funcionario: TDataSource;
    lbl_motivo: TLabel;
    cmb_motivo: TDBComboBox;
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure btn_cadastra_funcionarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure tratabotao(n:integer);
    { Public declarations }
  end;

var
  frmretirada: Tfrmretirada;

implementation

uses UDM, Ufrmcadfuncionario;

{$R *.dfm}

procedure Tfrmretirada.btnNovoClick(Sender: TObject);
var i:integer;
begin
   DBGrid1.Enabled:=false;
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
            TdbEdit(Components[i]).Enabled:=true;
          tratabotao(2);
        edt_data.ReadOnly:=true;
        dm.tbretirada.Append;
        edt_valor.SetFocus;
end;

procedure Tfrmretirada.tratabotao(n: integer);
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

procedure Tfrmretirada.btnSalvarClick(Sender: TObject);
var i:integer;
begin
  try
        dm.tbretirada.post;
        Application.MessageBox('Cadastro efetuado com sucesso!','Concluído',mb_ok);
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
           if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
              TDBEdit(Components[i]).Enabled:=false;
              DBGrid1.Enabled:=true;
     except
        dm.tbretirada.Cancel;
        DBGrid1.Enabled:=True;
        Application.MessageBox('Problemas ao cadastrar Retirada','Atenção',mb_ok);
    for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
   if dm.tbretirada.RecordCount >0 then
    begin
      tratabotao(3);
    end
   else
    begin
      tratabotao(1);
    end;
  end;
end;

procedure Tfrmretirada.btnAlterarClick(Sender: TObject);
var i:integer;
begin
   DBGrid1.Enabled:=false;
   try
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
        if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
          TDBEdit(Components[i]).Enabled:=true;
        dm.tbretirada.edit;
        tratabotao(2);
  except
  Application.MessageBox('Problemas ao alterar Retirada','Atenção',mb_ok);
  end;
end;

procedure Tfrmretirada.btnexcluirClick(Sender: TObject);
begin
   if (application.MessageBox('Você tem certeza que deseja excluir este caixa?','Atenção',mb_Iconquestion+Mb_yesno)=idyes)then
  begin
    dm.tbretirada.Delete;
    ShowMessage('Retirada excluído com Sucesso!');
    if (dm.tbretirada.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
  end
  else
    dm.tbretirada.Cancel;
end;

procedure Tfrmretirada.btncancelarClick(Sender: TObject);
var i:integer;
begin
   try
    begin
      DBGrid1.Enabled:=true;
      dm.tbretirada.Cancel;
      if(dm.tbretirada.recordcount>=1)then
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

procedure Tfrmretirada.btnFecharClick(Sender: TObject);
begin
  frmretirada.Close;
end;

procedure Tfrmretirada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário de cadastro?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmretirada.FormActivate(Sender: TObject);
var i:integer;
begin
   dm.tbretirada.Active:=true;
  if (dm.tbretirada.RecordCount>0)then
  begin
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or(Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
    tratabotao(3);
  end
  else
  begin
    Application.MessageBox('Você não tem nenhum registro de retiradas','Atenção',mb_ok+MB_ICONEXCLAMATION);
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or(Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
    tratabotao(1);
  end;
end;

procedure Tfrmretirada.btn_cadastra_funcionarioClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadfuncionarios,frmcadfuncionarios);
  frmcadfuncionarios.ShowModal;
  frmcadfuncionarios.Free;
end;

end.
