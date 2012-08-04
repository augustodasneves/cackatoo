unit Ucackatoo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ComCtrls, Menus, XPMan, jpeg, ExtCtrls,
  ToolWin, MMSystem, ImgList, ShellApi, IdBaseComponent, IdComponent,
  IdIPWatch, Registry, DB, ADODB, Grids, DBGrids;

type
  Tfrmprincipal = class(TForm)
    menu: TMainMenu;
    Cadastros1: TMenuItem;
    Consultas1: TMenuItem;
    Produtos: TMenuItem;
    Funcionarios: TMenuItem;
    Fornecedores: TMenuItem;
    Sobre1: TMenuItem;
    Sobre2: TMenuItem;
    consultaprodutos: TMenuItem;
    consultafuncionarios: TMenuItem;
    consultaorcamentos: TMenuItem;
    consultafornecedores: TMenuItem;
    Orcamentos: TMenuItem;
    StatusBar: TStatusBar;
    Timer1: TTimer;
    ToolBar1: TToolBar;
    tbnprodutos: TToolButton;
    btnfuncionarios: TToolButton;
    btncd: TToolButton;
    btncalculadora: TToolButton;
    ImageList1: TImageList;
    btnsair: TToolButton;
    btnforncedores: TToolButton;
    Usurios: TMenuItem;
    Usuarios1: TMenuItem;
    sair: TMenuItem;
    btnfechacd: TToolButton;
    Categorias1: TMenuItem;
    Clientes1: TMenuItem;
    cadcliente: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Clientes2: TMenuItem;
    Relatorios: TMenuItem;
    RelProdutos: TMenuItem;
    Clientes3: TMenuItem;
    Funcionrios1: TMenuItem;
    Fornecedores1: TMenuItem;
    btncategoria: TToolButton;
    calendario: TMonthCalendar;
    Utilidades1: TMenuItem;
    Calendrio1: TMenuItem;
    Calculadora1: TMenuItem;
    AbrirDrivedeCD1: TMenuItem;
    CadastrosPrimrios1: TMenuItem;
    Bairros1: TMenuItem;
    Cidades1: TMenuItem;
    UF1: TMenuItem;
    Caixa1: TMenuItem;
    FechamentodeCaixa1: TMenuItem;
    ListaTelefonica1: TMenuItem;
    Venda1: TMenuItem;
    Oramento1: TMenuItem;
    IP: TIdIPWatch;
    iposdeTelefone1: TMenuItem;
    IniciarSistemacomoWindows1: TMenuItem;
    btn_sim: TButton;
    btn_nao: TButton;
    lbl_sis: TLabel;
    Retiradas1: TMenuItem;
    FaturamentoMensal1: TMenuItem;
    procedure FuncionariosClick(Sender: TObject);
    procedure ProdutosClick(Sender: TObject);
    procedure FornecedoresClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure consultafuncionariosClick(Sender: TObject);
    procedure btncdClick(Sender: TObject);
    procedure consultaprodutosClick(Sender: TObject);
    procedure consultafornecedoresClick(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure btncalculadoraClick(Sender: TObject);
    procedure tbnprodutosClick(Sender: TObject);
    procedure btnfuncionariosClick(Sender: TObject);
    procedure btnforncedoresClick(Sender: TObject);
    procedure UsuriosClick(Sender: TObject);
    procedure DeslogarClick(Sender: TObject);
    procedure Sobre2Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure sairClick(Sender: TObject);
    procedure Deslogar1Click(Sender: TObject);
    procedure btnfechacdClick(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure cadclienteClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure RelProdutosClick(Sender: TObject);
    procedure Clientes3Click(Sender: TObject);
    procedure Funcionrios1Click(Sender: TObject);
    procedure Fornecedores1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btncategoriaClick(Sender: TObject);
    procedure Calendrio1Click(Sender: TObject);
    procedure Calculadora1Click(Sender: TObject);
    procedure AbrirDrivedeCD1Click(Sender: TObject);
    procedure FechamentodeCaixa1Click(Sender: TObject);
    procedure UF1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Bairros1Click(Sender: TObject);
    procedure ListaTelefonica1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure iposdeTelefone1Click(Sender: TObject);
    procedure IniciarSistemacomoWindows1Click(Sender: TObject);
    procedure btn_simClick(Sender: TObject);
    procedure btn_naoClick(Sender: TObject);
    procedure Retiradas1Click(Sender: TObject);
    procedure FaturamentoMensal1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure WM_Move(var msg: TWMMove);
    message WM_MOVE;
    procedure StartWithWin(const Astart:Boolean=True);


  end;

var
  frmprincipal: Tfrmprincipal;
  inicia:integer;

implementation

uses Ucadastro_funcionario, Ufrmcadfuncionario, Ucadfornecedor,
  Uconsultafunc, Uconsproduto, Uconsfornecedor, Ucadusuario,
  Ufrmlogin, Usobre, Uconsusuario, Ucadcategoria, Ucadcliente,
  Ufrmconscliente, Urelproduto, Ufrmrelclientes, Ufrmrelfuncionarios,
  Ufrmrelfornecedores, Ucadproduto, Ucaixa, Ucaduf, Ucadcidade, Ucadbairro, Ulista_telefonica, Uvenda, Ucad_tipo_tel,
  Ucadretirada, Ucad_faturamento;

{$R *.dfm}







procedure Tfrmprincipal.FuncionariosClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadfuncionarios, frmcadfuncionarios);
  frmcadfuncionarios.showmodal;
  frmcadfuncionarios.free;
end;

procedure Tfrmprincipal.ProdutosClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadproduto, frmcadproduto);

  frmcadproduto.ShowModal;

  frmcadproduto.Free;
