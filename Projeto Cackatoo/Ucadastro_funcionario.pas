unit Ucadastro_funcionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, Grids, DBGrids, ComCtrls,
  jpeg, ExtCtrls, ADODB;

type
  Tfrmcadprodutos = class(TForm)
    DataSource1: TDataSource;
    Label2: TLabel;
    edtnome: TDBEdit;
    Label3: TLabel;
    edtmarca: TDBEdit;
    Label4: TLabel;
    edtvalor: TDBEdit;
    Label5: TLabel;
    btnSalvar: TBitBtn;
    btncancelar: TBitBtn;
    btnFechar: TBitBtn;
    DBGrid1: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnexcluir: TBitBtn;
    DataSource3: TDataSource;
    lblcategoria: TLabel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    MonthCalendar1: TMonthCalendar;
    Image1: TImage;
    DataSource2: TDataSource;
    Label6: TLabel;
    edtvalor_forn: TDBEdit;
    Label7: TLabel;
    edtqtd: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DataSource4: TDataSource;
    DataSource5: TDataSource;
    Label8: TLabel;
    cmbunidade_medida: TDBComboBox;
    Label9: TLabel;
    edtobservacao: TDBEdit;
    edtlucro: TEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure DBEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Exit(Sender: TObject);
    procedure DBEdit1Click(Sender: TObject);
    procedure DBEdit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtnomeClick(Sender: TObject);
    procedure edtnomeEnter(Sender: TObject);
    procedure edtnomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtnomeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtnomeExit(Sender: TObject);
    procedure edtmarcaClick(Sender: TObject);
    procedure edtmarcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtmarcaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtmarcaEnter(Sender: TObject);
    procedure edtmarcaExit(Sender: TObject);
    procedure edtvalorClick(Sender: TObject);
    procedure edtvalorEnter(Sender: TObject);
    procedure edtvalorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtvalorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtvalorExit(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBLookupComboBox2Exit(Sender: TObject);
    procedure DBEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit1Enter(Sender: TObject);
    procedure edtvalor_fornClick(Sender: TObject);
    procedure edtvalor_fornEnter(Sender: TObject);
    procedure edtvalor_fornKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtvalor_fornMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtvalor_fornExit(Sender: TObject);
    procedure edtqtdClick(Sender: TObject);
    procedure edtqtdEnter(Sender: TObject);
    procedure edtqtdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtqtdMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtqtdExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure cmbunidade_medidaClick(Sender: TObject);
    procedure cmbunidade_medidaEnter(Sender: TObject);
    procedure cmbunidade_medidaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbunidade_medidaExit(Sender: TObject);
    procedure edtqtdKeyPress(Sender: TObject; var Key: Char);
    procedure edtvalor_fornKeyPress(Sender: TObject; var Key: Char);
    procedure edtvalorKeyPress(Sender: TObject; var Key: Char);
    procedure edtobservacaoClick(Sender: TObject);
    procedure edtobservacaoEnter(Sender: TObject);
    procedure edtobservacaoExit(Sender: TObject);
  private
    { Private declarations }
  public
     procedure WM_Move(var msg: TWMMove);
    message WM_MOVE;
    { Public declarations }
    procedure tratabotao(n:integer);//cuida dos botões que devem ser ativados ou desativados.
  end;

var
  frmcadprodutos: Tfrmcadprodutos;

implementation

uses UDM, Uconsproduto;

{$R *.dfm}


procedure Tfrmcadprodutos.btnFecharClick(Sender: TObject);
begin
  if(Application.MessageBox('Deseja mesmo sair da tela de cadastro?','Atenção',MB_ICONQUESTION+MB_YESNO)=idyes)then
  begin
    frmcadprodutos.Close;
  end;

end;

procedure Tfrmcadprodutos.btnNovoClick(Sender: TObject);
var
i:integer;
begin
  DBLookupComboBox1.Enabled:=true;
  DBLookupComboBox2.Enabled:=true;
  DBGrid1.Enabled:=false;
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i]is Tedit)or(Components[i]is TDBComboBox)or(Components[i]is TDBComboBox))then  //verifica se os componentes são dbedits
   TdbEdit(Components[i]).Enabled:=true;
  tratabotao(2);
  edtnome.SetFocus;
  dm.tbproduto.Append;
end;

