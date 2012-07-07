unit Ufrmlogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Mask, DBCtrls, StdCtrls, ADODB, Buttons, jpeg, ExtCtrls,
  Grids, DBGrids, IdBaseComponent, IdComponent, IdIPWatch, ComCtrls;

type
  Tfrmlogin = class(TForm)
    btnentrar: TBitBtn;
    verificaloginbanco: TADOQuery;
    DataSource1: TDataSource;
    Image1: TImage;
    btnsair: TBitBtn;
    gera_log: TADOQuery;
    DataSource2: TDataSource;
    IP: TIdIPWatch;
    gp_login: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtlogin: TEdit;
    edtsenha: TEdit;
    StatusBar: TStatusBar;
    Timer1: TTimer;
    procedure btnentrarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtsenhaKeyPress(Sender: TObject; var Key: Char);
    procedure edtloginClick(Sender: TObject);
    procedure edtloginEnter(Sender: TObject);
    procedure edtloginMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtloginExit(Sender: TObject);
    procedure edtloginKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtsenhaClick(Sender: TObject);
    procedure edtsenhaEnter(Sender: TObject);
    procedure edtsenhaExit(Sender: TObject);
    procedure edtsenhaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edtsenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnsairClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure login;
    { Public declarations }
  end;

var
  frmlogin: Tfrmlogin;

implementation

uses UDM, Ucackatoo;

{$R *.dfm}

procedure Tfrmlogin.btnentrarClick(Sender: TObject);
begin
  if (Edtlogin.text = '')or(Edtsenha.text ='') or (edtlogin.text='%')or(edtsenha.text='%')or(edtlogin.Text='%%')or(edtsenha.Text='%%') then
    begin
      Application.MessageBox('Preencha os campos de maneira adequada, por favor.','Erro!',MB_ICONError);
      Edtlogin.Clear;
      Edtsenha.Clear;
      Edtlogin.Setfocus;
    end
  else
    begin
      login;
    end;
  end;



procedure Tfrmlogin.login;
var
usu:string;

begin
usu:=frmlogin.edtlogin.text;
  with verificaloginbanco do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select id_usuario from usuario where login ='+QuotedStr(edtlogin.Text)+ ' and senha ='+QuotedStr(edtsenha.Text));
      Open;
  if verificaloginbanco.RecordCount>0 then
    begin
      Application.CreateForm(Tfrmprincipal,frmprincipal);
      frmprincipal.ShowModal;
      frmprincipal.StatusBar.Panels[6].Text:=usu;
      frmlogin.Close;
      verificaloginbanco.Close;
    end
  else
    begin
      Application.MessageBox('Nome de usuário e/ou senha inválidos!', 'Erro', MB_OK+MB_ICONERROR);
    end;

end;

end;

procedure Tfrmlogin.FormActivate(Sender: TObject);
begin
  edtlogin.SetFocus;
end;

procedure Tfrmlogin.edtsenhaKeyPress(Sender: TObject; var Key: Char);
begin
  btnentrar.Default:=true;
end;

procedure Tfrmlogin.edtloginClick(Sender: TObject);
begin
  edtlogin.color:=clMoneyGreen;
end;

procedure Tfrmlogin.edtloginEnter(Sender: TObject);
begin
  edtlogin.color:=clMoneyGreen;
end;

procedure Tfrmlogin.edtloginMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtlogin.color:=clMoneyGreen;  
end;

procedure Tfrmlogin.edtloginExit(Sender: TObject);
begin
  edtlogin.color:=clWindow;
end;

procedure Tfrmlogin.edtloginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtlogin.color:=clMoneyGreen;
end;

procedure Tfrmlogin.edtsenhaClick(Sender: TObject);
begin
  edtsenha.color:=clMoneyGreen;
end;

procedure Tfrmlogin.edtsenhaEnter(Sender: TObject);
begin
  edtsenha.color:=clMoneyGreen;
end;

procedure Tfrmlogin.edtsenhaExit(Sender: TObject);
begin
  edtsenha.color:=clWindow;
end;

procedure Tfrmlogin.edtsenhaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  edtsenha.color:=clMoneyGreen;
end;

procedure Tfrmlogin.edtsenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  edtsenha.color:=clMoneyGreen;
end;

procedure Tfrmlogin.btnsairClick(Sender: TObject);
begin
  frmlogin.Close;
end;

procedure Tfrmlogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   With Application
Do CanClose := MessageBox ( 'Deseja fechar a Aplicação?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

procedure Tfrmlogin.Timer1Timer(Sender: TObject);
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
  StatusBar.Panels[6].Text:='IP: '+IP.LocalIP;
  StatusBar.Panels[7].Text:='Nome na Rede: '+IP.LocalName;
end;



end.
