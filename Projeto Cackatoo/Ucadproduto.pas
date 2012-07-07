unit Ucadproduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, DBCtrls, ComCtrls, Buttons, Mask,
  jpeg, ExtCtrls;

type
  Tfrmcadproduto = class(TForm)
    btnSalvar: TBitBtn;
    btncancelar: TBitBtn;
    btnFechar: TBitBtn;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnexcluir: TBitBtn;
    ds_produto: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    lbl_nome: TLabel;
    lbl_marca: TLabel;
    lbl_valor_venda: TLabel;
    lbl_nome_fornecedor: TLabel;
    lbl_categoria: TLabel;
    Image1: TImage;
    lbl_valor_compra: TLabel;
    lbl_qtd: TLabel;
    lbl_unidade_medida: TLabel;
    lbl_observacao: TLabel;
    lbl_funcionario: TLabel;
    lblprazo_validade: TLabel;
    lbl_estoque_minimo: TLabel;
    lbl_cor: TLabel;
    edt_nome: TDBEdit;
    edt_marca: TDBEdit;
    edt_valor_venda: TDBEdit;
    edt_valor_fornecedor: TDBEdit;
    edt_qtd: TDBEdit;
    cmb_unidade_medida: TDBComboBox;
    cmb_funcionario: TDBLookupComboBox;
    edt_observacao: TDBEdit;
    chk_perecivel: TDBCheckBox;
    edt_prazo_validade: TDBEdit;
    cmb_fornecedor: TDBLookupComboBox;
    cmb_categoria: TDBLookupComboBox;
    edt_estoque_minimo: TDBEdit;
    edt_cor: TDBEdit;
    ds_categoria: TDataSource;
    ds_fornecedor: TDataSource;
    ds_funcionarios: TDataSource;
    DataSource5: TDataSource;
    DataSource6: TDataSource;
    calendario_1: TMonthCalendar;
    edt_data_modificacao: TDBEdit;
    btn_cad_funcionario: TSpeedButton;
    btn_cad_fornecedor: TSpeedButton;
    btn_cad_categoria: TSpeedButton;
    procedure btnNovoClick(Sender: TObject);
    procedure calendario_1Click(Sender: TObject);
    procedure edt_prazo_validadeEnter(Sender: TObject);
    procedure edt_prazo_validadeExit(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edt_nomeExit(Sender: TObject);
    procedure edt_marcaExit(Sender: TObject);
    procedure edt_valor_fornecedorExit(Sender: TObject);
    procedure edt_valor_vendaExit(Sender: TObject);
    procedure edt_qtdExit(Sender: TObject);
    procedure cmb_unidade_medidaExit(Sender: TObject);
    procedure cmb_fornecedorExit(Sender: TObject);
    procedure cmb_categoriaExit(Sender: TObject);
    procedure edt_observacaoExit(Sender: TObject);
    procedure cmb_funcionarioExit(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure cmb_funcionarioEnter(Sender: TObject);
    procedure edt_nomeEnter(Sender: TObject);
    procedure edt_marcaEnter(Sender: TObject);
    procedure edt_prazo_validadeChange(Sender: TObject);
    procedure edt_valor_fornecedorEnter(Sender: TObject);
    procedure edt_valor_vendaEnter(Sender: TObject);
    procedure edt_qtdEnter(Sender: TObject);
    procedure cmb_unidade_medidaEnter(Sender: TObject);
    procedure cmb_fornecedorEnter(Sender: TObject);
    procedure cmb_categoriaEnter(Sender: TObject);
    procedure edt_observacaoEnter(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edt_valor_fornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure edt_valor_vendaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_estoque_minimoEnter(Sender: TObject);
    procedure edt_estoque_minimoExit(Sender: TObject);
    procedure edt_corEnter(Sender: TObject);
    procedure edt_corExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnexcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_cad_funcionarioClick(Sender: TObject);
    procedure btn_cad_fornecedorClick(Sender: TObject);
    procedure btn_cad_categoriaClick(Sender: TObject);
  private
    { Private declarations }
  public
     procedure tratabotao(n:integer);
    { Public declarations }
  end;

var
  frmcadproduto: Tfrmcadproduto;

implementation

uses UDM, Uconsproduto, Ufrmcadfuncionario, Ucadfornecedor, Ucadcategoria;

{$R *.dfm}

procedure Tfrmcadproduto.btnNovoClick(Sender: TObject);
var
i:integer;
begin
  DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
   TdbEdit(Components[i]).Enabled:=true;
  tratabotao(2);
  cmb_funcionario.ListFieldIndex:=1;
  cmb_funcionario.SetFocus;
  dm.tbproduto.Append;
  btnsalvar.Default:=true;
  edt_data_modificacao.Text:=DateToStr(Date);
end;

procedure Tfrmcadproduto.tratabotao(n: integer);
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

procedure Tfrmcadproduto.calendario_1Click(Sender: TObject);
begin
  if(edt_prazo_validade.Focused)then
    begin
      edt_prazo_validade.Text:=DateToStr(calendario_1.date);
      calendario_1.Visible:=false;
    end
end;
procedure Tfrmcadproduto.edt_prazo_validadeEnter(Sender: TObject);
begin
  calendario_1.Date:=Date;
  calendario_1.Visible:=true;
  edt_prazo_validade.Text:=DateToStr(calendario_1.Date);
  edt_prazo_validade.Color:=clMoneyGreen;
end;

procedure Tfrmcadproduto.edt_prazo_validadeExit(Sender: TObject);
begin
    edt_prazo_validade.Color:=clWindow
end;


procedure Tfrmcadproduto.btnFecharClick(Sender: TObject);
begin
      frmcadproduto.Close;
end;



procedure Tfrmcadproduto.edt_nomeExit(Sender: TObject);
begin
    edt_nome.Color:=clWindow;
end;

procedure Tfrmcadproduto.edt_marcaExit(Sender: TObject);
begin

    edt_marca.Color:=clWindow;
end;

procedure Tfrmcadproduto.edt_valor_fornecedorExit(Sender: TObject);
begin
      edt_valor_fornecedor.Color:=clWindow;
end;

procedure Tfrmcadproduto.edt_valor_vendaExit(Sender: TObject);
begin
    edt_valor_venda.Color:=clWindow;
end;

procedure Tfrmcadproduto.edt_qtdExit(Sender: TObject);
begin
  edt_qtd.Color:=clWindow;
end;

procedure Tfrmcadproduto.cmb_unidade_medidaExit(Sender: TObject);
begin
  cmb_unidade_medida.Color:=clWindow;
end;

procedure Tfrmcadproduto.cmb_fornecedorExit(Sender: TObject);
begin
  cmb_fornecedor.Color:=clWindow;
end;

procedure Tfrmcadproduto.cmb_categoriaExit(Sender: TObject);
begin
   cmb_categoria.Color:=clWindow;
end;

procedure Tfrmcadproduto.edt_observacaoExit(Sender: TObject);
begin
    edt_observacao.Color:=clWindow;
end;

procedure Tfrmcadproduto.cmb_funcionarioExit(Sender: TObject);
begin
    cmb_funcionario.Color:=clWindow;
end;

procedure Tfrmcadproduto.btncancelarClick(Sender: TObject);
var
i:integer;
begin
    DBGrid1.Enabled:=true;
  dm.tbproduto.Cancel;
    if(dm.tbproduto.recordcount>=1)then
      begin
        tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
            begin
              TEdit(Components[i]).Enabled:=false;
            end
    end
    else
      begin
        tratabotao(1);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
            begin
              TDBEdit(Components[i]).Enabled:=false;

            end;
    end;
end;

procedure Tfrmcadproduto.cmb_funcionarioEnter(Sender: TObject);
begin
  cmb_funcionario.Color:=clMoneyGreen;
  cmb_funcionario.ListFieldIndex:=0;
end;

procedure Tfrmcadproduto.edt_nomeEnter(Sender: TObject);
begin
  edt_nome.Color:=clMoneyGreen;
end;

procedure Tfrmcadproduto.edt_marcaEnter(Sender: TObject);
begin
  edt_marca.Color:=clMoneyGreen;
end;

procedure Tfrmcadproduto.edt_prazo_validadeChange(Sender: TObject);
begin
  edt_prazo_validade.Color:=clMoneyGreen;
end;

procedure Tfrmcadproduto.edt_valor_fornecedorEnter(Sender: TObject);
begin
  edt_valor_fornecedor.Color:=clMoneyGreen;
end;

procedure Tfrmcadproduto.edt_valor_vendaEnter(Sender: TObject);
begin
  edt_valor_venda.Color:=clMoneyGreen;
end;

procedure Tfrmcadproduto.edt_qtdEnter(Sender: TObject);
begin
  edt_qtd.Color:=clMoneyGreen;
end;

procedure Tfrmcadproduto.cmb_unidade_medidaEnter(Sender: TObject);
begin
  cmb_unidade_medida.Color:=clMoneyGreen;
  cmb_unidade_medida.ItemIndex:=0;
end;

procedure Tfrmcadproduto.cmb_fornecedorEnter(Sender: TObject);
begin
  cmb_fornecedor.Color:=clMoneyGreen;
  cmb_fornecedor.ListFieldIndex:=1;
end;

procedure Tfrmcadproduto.cmb_categoriaEnter(Sender: TObject);
begin
  cmb_categoria.Color:=clMoneyGreen;
  cmb_categoria.ListFieldIndex:=1;
end;

procedure Tfrmcadproduto.edt_observacaoEnter(Sender: TObject);
begin
  edt_observacao.Color:=clMoneyGreen;
end;

procedure Tfrmcadproduto.btnSalvarClick(Sender: TObject);
  var
  i:integer;

begin
     try
      DBGrid1.Enabled:=true;
      dm.tbproduto.Post;
      application.MessageBox('Cadastro efetuado com sucesso!','Concluído',mb_ok);
      tratabotao(3);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
            TDBEdit(Components[i]).Enabled:=false;
      except
      Application.MessageBox('Problemas ao cadastrar!','Atenção',mb_ok);
      dm.tbproduto.Cancel;
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
   if dm.tbproduto.RecordCount >0 then
    begin
      tratabotao(3);
    end
   else
    begin
      tratabotao(1);
    end;
   end;
end;

procedure Tfrmcadproduto.btnAlterarClick(Sender: TObject);
var
  i:integer;
begin
   try
   DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i] is TSpeedButton)or(Components[i] is TDBComboBox)or(Components[i]is TDBRadioGroup)or(Components[i]is TDBCheckBox)or(Components[i]is TDBMemo)or(Components[i] is TDBLookupComboBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=true;
    dm.tbproduto.edit;
    btnsalvar.Default:=True;
    edt_nome.SetFocus;
    tratabotao(2);
  except
  Application.MessageBox('Problemas ao alterar Produto','Atenção',mb_ok);
  end;
end;

procedure Tfrmcadproduto.FormActivate(Sender: TObject);
var i:integer;
begin
   if (dm.tbproduto.RecordCount>0)then
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
       if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox)or(Components[i] is TDBLookupComboBox)or(Components[i] is TDBCheckBox))then  //verifica se os componentes são dbedits
       TDBEdit(Components[i]).Enabled:=false;
       tratabotao(3);
  end
  else
    begin
      Application.MessageBox('Você não tem nenhum registro de funcionários','Atenção',MB_OK+MB_ICONEXCLAMATION);
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
        if ((Components[i]is Tdbedit)or (Components[i] is TSpeedButton)or (Components[i] is Tdbradiogroup)or(Components[i] is TDBComboBox))then  //verifica se os componentes são dbedits
      TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
      dm.tbproduto.Active:=true;
      tratabotao(1);
  end;
