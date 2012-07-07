unit Ucadfunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Mask, DBCtrls;

type
  Tfrmcadprodutos = class(TForm)
    Label1: TLabel;
    edtcodprod: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    edtnomeprod: TDBEdit;
    Label3: TLabel;
    edtmarcaprod: TDBEdit;
    Label4: TLabel;
    edtvalorprod: TDBEdit;
    Label5: TLabel;
    edtnomefornprod: TDBEdit;
    btncadprod: TBitBtn;
    btncancelaprod: TBitBtn;
    btnfechaprod: TBitBtn;
    procedure btnfechaprodClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcadprodutos: Tfrmcadprodutos;

implementation

uses Umd;

{$R *.dfm}

procedure Tfrmcadprodutos.btnfechaprodClick(Sender: TObject);
begin
  if(Application.MessageBox('Deseja realmente sair?','Atenção',MB_YESNO+MB_ICONQUESTION)=idyes)then
  begin
    Close;
  end;  
end;

end.
