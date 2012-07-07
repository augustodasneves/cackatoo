unit Ucadastro_func;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls;

type
  Tfrmcadfuncionarios = class(TForm)
    DataSource1: TDataSource;
    btn_cad_func: TBitBtn;
    btncancelarfunc: TBitBtn;
    btnfecharcadfunc: TBitBtn;
    procedure btnfecharcadfuncClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadfuncionarios: Tfrmcadfuncionarios;

implementation

uses Umd;

{$R *.dfm}

procedure Tfrmcadfuncionarios.btnfecharcadfuncClick(Sender: TObject);
begin
  if(Application.MessageBox('Deseja realmente sair?','Atenção',MB_YESNO+MB_ICONQUESTION)=idyes)then
  begin
    Close;
  end;
end;

end.