end;

procedure Tfrmcadproduto.edt_valor_fornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;

procedure Tfrmcadproduto.edt_valor_vendaKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
  end;
procedure Tfrmcadproduto.edt_estoque_minimoEnter(Sender: TObject);
begin
  edt_estoque_minimo.Color:=clMoneyGreen;
end;

procedure Tfrmcadproduto.edt_estoque_minimoExit(Sender: TObject);
begin
  edt_estoque_minimo.Color:=clWindow;
end;

procedure Tfrmcadproduto.edt_corEnter(Sender: TObject);
begin
  edt_cor.Color:=clMoneyGreen;
end;

procedure Tfrmcadproduto.edt_corExit(Sender: TObject);
begin
  edt_cor.Color:=clWindow;
end;

procedure Tfrmcadproduto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário de cadastro?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmcadproduto.btnexcluirClick(Sender: TObject);
begin
  if (application.MessageBox('Você tem certeza que deseja excluir este produto?','Atenção',mb_Iconquestion+Mb_yesno)=idyes)then
    begin
    try
      dm.tbproduto.Delete;
      ShowMessage('Produto Excluído com Sucesso!');
      if (dm.tbproduto.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
    except
      dm.tbproduto.Cancel;
  end;
end;
end;
procedure Tfrmcadproduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i:integer;
begin
    i:=0;
  while i <= Screen.FormCount - 1 do { Conta até o último formulário da tela }
    begin
      if( Screen.Forms[i] = frmconsproduto ) then
        begin
          frmconsproduto.btnconsultar.Click;
          i := Screen.FormCount;
        end;
        Inc(i);
     end;
end;

procedure Tfrmcadproduto.btn_cad_funcionarioClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadfuncionarios,frmcadfuncionarios);
  frmcadfuncionarios.ShowModal;
  frmcadfuncionarios.Free;
end;

procedure Tfrmcadproduto.btn_cad_fornecedorClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadfornecedores,frmcadfornecedores);
  frmcadfornecedores.ShowModal;
  frmcadfornecedores.Free;
end;

procedure Tfrmcadproduto.btn_cad_categoriaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadcategoria,frmcadcategoria);
  frmcadcategoria.ShowModal;
  frmcadcategoria.Free;
end;

end.
