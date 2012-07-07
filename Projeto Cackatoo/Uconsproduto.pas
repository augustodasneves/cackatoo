unit Uconsproduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DBCtrls,
  jpeg;

type
  Tfrmconsproduto = class(TForm)
    DBGrid1: TDBGrid;
    rgpop: TRadioGroup;
    edtnome: TEdit;
    edtcodigo: TEdit;
    btnconsultar: TBitBtn;
    btncancelar: TBitBtn;
    btnfechar: TBitBtn;
    dsresultado: TDataSource;
    qconsulta: TADOQuery;
    marca: TDBLookupComboBox;
    dsmarca: TDataSource;
    edtcategoria: TDBLookupComboBox;
    Image1: TImage;
    ADOQuery1: TADOQuery;
    dscategoria: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery2marca: TStringField;
    fornecedor: TDBLookupComboBox;
    btncadprod: TBitBtn;
    lblordenado: TLabel;
    lblquantidade: TLabel;
    btngera_rel: TButton;
    ADOQuery1categoria: TStringField;
    qconsultaid_produto: TAutoIncField;
    qconsultanome_prod: TStringField;
    qconsultamarca: TStringField;
    qconsultavalor_venda: TBCDField;
    qconsultadata_modificacao: TDateField;
    qconsultavalor_forn: TBCDField;
    qconsultaqtd: TIntegerField;
    qconsultauni_medida: TStringField;
    qconsultaobservacao: TStringField;
    qconsultaestoque_minimo: TIntegerField;
    qconsultaperecivel: TSmallintField;
    qconsultaprazo_validade: TDateField;
    qconsultacor: TStringField;
    qconsultanome_fantasia: TStringField;
    qconsultanome_funcionario: TStringField;
    qconsultacategoria: TStringField;
    ADOQuery1id_categoria: TAutoIncField;
    ds_fornecedor: TDataSource;
    cons_fornecedor: TADOQuery;
    procedure btnconsultarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgpopClick(Sender: TObject);
    procedure edtnomeClick(Sender: TObject);
    procedure edtnomeEnter(Sender: TObject);
    procedure edtnomeMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtnomeExit(Sender: TObject);
    procedure edtcodigoClick(Sender: TObject);
    procedure edtcodigoEnter(Sender: TObject);
    procedure edtcodigoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtcodigoExit(Sender: TObject);
    procedure marcaClick(Sender: TObject);
    procedure marcaEnter(Sender: TObject);
    procedure marcaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure marcaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure marcaExit(Sender: TObject);
    procedure edtcategoriaClick(Sender: TObject);
    procedure edtcategoriaEnter(Sender: TObject);
    procedure edtcategoriaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtcategoriaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtcategoriaExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure fornecedorClick(Sender: TObject);
    procedure fornecedorEnter(Sender: TObject);
    procedure fornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fornecedorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure fornecedorExit(Sender: TObject);
    procedure btncadprodClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btngera_relClick(Sender: TObject);
    procedure edtcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtnomeChange(Sender: TObject);
    procedure edtcodigoChange(Sender: TObject);
  private
    procedure WMMove(var Msg: TWMMove);
    { Private declarations }
  public
  procedure WM_Move(var msg: TWMMove);
    message WM_MOVE;
    { Public declarations }
  end;

var
  frmconsproduto: Tfrmconsproduto;
  texto:string;
implementation

uses Uconsultafunc, UDM, Urelfunc, Urelproduto,
  Ucadproduto;

{$R *.dfm}