procedure Tfrmcadprodutos.tratabotao(n: integer);
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





procedure Tfrmcadprodutos.FormActivate(Sender: TObject);
var
  i:integer;
begin
  frmcadprodutos.WindowState:=wsMaximized;
 dm.tbproduto.Active:=true;
  if (dm.tbproduto.RecordCount>0)then
    begin
      DBLookupComboBox1.Enabled:=false;
      DBLookupComboBox2.Enabled:=false;
    for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i]is Tedit) or (Components[i]is TDBLookupCombobox)or(Components[i] is TDBComboBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
    tratabotao(3);
  end
  else
  begin
  Application.MessageBox('Não há nenhum registro de produtos','Atenção',mb_ok+MB_ICONEXCLAMATION);
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i]is Tedit) or (Components[i] is TDBLookupComboBox)or (Components[i]is TDBComboBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;  //caso seja um dbedit, ele deshabilita
  tratabotao(1);
  end;
 MonthCalendar1.Date:=date;
end;
procedure Tfrmcadprodutos.btnSalvarClick(Sender: TObject);
var
  i:integer;
  nome:string;
  marca:string;
  valor_prod:string;
  valor_forn:string;
  fornecedor:string;
  categoria:string;
  data_lancamento:string;
  qtd:string;
  uni_medida:String;
begin
  DBLookupComboBox1.Enabled:=true;
  DBLookupComboBox2.Enabled:=true;
  DBGrid1.Enabled:=true;
  nome:=edtnome.text;
  marca:=edtmarca.Text;
  valor_prod:=edtvalor.text;
  valor_forn:=edtvalor_forn.text;
  fornecedor:=DBLookupComboBox1.Text;
  categoria:=DBLookupComboBox2.Text;
  data_lancamento:=DBEdit1.Text;
  qtd:=edtqtd.Text;
  uni_medida:=cmbunidade_medida.Text;

    if(nome='')then
      begin
        if(Application.MessageBox('Informe o nome do produto!','Atenção',MB_OK+MB_ICONERROR)=1)then
          begin
            edtnome.SetFocus;
          end;
      end
    else if(marca='')then
      begin
        if(Application.MessageBox('Informe a marca do produto!','Atenção',MB_OK+MB_ICONERROR)=1)then
          begin
            edtmarca.SetFocus;
          end;
      end
      else if(valor_forn='')then
       begin
         if(Application.MessageBox('Informe o valor de Compra do produto!','Atenção',MB_OK+MB_ICONERROR)=1)then
          begin
            edtvalor_forn.SetFocus;
          end;
        end
       else if(valor_prod='')then
       begin
         if(Application.MessageBox('Informe o valor de venda do produto!','Atenção',MB_OK+MB_ICONERROR)=1)then
          begin
            edtvalor.SetFocus;
          end;
        end
      else if((data_lancamento='')or(data_lancamento='  /  /  '))then
       begin
         if(Application.MessageBox('Informe o Data do lançamento!','Atenção',MB_OK+MB_ICONERROR)=1)then
          begin
            DBEdit1.SetFocus;
          end;
        end
      else if(qtd='')then
       begin
         if(Application.MessageBox('Informe a quantidade do produto!','Atenção',MB_OK+MB_ICONERROR)=1)then
          begin
            edtqtd.SetFocus;
          end;
        end
        else if(uni_medida='')then
        begin
          if(Application.MessageBox('Informe a unidade de medida do produto!','Atenção',MB_OK+MB_ICONERROR)=1)then
            begin
              cmbunidade_medida.SetFocus;
            end;
        end
     else if(fornecedor='')then
        begin
          if(Application.MessageBox('Informe o nome do fornecedor do produto!','Atenção',MB_OK+MB_ICONERROR)=1)then
            begin
              DBLookupComboBox1.SetFocus;
            end;
        end
      else if(categoria='')then
        begin
          if(Application.MessageBox('Informe a categoria do produto!','Atenção',MB_OK+MB_ICONERROR)=1)then
            begin
              DBLookupComboBox2.SetFocus;
            end;
        end
      else if(data_lancamento='')then
        begin
          if(Application.MessageBox('Informe a data de cadastro do produto!','Atenção',MB_OK+MB_ICONERROR)=1)then
            begin
              dbedit1.SetFocus;
            end;
        end

     else
        begin
   try
    dm.tbproduto.post;
    application.MessageBox('Cadastro efetuado com sucesso!','Concluído',mb_ok);
    tratabotao(3);
    for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i]is Tedit)or (Components[i]is TDBLookupComboBox)or(Components[i]is TDBComboBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
    except
      dm.tbproduto.Cancel;
      Application.MessageBox('Problemas ao cadastrar produto','Atenção',mb_ok);
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
          if ((Components[i]is TDBedit)or (Components[i]is Tedit)or(Components[i]is TDBLookupComboBox)or (Components[i]is TDBComboBox))then  //verifica se os componentes são dbedits
          TDBEdit(Components[i]).Enabled:=false;
             if dm.tbcategoria.RecordCount >0 then
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
procedure Tfrmcadprodutos.btnAlterarClick(Sender: TObject);
var
  i:integer;
begin
  dbgrid1.Enabled:=false;
  try
  for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i]is Tedit) or (Components[i]is TDBLookupComboBox) or (Components[i]is TDBComboBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=true;
  dm.tbproduto.edit;
  edtnome.SetFocus;
  tratabotao(2);
  except
  Application.MessageBox('Problemas ao alterar produto','Atenção',mb_ok);
  end;
end;
procedure Tfrmcadprodutos.btnexcluirClick(Sender: TObject);
begin
  if (application.MessageBox('Você tem certeza que deseja excluir este produto?','Atenção',mb_Iconquestion+Mb_yesno)=idyes)then
  begin
    dm.tbproduto.Delete;
    if (dm.tbproduto.RecordCount=0)then
        begin
          tratabotao(1);
        end
      else
        begin
          tratabotao(3);
        end;
  end
  else
    dm.tbproduto.Cancel;
  end;
procedure Tfrmcadprodutos.btncancelarClick(Sender: TObject);
var
  i:integer;
begin
  DBGrid1.Enabled:=true;
  dm.tbproduto.Cancel;
  if(dm.tbfornecedor.recordcount>=1)then
      begin
        for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if ((Components[i]is TDBedit)or (Components[i]is Tedit)or(Components[i]is TDBLookupComboBox)or (Components[i]is TDBComboBox))then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
        tratabotao(3)
      end
    else
    begin
      for i:=0 to componentcount-1 do //passa pelos componentes verificando pelos números
   if (Components[i]is TDBedit)then  //verifica se os componentes são dbedits
    TDBEdit(Components[i]).Enabled:=false;
      tratabotao(1);
    end;
end;

procedure Tfrmcadprodutos.WM_Move(var msg: TWMMove);
begin
  if Left < 0 then
    left:=0;
   if top < 0then
    top:=0;
   if screen.Width-(left+width)< 0 then
    left:=screen.Width - width;
   if screen.Height-(top+height) <0 then
    top:=screen.Height-Height;
end;

procedure Tfrmcadprodutos.MonthCalendar1Click(Sender: TObject);
begin
  DBEdit1.Text:=DateToStr(MonthCalendar1.Date);
end;

procedure Tfrmcadprodutos.DBEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  MonthCalendar1.Visible:=true;
end;

procedure Tfrmcadprodutos.DBEdit1Exit(Sender: TObject);
begin
  MonthCalendar1.Visible:=false;
  DBEdit1.Color:=clWindow;
end;

procedure Tfrmcadprodutos.DBEdit1Click(Sender: TObject);
begin
  MonthCalendar1.Visible:=true;
  DBEdit1.Color:=clMoneyGreen;
  DBEdit1.Text:=DateToStr(MonthCalendar1.Date);
end;

procedure Tfrmcadprodutos.DBEdit1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  MonthCalendar1.Visible:=false;
  DBEdit1.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtnomeClick(Sender: TObject);
begin
 edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtnomeEnter(Sender: TObject);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtnomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtnomeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtnomeExit(Sender: TObject);
begin
  edtnome.Color:=clWindow;
end;

procedure Tfrmcadprodutos.edtmarcaClick(Sender: TObject);
begin
  edtmarca.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtmarcaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtmarca.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtmarcaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtmarca.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtmarcaEnter(Sender: TObject);
begin
  edtmarca.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtmarcaExit(Sender: TObject);
begin
  edtmarca.Color:=clWindow;
end;

procedure Tfrmcadprodutos.edtvalorClick(Sender: TObject);
begin
  edtvalor.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtvalorEnter(Sender: TObject);
begin
  edtvalor.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtvalorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtvalor.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtvalorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtvalor.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtvalorExit(Sender: TObject);
var
vl1:Real;
vl2:Real;
total:string;
begin
  edtvalor.Color:=clWindow;
  vl1:=StrToFloat(edtvalor.Text);
  vl2:=StrToFloat(edtvalor_forn.Text);
  total:=FloatToStr(vl2-vl1);
  edtlucro.Text:=total;
end;

procedure Tfrmcadprodutos.DBLookupComboBox1Click(Sender: TObject);
begin
  DBLookupComboBox1.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.DBLookupComboBox1Enter(Sender: TObject);
begin
  DBLookupComboBox1.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  DBLookupComboBox1.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.DBLookupComboBox1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DBLookupComboBox1.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.DBLookupComboBox1Exit(Sender: TObject);
begin
  DBLookupComboBox1.Color:=clWindow;
end;

procedure Tfrmcadprodutos.DBLookupComboBox2Click(Sender: TObject);
begin
  DBLookupComboBox2.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.DBLookupComboBox2Enter(Sender: TObject);
begin
  DBLookupComboBox2.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.DBLookupComboBox2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  DBLookupComboBox2.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.DBLookupComboBox2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  DBLookupComboBox2.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.DBLookupComboBox2Exit(Sender: TObject);
begin
  DBLookupComboBox2.Color:=clWindow;
end;

procedure Tfrmcadprodutos.DBEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DBEdit1.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.DBEdit1Enter(Sender: TObject);
begin
  DBEdit1.Color:=clMoneyGreen;
  DBEdit1.Text:=DateToStr(MonthCalendar1.Date);
end;

procedure Tfrmcadprodutos.edtvalor_fornClick(Sender: TObject);
begin
  edtvalor_forn.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtvalor_fornEnter(Sender: TObject);
begin
  edtvalor_forn.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtvalor_fornKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  edtvalor_forn.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtvalor_fornMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtvalor_forn.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtvalor_fornExit(Sender: TObject);
begin
  edtvalor_forn.Color:=clWindow;
end;

procedure Tfrmcadprodutos.edtqtdClick(Sender: TObject);
begin
  edtqtd.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtqtdEnter(Sender: TObject);
begin
  edtqtd.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtqtdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtqtd.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtqtdMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtqtd.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtqtdExit(Sender: TObject);
begin
  edtqtd.Color:=clWindow;
end;

procedure Tfrmcadprodutos.FormClose(Sender: TObject;
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
          frmconsproduto.ADOQuery1.Open;
          frmconsproduto.ADOQuery2.Open;
          frmconsproduto.ADOQuery1.Open;
        end;
        Inc(i);
    end;
end;
procedure Tfrmcadprodutos.FormDestroy(Sender: TObject);
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

procedure Tfrmcadprodutos.cmbunidade_medidaClick(Sender: TObject);
begin
  cmbunidade_medida.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.cmbunidade_medidaEnter(Sender: TObject);
begin
  cmbunidade_medida.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.cmbunidade_medidaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  cmbunidade_medida.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.cmbunidade_medidaExit(Sender: TObject);
begin
  cmbunidade_medida.Color:=clWindow;
end;

procedure Tfrmcadprodutos.edtqtdKeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9', #8]) and (key <> DecimalSeparator) then
        key:=#0;
end;

procedure Tfrmcadprodutos.edtvalor_fornKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(key in ['0'..'9', #8]) and (key <> DecimalSeparator) then
        key:=#0;
end;

procedure Tfrmcadprodutos.edtvalorKeyPress(Sender: TObject; var Key: Char);
begin
   if not(key in ['0'..'9', #8]) and (key <> DecimalSeparator) then
        key:=#0;
end;

procedure Tfrmcadprodutos.edtobservacaoClick(Sender: TObject);
begin
  edtobservacao.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtobservacaoEnter(Sender: TObject);
begin
  edtobservacao.Color:=clMoneyGreen;
end;

procedure Tfrmcadprodutos.edtobservacaoExit(Sender: TObject);
begin
  edtobservacao.Color:=clWindow;
end;

end.