end;

procedure Tfrmprincipal.FornecedoresClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadfornecedores, frmcadfornecedores);
  frmcadfornecedores.ShowModal;
  frmcadfornecedores.Free;
end;

procedure Tfrmprincipal.Timer1Timer(Sender: TObject);
begin
  if GetKeyState(VK_INSERT)=1 then
    StatusBar.Panels[0].Text:='INS'
  else
    StatusBar.Panels[0].Text:='';
  if GetKeyState(VK_NUMLOCK)=1 then
    StatusBar.Panels[1].Text:='NUM'
  else
    StatusBar.Panels[1].Text:='';
  if GetKeyState(VK_CAPITAL)=1 then
    StatusBar.Panels[2].Text:='CAPS'
  else
    StatusBar.Panels[2].Text:='';
  if GetKeyState(VK_SCROLL)=1 then
    StatusBar.Panels[3].Text:='SCROLL'
  else
    StatusBar.Panels[3].Text:='';
  StatusBar.Panels[4].Text:=TimeToStr(time);
  StatusBar.Panels[5].Text:=FormatDateTime('dd/mm/yyyy',date);
  StatusBar.Panels[6].Text:='Usuário: '+frmlogin.edtlogin.text;
  StatusBar.Panels[7].Text:='IP: '+IP.LocalIP;
  StatusBar.Panels[8].Text:='Nome na Rede: '+IP.LocalName;
end;

procedure Tfrmprincipal.consultafuncionariosClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmconsfunc,frmconsfunc);
  frmconsfunc.ShowModal;
  frmconsfunc.Free;
end;

procedure Tfrmprincipal.btncdClick(Sender: TObject);
begin
    try
      mciSendString('Set cdaudio door open wait', nil, 0, handle);
      btncd.Visible:=false;
      btnfechacd.Visible:=true;
    except
      application.messagebox('Problemas ao abrir Bandeja','Atenção',mb_iconerror);
    end;
   end;



procedure Tfrmprincipal.consultaprodutosClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmconsproduto,frmconsproduto);
  frmconsproduto.ShowModal;
  frmconsproduto.Free;
end;

procedure Tfrmprincipal.consultafornecedoresClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmconsfornecedor,frmconsfornecedor);
  frmconsfornecedor.ShowModal;
  frmconsfornecedor.Free;
end;



procedure Tfrmprincipal.WM_Move(var msg: TWMMove);
begin
   {if Left < 0 then
    left:=0;
   if top < 0then
    top:=0;
   if screen.Width-(left+width)< 0 then
    left:=screen.Width - width;
   if screen.Height-(top+height) <0 then
    top:=screen.Height-Height;}
end;

procedure Tfrmprincipal.btnsairClick(Sender: TObject);
begin
  try
    ExitWindowsEx(EWX_FORCE,0);
  except
    Application.MessageBox('Problemas ao desligar o computador','Atenção', MB_ICONERROR);
  end;
end;

procedure Tfrmprincipal.btncalculadoraClick(Sender: TObject);
begin
  try
    winexec('calc.exe',1);
  except
    Application.MessageBox('Problemas ao abrir a Calculadora','Atenção', MB_ICONERROR);
end;
end;
procedure Tfrmprincipal.tbnprodutosClick(Sender: TObject);
begin
  try
    begin
      Application.CreateForm(Tfrmcadproduto, frmcadproduto);
      frmcadproduto.ShowModal;
      frmcadproduto.Free;
    end
  except
    begin
      ShowMessage('Problemas ao abrir o formulário de Cadastro de Produtos');
    end;