procedure Tfrmconsproduto.btnconsultarClick(Sender: TObject);
begin
   with qconsulta do
    begin
      Close;
      sql.Clear;
      case rgpop.ItemIndex of
        0:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria');


        1:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria and produto.nome_prod like '+QuotedStr(edtnome.Text+'%'));


        2:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria and produto.id_produto='+quotedstr(edtcodigo.text));


        3:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria and produto.marca like '+quotedstr(marca.Text));

        4:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = '+quotedstr(edtcategoria.KeyValue)+' and categoria.id_categoria = '+quotedstr(edtcategoria.KeyValue));


        5:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where '+
                  'produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria and produto.fornecedor_id_fornecedor ='+QuotedStr(fornecedor.KeyValue)+' and fornecedor.id_fornecedor = '+QuotedStr(fornecedor.KeyValue));


        6:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria and valor_venda in(select max(valor_venda)from produto)');


        7:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria and valor_venda in(select min(valor_venda)from produto)');


        8:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria and qtd in(select max(qtd)from produto)');


        9:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria and qtd in(select min(qtd)from produto)');

        10:sql.Add('select distinct '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.perecivel = 1');
            
        11:sql.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.perecivel is null');

      end;
      try
        texto := sql.Text;
        open;
          if(qconsulta.RecordCount=0)then
          begin
            lblquantidade.Color:=clRed;
          end;
      except
        Application.MessageBox('Problemas ao Consultar!','Atenção',MB_ICONERROR+mb_OK);
        exit;
      end;
    end;
    if((rgpop.ItemIndex=0) and(qconsulta.RecordCount>1))then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Produtos cadastrados';
      end
    else if((qconsulta.RecordCount=1)and (rgpop.ItemIndex=0))then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Produto Cadastrado';
      end
      else if(qconsulta.RecordCount=1)then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Resultado para a Consulta';
      end
    else
      begin
       lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Resultados para a consulta';
      end;
end;

procedure Tfrmconsproduto.btncancelarClick(Sender: TObject);
begin
  qconsulta.Close;
  qconsulta.SQL.Clear;
  qconsulta.SQL.Add('select '+
                  'produto.id_produto,'+
                  'produto.nome_prod,'+
                  'produto.marca,'+
                  'produto.valor_venda,'+
                  'produto.data_modificacao,'+
                  'produto.valor_forn,'+
                  'produto.qtd,'+
                  'produto.uni_medida,'+
                  'produto.observacao,'+
                  'produto.estoque_minimo,'+
                  'produto.perecivel,'+
                  'produto.prazo_validade,'+
                  'produto.cor,'+
                  'fornecedor.nome_fantasia,'+
                  'funcionarios.nome_funcionario,'+
                  'categoria.categoria '+
                  'from produto,fornecedor,categoria,funcionarios'+
                  ' where produto.fornecedor_id_fornecedor = fornecedor.id_fornecedor '+
                  'and produto.id_funcionario = funcionarios.id_funcionario and '+
                  'produto.id_categoria = categoria.id_categoria and produto.id_produto = -1');
  qconsulta.Open;
  frmconsproduto.rgpop.ItemIndex:=0;
  frmconsproduto.edtnome.Visible:=false;
  frmconsproduto.edtcodigo.Visible:=false;
  frmconsproduto.marca.Visible:=false;
  frmconsproduto.DBGrid1.Refresh;
  lblquantidade.Caption:='';
end;

procedure Tfrmconsproduto.btnfecharClick(Sender: TObject);
begin
    frmconsproduto.Close;
end;

procedure Tfrmconsproduto.FormActivate(Sender: TObject);
begin
  edtnome.Visible:=false;
  edtcodigo.Visible:=false;
  marca.Visible:=false;
end;

procedure Tfrmconsproduto.rgpopClick(Sender: TObject);
begin
  case rgpop.ItemIndex of
    1:
      begin
        edtnome.Visible:=true;
        edtnome.Clear;
        edtnome.SetFocus;
        edtcodigo.Visible:=false;
        marca.Visible:=false;
        edtcategoria.Visible:=false;
        fornecedor.Visible:=false;
        btnconsultar.Default:=true;
      end;
    2:
      begin
        edtcodigo.Visible:=true;
        edtcodigo.Clear;
        edtcodigo.SetFocus;
        edtnome.Visible:=false;
        marca.Visible:=false;
        edtcategoria.Visible:=false;
        fornecedor.visible:=false;
        btnconsultar.Default:=true;
      end;
    3:
      begin
        edtnome.Visible:=false;
        edtcodigo.Visible:=false;
        marca.Visible:=true;
        marca.Enabled:=True;
        marca.SetFocus;
        edtcategoria.Visible:=false;
        btnconsultar.Default:=true;
        fornecedor.Visible:=false;
      end;
    4:
      begin
        edtcategoria.Visible:=true;
        edtcategoria.Enabled:=true;
        edtcategoria.SetFocus;
        edtcodigo.visible:=false;
        marca.Visible:=false;
        edtnome.Visible:=false;
        btnconsultar.Default:=true;
        fornecedor.Visible:=false;
      end;
    5:
      begin
        edtcategoria.Visible:=false;
        edtcodigo.Visible:=false;
        marca.Visible:=false;
        edtnome.Visible:=false;
        btnconsultar.Default:=true;
        fornecedor.Visible:=true;
        fornecedor.SetFocus;
      end;
    else
        edtnome.Visible:=false;
        edtcodigo.Visible:=false;
        edtcategoria.Visible:=false;
        fornecedor.Visible:=false;
        marca.Visible:=false;
    end;
end;
procedure Tfrmconsproduto.WMMove(var Msg: TWMMove);
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

procedure Tfrmconsproduto.WM_Move(var msg: TWMMove);
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

procedure Tfrmconsproduto.edtnomeClick(Sender: TObject);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.edtnomeEnter(Sender: TObject);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.edtnomeMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtnome.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.edtnomeExit(Sender: TObject);
begin
  edtnome.Color:=clWindow;
end;

procedure Tfrmconsproduto.edtcodigoClick(Sender: TObject);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.edtcodigoEnter(Sender: TObject);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.edtcodigoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtcodigo.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.edtcodigoExit(Sender: TObject);
begin
  edtcodigo.Color:=clWindow;
end;

procedure Tfrmconsproduto.marcaClick(Sender: TObject);
begin
  marca.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.marcaEnter(Sender: TObject);
begin
  marca.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.marcaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  marca.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.marcaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  marca.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.marcaExit(Sender: TObject);
begin
  marca.Color:=clWindow;
end;

procedure Tfrmconsproduto.edtcategoriaClick(Sender: TObject);
begin
  edtcategoria.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.edtcategoriaEnter(Sender: TObject);
begin
  edtcategoria.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.edtcategoriaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  edtcategoria.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.edtcategoriaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtcategoria.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.edtcategoriaExit(Sender: TObject);
begin
  edtcategoria.Color:=clWindow;
end;

procedure Tfrmconsproduto.Button1Click(Sender: TObject);
begin
   Application.CreateForm(Tfrmrelproduto, frmrelproduto);

  frmrelproduto.ShowModal;

  frmrelproduto.Free;
end;

procedure Tfrmconsproduto.fornecedorClick(Sender: TObject);
begin
  fornecedor.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.fornecedorEnter(Sender: TObject);
begin
  fornecedor.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.fornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  fornecedor.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.fornecedorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  fornecedor.Color:=clMoneyGreen;
end;

procedure Tfrmconsproduto.fornecedorExit(Sender: TObject);
begin
  fornecedor.Color:=clWindow;
end;

procedure Tfrmconsproduto.btncadprodClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadproduto, frmcadproduto);
  frmcadproduto.ShowModal;
  frmcadproduto.Free;
