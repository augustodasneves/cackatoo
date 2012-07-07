unit Ucadcliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, Mask, jpeg,
  ExtCtrls, DBCtrls, ADODB, ComCtrls;

type
  Tfrmcadcliente = class(TForm)
    DBGrid1: TDBGrid;
    ds_cliente: TDataSource;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnAlterar: TBitBtn;
    btnexcluir: TBitBtn;
    btncancelar: TBitBtn;
    btnFechar: TBitBtn;
    ds_bairro: TDataSource;
    GroupBox1: TGroupBox;
    Image1: TImage;
    lblnome: TLabel;
    lbl_rg: TLabel;
    lbl_data_nascimento: TLabel;
    edtnome: TDBEdit;
    edtrg: TDBEdit;
    chk_ativo: TDBCheckBox;
    edt_data_nascimento: TDBEdit;
    Label2: TLabel;
    lbl_ddd: TLabel;
    Label9: TLabel;
    lbl_cpf: TLabel;
    edttelefone: TDBEdit;
    rgpsexo: TDBRadioGroup;
    edtddd: TDBEdit;
    edt_cpf: TDBEdit;
    cmb_tipo_tel: TDBLookupComboBox;
    lbl_endereco: TLabel;
    lbl_numero: TLabel;
    lbl_bairro: TLabel;
    lbl_email: TLabel;
    edtendereco: TDBEdit;
    edtnumero: TDBEdit;
    cmb_bairro: TDBLookupComboBox;
    edt_email: TDBEdit;
    ds_tipo_tel: TDataSource;
    calendario_1: TMonthCalendar;
    btn_tipo_tel: TSpeedButton;
    btn_bairro: TSpeedButton;
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtrgKeyPress(Sender: TObject; var Key: Char);
    procedure edtdddKeyPress(Sender: TObject; var Key: Char);
    procedure edttelefoneKeyPress(Sender: TObject; var Key: Char);
    procedure edtnumeroKeyPress(Sender: TObject; var Key: Char);
    procedure edt_cpfKeyPress(Sender: TObject; var Key: Char);
    procedure btnexcluirClick(Sender: TObject);
    procedure edt_data_nascimentoEnter(Sender: TObject);
    procedure edt_data_nascimentoExit(Sender: TObject);
    procedure calendario_1Click(Sender: TObject);
    procedure edtnomeEnter(Sender: TObject);
    procedure edtnomeExit(Sender: TObject);
    procedure edtrgEnter(Sender: TObject);
    procedure edtrgExit(Sender: TObject);
    procedure edtdddEnter(Sender: TObject);
    procedure edtdddExit(Sender: TObject);
    procedure edttelefoneExit(Sender: TObject);
    procedure cmb_tipo_telEnter(Sender: TObject);
    procedure cmb_tipo_telExit(Sender: TObject);
    procedure edt_cpfExit(Sender: TObject);
    procedure edtenderecoEnter(Sender: TObject);
    procedure edtenderecoExit(Sender: TObject);
    procedure edtnumeroExit(Sender: TObject);
    procedure edtnumeroEnter(Sender: TObject);
    procedure cmb_bairroEnter(Sender: TObject);
    procedure cmb_bairroExit(Sender: TObject);
    procedure edt_emailEnter(Sender: TObject);
    procedure edt_emailExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnAlterarClick(Sender: TObject);
    procedure edttelefoneEnter(Sender: TObject);
    procedure edt_cpfEnter(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_tipo_telClick(Sender: TObject);
    procedure btn_bairroClick(Sender: TObject);



  private
    procedure tratabotao(n:integer);
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmcadcliente: Tfrmcadcliente;
implementation

uses Ufrmconscliente, UDM, Ucad_tipo_tel,Ucadbairro;

{$R *.dfm}


procedure Tfrmcadcliente.btnFecharClick(Sender: TObject);
begin
    frmcadcliente.Close;
end;

procedure Tfrmcadcliente.btnNovoClick(Sender: TObject);
var
  i:integer;
begin
   for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDbedit)or (Components[i] is TSpeedButton) or (Components[i] is TDBRadioGroup)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCombobox)or(Components[i] is TDBLookUpCombobox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=true;  //caso seja um dbedit, ele ativa
  tratabotao(2);
  edtnome.SetFocus;
  dm.tbcliente.Append;
  rgpsexo.ItemIndex:=0;
  DBGrid1.Enabled:=false;
  btnsalvar.Default:=true;
end;

procedure Tfrmcadcliente.tratabotao(n: integer);
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

procedure Tfrmcadcliente.btnSalvarClick(Sender: TObject);
var
  i:integer;
  nome:string;
  telefone:string;
  endereco:string;
  bairro:string;
  num:string;
  rg:string;
begin
  nome:=edtnome.text;
  rg:=edtrg.Text;
  telefone:=edttelefone.text;
  endereco:=edtendereco.text;
  num:=edtnumero.Text;
  bairro:=cmb_bairro.Text;
  if(nome ='')then
      begin
        if (Application.MessageBox('Informe o nome do cliente por Favor','Atenção',mb_ok+MB_ICONERROR)=1) then
          begin
            edtnome.SetFocus;
            DBGrid1.Enabled:=false;
          end;
      end
   else if(rg='')then
      begin
        if (Application.MessageBox('Informe o RG do Cliente por Favor','Atenção',mb_ok+MB_ICONERROR)=1) then
          begin
            edtrg.SetFocus;
            DBGrid1.Enabled:=false;
          end
      end
    else if(telefone='')then
      begin
        if (Application.MessageBox('Informe o telefone do cliente por Favor','Atenção',mb_ok+MB_ICONERROR)=1) then
          begin
            edttelefone.SetFocus;
            dbgrid1.Enabled:=false;
          end;
      end
    else if(endereco='')then
      begin
        if (Application.MessageBox('Informe o endereço do cliente por favor','Atenção',mb_ok+MB_ICONERROR)=1) then
          begin
            edtendereco.SetFocus;
            DBGrid1.Enabled:=false;
          end;
        end
    else if(num='')then
      begin
        if (Application.MessageBox('Informe o número por favor','Atenção',mb_ok+MB_ICONERROR)=1) then
          begin
            edtnumero.SetFocus;
          end;
      end
    else if(bairro='')then
      begin
        if (Application.MessageBox('Informe o Bairro do Cliente por Favor','Atenção',mb_ok+MB_ICONERROR)=1) then
          begin
            cmb_bairro.SetFocus;
          ;end
      end
      else
        begin
      try
        DBGrid1.Enabled:=true;
        dm.tbcliente.Post;
        application.MessageBox('Cadastro efetuado com sucesso!','Concluído',mb_ok);
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
            TDBEdit(Components[i]).Enabled:=false;
      except
        Application.MessageBox('Problemas ao cadastrar categoria!','Atenção',mb_ok);
         dm.tbcliente.Cancel;
         for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
         if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
         TDBEdit(Components[i]).Enabled:=false;
         if dm.tbcliente.RecordCount >0 then
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

procedure Tfrmcadcliente.btncancelarClick(Sender: TObject);
var
  i:integer;
begin
  DBGrid1.Enabled:=true;
  dm.tbcliente.Cancel;
    if(dm.tbcliente.recordcount>=1)then
      begin
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
            begin
              TEdit(Components[i]).Enabled:=false;
            end
    end
    else
      begin
        tratabotao(1);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
            begin
              TDBEdit(Components[i]).Enabled:=false;
            end;
    end;

end;

procedure Tfrmcadcliente.FormActivate(Sender: TObject);
var
  i:integer;
begin
  if (dm.tbcliente.RecordCount>0)then
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
       if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
       TDBEdit(Components[i]).Enabled:=false;
       tratabotao(3);
  end
  else
    begin
      Application.MessageBox('Não há nenhum registro de Clientes','Atenção',mb_ok+MB_ICONEXCLAMATION);
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
        if ((Components[i]is Tdbedit)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
      TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
      dm.tbcliente.Active:=true;
      tratabotao(1);
  end;

end;

procedure Tfrmcadcliente.edtrgKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;

procedure Tfrmcadcliente.edtdddKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;

procedure Tfrmcadcliente.edttelefoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;

procedure Tfrmcadcliente.edtnumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;

procedure Tfrmcadcliente.edt_cpfKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;

procedure Tfrmcadcliente.btnexcluirClick(Sender: TObject);
begin
  if (application.MessageBox('Você tem certeza que deseja excluir este cliente?','Atenção',mb_Iconquestion+Mb_yesno)=idyes)then
    begin
    try
      dm.tbcliente.Delete;
      ShowMessage('Cliente Excluído com Sucesso!');
      if (dm.tbfornecedor.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
    except
    dm.tbcliente.Cancel;
  end;
end;
end;

procedure Tfrmcadcliente.edt_data_nascimentoEnter(Sender: TObject);
begin
  calendario_1.Date:=Date;
  calendario_1.Visible:=true;
  edt_data_nascimento.Text:=DateToStr(calendario_1.Date);
  edt_data_nascimento.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.edt_data_nascimentoExit(Sender: TObject);
begin
  edt_data_nascimento.Color:=clWindow;
  calendario_1.Visible:=false;
end;

procedure Tfrmcadcliente.calendario_1Click(Sender: TObject);
begin
  if(edt_data_nascimento.Focused)then
    begin
      edt_data_nascimento.Text:=DateToStr(calendario_1.Date);
    end;
end;

procedure Tfrmcadcliente.edtnomeEnter(Sender: TObject);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.edtnomeExit(Sender: TObject);
begin
  edtnome.Color:=clWindow;
end;

procedure Tfrmcadcliente.edtrgEnter(Sender: TObject);
begin
  edtrg.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.edtrgExit(Sender: TObject);
begin
  edtrg.Color:=clWindow;
end;

procedure Tfrmcadcliente.edtdddEnter(Sender: TObject);
begin
  edtddd.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.edtdddExit(Sender: TObject);
begin
  edtddd.Color:=clWindow;
end;

procedure Tfrmcadcliente.edttelefoneExit(Sender: TObject);
begin
  edttelefone.Color:=clWindow;
end;


procedure Tfrmcadcliente.cmb_tipo_telEnter(Sender: TObject);
begin
  cmb_tipo_tel.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.cmb_tipo_telExit(Sender: TObject);
begin
  cmb_tipo_tel.Color:=clWindow;
end;

procedure Tfrmcadcliente.edt_cpfExit(Sender: TObject);
begin
  edt_cpf.Color:=clWindow;
end;


procedure Tfrmcadcliente.edtenderecoEnter(Sender: TObject);
begin
  edtendereco.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.edtenderecoExit(Sender: TObject);
begin
  edtendereco.Color:=clWindow;
end;

procedure Tfrmcadcliente.edtnumeroExit(Sender: TObject);
begin
  edtnumero.Color:=clWindow;
end;

procedure Tfrmcadcliente.edtnumeroEnter(Sender: TObject);
begin
  edtnumero.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.cmb_bairroEnter(Sender: TObject);
begin
  cmb_bairro.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.cmb_bairroExit(Sender: TObject);
begin
  cmb_bairro.Color:=clWindow;
end;

procedure Tfrmcadcliente.edt_emailEnter(Sender: TObject);
begin
  edt_email.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.edt_emailExit(Sender: TObject);
begin
  edt_email.Color:=clWindow;
end;

procedure Tfrmcadcliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário de cadastro?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmcadcliente.btnAlterarClick(Sender: TObject);
var i:integer;
begin
   try
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=true;
    dm.tbcliente.edit;
    edtnome.SetFocus;
    tratabotao(2);
    btnsalvar.Default:=True;
  except
  Application.MessageBox('Problemas ao alterar Cliente','Atenção',mb_ok);
  end;
end;

procedure Tfrmcadcliente.edttelefoneEnter(Sender: TObject);
begin
  edttelefone.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.edt_cpfEnter(Sender: TObject);
begin
  edt_cpf.Color:=clMoneyGreen;
end;

procedure Tfrmcadcliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i:integer;
begin
    i:=0;
  while i <= Screen.FormCount - 1 do { Conta até o último formulário da tela }
    begin
      if( Screen.Forms[i] = frmconscliente ) then
        begin
          frmconscliente.btnconsultar.Click;
          i := Screen.FormCount;
        end;
        Inc(i);
     end;
end;

procedure Tfrmcadcliente.btn_tipo_telClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcad_tipo_tel,frmcad_tipo_tel);
  frmcad_tipo_tel.ShowModal;
  frmcad_tipo_tel.Free;
end;

procedure Tfrmcadcliente.btn_bairroClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadbairro,frmcadbairro);
  frmcadbairro.ShowModal;
  frmcadbairro.Free;
end;

end.