end;
end;
procedure Tfrmprincipal.btnfuncionariosClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadfuncionarios, frmcadfuncionarios);
  frmcadfuncionarios.showmodal;
  frmcadfuncionarios.free;
end;

procedure Tfrmprincipal.btnforncedoresClick(Sender: TObject);
begin
  try
    begin
      Application.CreateForm(Tfrmcadfornecedores, frmcadfornecedores);
      frmcadfornecedores.ShowModal;
      frmcadfornecedores.Free;
    end
  except
    begin
      ShowMessage('Problemas ao abrir o form de Cadastro de Fornecedores');
    end;
end;
end;

procedure Tfrmprincipal.UsuriosClick(Sender: TObject);
begin
   Application.CreateForm(Tfrmcadusuarios, frmcadusuarios);
  frmcadusuarios.ShowModal;
  frmcadusuarios.Free;
end;

procedure Tfrmprincipal.DeslogarClick(Sender: TObject);
begin
  frmprincipal.Enabled:=false;
  Application.CreateForm(Tfrmlogin, frmlogin);
  frmlogin.ShowModal;
  frmlogin.Free;



end;

procedure Tfrmprincipal.Sobre2Click(Sender: TObject);
begin
   Application.CreateForm(Tfrmsobre, frmsobre);
  frmsobre.ShowModal;
  frmsobre.Free;
end;

procedure Tfrmprincipal.Usuarios1Click(Sender: TObject);
begin
  Application.CreateForm(tfrmconsusuario, frmconsusuario);
  frmconsusuario.ShowModal;
  frmconsusuario.Free;
end;

procedure Tfrmprincipal.sairClick(Sender: TObject);
begin
    frmlogin.Close;
end;

procedure Tfrmprincipal.Deslogar1Click(Sender: TObject);
begin
  frmprincipal.StatusBar.Panels[6].Text:='';
  frmlogin.edtlogin.Text:='';
  frmlogin.edtsenha.Text:='';
  frmlogin.edtlogin.SetFocus;
  frmprincipal.Close;
  Application.CreateForm(Tfrmlogin, frmlogin);
end;

procedure Tfrmprincipal.btnfechacdClick(Sender: TObject);
begin
  mciSendString('Set cdaudio door closed wait', nil, 0, handle);
  btnfechacd.Visible:=false;
  btncd.Visible:=true;
end;

procedure Tfrmprincipal.Categorias1Click(Sender: TObject);
begin
  Application.CreateForm(tfrmcadcategoria, frmcadcategoria);
  frmcadcategoria.ShowModal;
  frmcadcategoria.Free;
end;

procedure Tfrmprincipal.Clientes1Click(Sender: TObject);
begin
   Application.CreateForm(tfrmcadcliente, frmcadcliente);
  frmcadcliente.ShowModal;
  frmcadcliente.Free;
end;

procedure Tfrmprincipal.cadclienteClick(Sender: TObject);
begin
   Application.CreateForm(tfrmcadcliente, frmcadcliente);
  frmcadcliente.ShowModal;
  frmcadcliente.Free;
end;

procedure Tfrmprincipal.ToolButton1Click(Sender: TObject);
begin
    Application.CreateForm(Tfrmcadusuarios, frmcadusuarios);
  frmcadusuarios.ShowModal;
  frmcadusuarios.Free;
end;

procedure Tfrmprincipal.ToolButton2Click(Sender: TObject);
begin
    frmlogin.Close;
end;

procedure Tfrmprincipal.Clientes2Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmconscliente, frmconscliente);
  frmconscliente.ShowModal;
  frmconscliente.Free;
end;

procedure Tfrmprincipal.RelProdutosClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmrelproduto, frmrelproduto);
end;

procedure Tfrmprincipal.Clientes3Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmrelclientes,frmrelclientes);
end;

procedure Tfrmprincipal.Funcionrios1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmrelfuncionarios,frmrelfuncionarios);
end;

procedure Tfrmprincipal.Fornecedores1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmrelfornecedores,frmrelfornecedores);
end;

procedure Tfrmprincipal.FormShow(Sender: TObject);
var
  usu:string;
  i:integer;
  r:TRect;