end;

procedure Tfrmconsproduto.DBGrid1TitleClick(Column: TColumn);
var
campo,cons,consulta:string;
begin
  if texto = '' then
    cons := 'select * from produto'
  else
    cons := texto;
  campo:=column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
  consulta:=cons +' order by '+campo;
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure
  with qconsulta do
    begin
      Close;
      SQL.Clear;
      SQL.Add(Consulta);
      Open;
    end;
    lblordenado.caption:='Classificado por : [ '+Column.Title.Caption+' ]';
end;

procedure Tfrmconsproduto.btngera_relClick(Sender: TObject);
begin
  if DBGrid1.FieldCount = 0 then
   begin
     if (Application.MessageBox('É necessário consultar para gerar um relatório','Atenção',MB_OK+MB_ICONERROR))=1 then
       begin
          rgpop.SetFocus;
       end;
   end
 else
   begin
    Application.CreateForm(Tfrmrelproduto,frmrelproduto);
    frmrelproduto.Free;
   end;
end;

procedure Tfrmconsproduto.edtcodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;



procedure Tfrmconsproduto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário de consulta?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmconsproduto.edtnomeChange(Sender: TObject);
begin
  btnconsultar.Click;
end;

procedure Tfrmconsproduto.edtcodigoChange(Sender: TObject);
begin
  btnconsultar.Click;
end;

end.
