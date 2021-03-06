unit Ucad_faturamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, DB,
  ADODB, DBCtrls, Mask;

type
  Tfrmfaturamento = class(TForm)
    DBGrid1: TDBGrid;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnAlterar: TBitBtn;
    btnexcluir: TBitBtn;
    btncancelar: TBitBtn;
    btnFechar: TBitBtn;
    Image1: TImage;
    edt_data_inicial: TEdit;
    edt_data_final: TEdit;
    lbl_data_inicial: TLabel;
    lbl_data_final: TLabel;
    calendario_1: TMonthCalendar;
    cons_valores: TADOQuery;
    cmb_funcionario: TDBLookupComboBox;
    ds_funcionario: TDataSource;
    lbl_funcionario: TLabel;
    ds_rendimento: TDataSource;
    edt_observacoes: TDBEdit;
    lbl_observacoes: TLabel;
    cmb_mes: TDBComboBox;
    lbl_mes: TLabel;
    lbl_valor: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    ds_valores: TDataSource;
    cons_valoressumvalor: TBCDField;
    procedure edt_data_inicialEnter(Sender: TObject);
    procedure edt_data_finalExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure edt_data_inicialExit(Sender: TObject);
    procedure edt_data_finalEnter(Sender: TObject);
    procedure calendario_1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure tratabotao(n:integer);
  end;

var
  frmfaturamento: Tfrmfaturamento;

implementation

uses UDM;

{$R *.dfm}



procedure Tfrmfaturamento.edt_data_inicialEnter(Sender: TObject);
begin
  calendario_1.Date:=Date;
  calendario_1.Visible:=True;
  edt_data_inicial.Text:=DateToStr(calendario_1.Date);
  edt_data_inicial.Color:=clMoneyGreen;

end;

procedure Tfrmfaturamento.edt_data_finalExit(Sender: TObject);
begin
  if(edt_data_final.Text < edt_data_inicial.Text)then
    begin
      ShowMessage('A data final n�o pode ser menor que a data inicial!');
    end
  else if(edt_data_final.text = '')then
    begin
      ShowMessage('A Data final n�o pode ficar em branco!');
    end
  else if(edt_data_inicial.Text = '')then
    begin
      ShowMessage('A Data inicial n�o pode ficar em branco!');
    end
  else
    with cons_valores do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select sum(valor) from caixa where data_fechamento >= '+ QuotedStr(edt_data_inicial.Text)+ ' and data_fechamento <= ' + QuotedStr(edt_data_final.Text));
        Open;
      end;
      DBLookupComboBox1.ListFieldIndex:=0;
      ShowMessage(cons_valores.SQL.Text);
      calendario_1.Visible:=false;
  edt_data_final.Color:=clWindow;
  end;

procedure Tfrmfaturamento.btnNovoClick(Sender: TObject);
var i:integer;
begin
   DBGrid1.Enabled:=false;
  btnSalvar.Default:=true;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
   if ((Components[i]is TDBedit)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox)or(Components[i] is TEdit))then  //verifica se os componentes s�o dbedits
    TDBEdit(Components[i]).enabled:=true;  //caso seja um dbedit, ele ativa
  tratabotao(2);
  dm.tbrenda_mensal.Append;
end;

procedure Tfrmfaturamento.tratabotao(n: integer);
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

procedure Tfrmfaturamento.btnSalvarClick(Sender: TObject);
var i:integer;
begin
   try
        dm.tbrenda_mensal.post;
        Application.MessageBox('Cadastro efetuado com sucesso!','Conclu�do',mb_ok);
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
           if ((Components[i]is TDBedit)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox)or(Components[i] is TEdit))then  //verifica se os componentes s�o dbedits
              TDBEdit(Components[i]).Enabled:=false;
              DBGrid1.Enabled:=true;
     except
        dm.tbrenda_mensal.Cancel;
        DBGrid1.Enabled:=True;
        Application.MessageBox('Problemas ao cadastrar Rendimento Mensal','Aten��o',mb_ok);
    for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
   if ((Components[i]is TDBedit)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox)or(Components[i] is TEdit))then  //verifica se os componentes s�o dbedits
    TDBEdit(Components[i]).Enabled:=false;
   if dm.tbrenda_mensal.RecordCount >0 then
    begin
      tratabotao(3);
    end
   else
    begin
      tratabotao(1);
    end;
  end;
