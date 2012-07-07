unit Ucaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DB, Mask,
  DBCtrls, ComCtrls, TabNotBk;

type
  Tfrmcaixa = class(TForm)
    Image1: TImage;
    ds_funcionario: TDataSource;
    ds_caixa: TDataSource;
    GroupBox1: TGroupBox;
    lbl_valor: TLabel;
    lbl_data: TLabel;
    lbl_funcionario: TLabel;
    edt_observacao: TLabel;
    btn_cadastra_funcionario: TSpeedButton;
    edt_valor: TDBEdit;
    edt_data: TDBEdit;
    cmb_funcionario: TDBLookupComboBox;
    calendario_1: TMonthCalendar;
    edt_obs: TDBEdit;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnAlterar: TBitBtn;
    btnexcluir: TBitBtn;
    btncancelar: TBitBtn;
    btnFechar: TBitBtn;
    DBGrid1: TDBGrid;
    procedure edt_dataEnter(Sender: TObject);
    procedure calendario_1Click(Sender: TObject);
    procedure edt_dataExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tratabotao(n:integer);
    procedure btnNovoClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btn_cadastra_funcionarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcaixa: Tfrmcaixa;

implementation

uses UDM,Ufrmcadfuncionario;

{$R *.dfm}



procedure Tfrmcaixa.edt_dataEnter(Sender: TObject);
begin

      calendario_1.Date:=Date;
      calendario_1.Visible:=true;
      edt_data.Text:=DateToStr(calendario_1.Date);
      edt_data.Color:=clMoneyGreen;

end;

procedure Tfrmcaixa.calendario_1Click(Sender: TObject);
begin
  if(edt_data.Focused)then
    begin
      edt_data.Text:=DateToStr(calendario_1.date);
    end
end;

procedure Tfrmcaixa.edt_dataExit(Sender: TObject);
begin

      calendario_1.Visible:=false;
      edt_data.Color:=clWindow;
    
end;



procedure Tfrmcaixa.FormActivate(Sender: TObject);
var i:integer;
begin

      dm.tbcaixa.Active:=true;
      if (dm.tbcaixa.RecordCount>0)then
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
              dm.tbcaixa.Active:=true;
              tratabotao(1);
            end;




end;

procedure Tfrmcaixa.tratabotao(n: integer);
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

procedure Tfrmcaixa.btnNovoClick(Sender: TObject);
var i:integer;
begin
      DBGrid1.Enabled:=false;
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
            TdbEdit(Components[i]).Enabled:=true;
          tratabotao(2);
        if(Application.MessageBox('O caixa pertence a data atual?','Atenção',MB_YESNO+MB_ICONQUESTION) = idyes)then
          begin
            edt_data.Text:=DateToStr(Date);
            edt_data.ReadOnly:=true;
          end;
        dm.tbcaixa.Append;
        edt_valor.SetFocus;

end;

procedure Tfrmcaixa.btncancelarClick(Sender: TObject);
var i:integer;
begin
   try
    begin
      DBGrid1.Enabled:=true;
      dm.tbcaixa.Cancel;
      if(dm.tbcaixa.recordcount>=1)then
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

procedure Tfrmcaixa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário do caixa?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmcaixa.btnFecharClick(Sender: TObject);
begin
  frmcaixa.Close;
end;

procedure Tfrmcaixa.btnAlterarClick(Sender: TObject);
var i:Integer;
begin
   DBGrid1.Enabled:=false;
   try
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
        if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
          TDBEdit(Components[i]).Enabled:=true;
        dm.tbcaixa.edit;
        tratabotao(2);
  except
  Application.MessageBox('Problemas ao alterar Caixa','Atenção',mb_ok);
  end;
end;

procedure Tfrmcaixa.btnSalvarClick(Sender: TObject);
var i:integer;
begin
   try
        dm.tbcaixa.post;
        Application.MessageBox('Cadastro efetuado com sucesso!','Concluído',mb_ok);
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
           if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
              TDBEdit(Components[i]).Enabled:=false;
              DBGrid1.Enabled:=true;
     except
        dm.tbcaixa.Cancel;
        DBGrid1.Enabled:=True;
        Application.MessageBox('Problemas ao cadastrar Caixa','Atenção',mb_ok);
    for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
   if dm.tbusuario.RecordCount >0 then
    begin
      tratabotao(3);
    end
   else
    begin
      tratabotao(1);
    end;
  end;
 end;

procedure Tfrmcaixa.btnexcluirClick(Sender: TObject);
begin
   if (application.MessageBox('Você tem certeza que deseja excluir este caixa?','Atenção',mb_Iconquestion+Mb_yesno)=idyes)then
  begin
    dm.tbcaixa.Delete;
    ShowMessage('Caixa excluído com Sucesso!');
    if (dm.tbcaixa.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
  end
  else
    dm.tbcaixa.Cancel;
end;



procedure Tfrmcaixa.btn_cadastra_funcionarioClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadfuncionarios,frmcadfuncionarios);
  frmcadfuncionarios.ShowModal;
  frmcadfuncionarios.Free;
end;



end.