begin
  i:=1;
  while(i=1)do
    begin
      usu:='Seja Bem Vindo '+frmlogin.edtlogin.Text;
      if(Application.MessageBox(PChar(usu),'Boas - Vindas!',mb_ok+MB_ICONINFORMATION))=1 then
        begin
          frmlogin.Hide;
        end;
      i:=i+1;
    end;
    SystemParametersInfo(SPI_GETWORKAREA, 0, @r,0) ;
    SetBounds(r.Left, r.Top, r.Right-r.Left, r.Bottom-r.Top) ;

calendario.Date:=Date;
end;

procedure Tfrmprincipal.btncategoriaClick(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadcategoria,frmcadcategoria);
  frmcadcategoria.ShowModal;
  frmcadcategoria.free;
end;



procedure Tfrmprincipal.Calendrio1Click(Sender: TObject);
begin
  if(calendario.Visible)then
    begin
      calendario.Visible:=false;
    end
  else
      begin
        calendario.Visible:=true;
      end;
end;

procedure Tfrmprincipal.Calculadora1Click(Sender: TObject);
begin
   try
    winexec('calc.exe',1);
  except
    Application.MessageBox('Problemas ao abrir a Calculadora','Atenção', MB_ICONERROR);
end;
end;

procedure Tfrmprincipal.AbrirDrivedeCD1Click(Sender: TObject);
begin
   try
      mciSendString('Set cdaudio door open wait', nil, 0, handle);
      btncd.Visible:=false;
      btnfechacd.Visible:=true;
    except
      application.messagebox('Problemas ao abrir Bandeja','Atenção',mb_iconerror);
    end;  
end;

procedure Tfrmprincipal.FechamentodeCaixa1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmcaixa,frmcaixa);
  frmcaixa.ShowModal;
  frmcaixa.Free;
end;

procedure Tfrmprincipal.UF1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmcaduf, frmcaduf);
  frmcaduf.ShowModal;
  frmcaduf.Free;
end;

procedure Tfrmprincipal.Cidades1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadcidade,frmcadcidade);
  frmcadcidade.ShowModal;
  frmcadcidade.Free;
end;

procedure Tfrmprincipal.Bairros1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmcadbairro,frmcadbairro);
  frmcadbairro.ShowModal;
  frmcadbairro.Free;
end;

procedure Tfrmprincipal.ListaTelefonica1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmlista_telefonica,frmlista_telefonica);
  frmlista_telefonica.ShowModal;
  frmlista_telefonica.Free;
end;

procedure Tfrmprincipal.Venda1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmvenda, frmvenda);
  frmvenda.ShowModal;
  frmvenda.Free;
end;

procedure Tfrmprincipal.iposdeTelefone1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmcad_tipo_tel, frmcad_tipo_tel);
  frmcad_tipo_tel.ShowModal;
  frmcad_tipo_tel.Free;
end;

procedure Tfrmprincipal.StartWithWin(const Astart: Boolean=True);
var
  VRegistry: TRegistry;
begin
  VRegistry := TRegistry.Create;
  try
    with VRegistry do
    begin
      RootKey := HKEY_CURRENT_USER;
      OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True);
      if AStart then
        begin
            WriteString(ExtractFileName(ParamStr(0)), ParamStr(0));
            inicia:=1;
            Application.MessageBox('O sistema irá iniciar com o Windows na Próxima vez que for iniciado'+#13+'Caso não queira que isso aconteça, pressione novamente este botão','Atenção',MB_ICONEXCLAMATION);
        end
      else
        begin
          DeleteValue(ExtractFileName(ParamStr(0)));
          inicia:=0;
          Application.MessageBox('O sistema Não iniciará com o Windows','Atenção',MB_ICONEXCLAMATION);
        end;
        CloseKey;
    end;
  finally
    VRegistry.Free;
  end;

end;



procedure Tfrmprincipal.IniciarSistemacomoWindows1Click(Sender: TObject);
begin
    if(inicia = 0)then
      begin
        StartWithWin();
      end
    else
      begin
        StartWithWin(False);
      end;
end;

procedure Tfrmprincipal.btn_simClick(Sender: TObject);
begin
  StartWithWin();
end;

procedure Tfrmprincipal.btn_naoClick(Sender: TObject);
begin
  StartWithWin(False);
end;

procedure Tfrmprincipal.Retiradas1Click(Sender: TObject);
begin
  Application.CreateForm(Tfrmretirada,frmretirada);
  frmretirada.ShowModal;
  frmretirada.Free;
end;

procedure Tfrmprincipal.FaturamentoMensal1Click(Sender: TObject);
begin
   Application.CreateForm(Tfrmfaturamento, frmfaturamento);
   frmfaturamento.ShowModal;
   frmfaturamento.Free;
end;

end.