end;

procedure Tfrmfaturamento.btnAlterarClick(Sender: TObject);
var i:integer;
begin
   try
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
   if (Components[i]is TDBedit)then  //verifica se os componentes s�o dbedits
    TDBEdit(Components[i]).Enabled:=true;
    dm.tbrenda_mensal.edit;
    btnsalvar.Default:=True;
    tratabotao(2);
  except
  Application.MessageBox('Problemas ao alterar Faturamento','Aten��o',mb_ok);
  end;
end;

procedure Tfrmfaturamento.btnexcluirClick(Sender: TObject);
begin
   if (application.MessageBox('Voc� tem certeza que deseja excluir este registro de faturamento?','Aten��o',mb_Iconquestion+Mb_yesno)=idyes)then
    begin
    try
      dm.tbrenda_mensal.Delete;
      ShowMessage('Registro de Faturamento Exclu�do com Sucesso!');
      if (dm.tbrenda_mensal.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
    except
      dm.tbrenda_mensal.Cancel;
  end;
end;
end;

procedure Tfrmfaturamento.btncancelarClick(Sender: TObject);
var i:integer;
begin
   try
    begin
      DBGrid1.Enabled:=true;
      dm.tbrenda_mensal.Cancel;
      if(dm.tbrenda_mensal.recordcount>=1)then
        begin
          for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
            if ((Components[i]is Tdbedit)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBCheckBox)or (Components[i] is TDBLookupComboBox)or(Components[i] is TEdit))then  //verifica se os componentes s�o dbedits
              TDBEdit(Components[i]).Enabled:=false;
              tratabotao(3)
            end
          else
            begin
              for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
                if ((Components[i]is Tdbedit)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox)or(Components[i] is TEdit))then  //verifica se os componentes s�o dbedits
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

procedure Tfrmfaturamento.btnFecharClick(Sender: TObject);
begin
 frmfaturamento.Close;
end;

procedure Tfrmfaturamento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar o formul�rio de cadastro?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmfaturamento.FormActivate(Sender: TObject);
var i:integer;
begin
   dm.tbrenda_mensal.Active:=true;
    if (dm.tbrenda_mensal.RecordCount>0)then
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
       if ((Components[i]is Tdbedit)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox)or(Components[i] is TEdit))then  //verifica se os componentes s�o dbedits
       TDBEdit(Components[i]).Enabled:=false;
       tratabotao(3);
  end
  else
    begin
      Application.MessageBox('Voc� n�o tem nenhum registro de Faturamento','Aten��o',MB_OK+MB_ICONEXCLAMATION);
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos n�meros
        if ((Components[i]is Tdbedit)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox)or(Components[i] is TEdit))then  //verifica se os componentes s�o dbedits
      TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
      dm.tbrenda_mensal.Active:=true;
      tratabotao(1);
  end;
end;

procedure Tfrmfaturamento.edt_data_inicialExit(Sender: TObject);
begin
  edt_data_inicial.Color:=clWindow;
  calendario_1.Visible:=false;
end;

procedure Tfrmfaturamento.edt_data_finalEnter(Sender: TObject);
begin
  calendario_1.Date:=Date;
  calendario_1.Visible:=True;
  edt_data_final.Text:=DateToStr(calendario_1.Date);
  edt_data_final.Color:=clMoneyGreen;
end;



procedure Tfrmfaturamento.calendario_1Click(Sender: TObject);
begin
  if(edt_data_inicial.Focused)then
    begin
      edt_data_inicial.Text:=DatetoStr(calendario_1.Date);
    end
  else if(edt_data_final.Focused)then
    begin
      edt_data_final.Text:=DatetoStr(calendario_1.Date);
    end;
end;









end.
