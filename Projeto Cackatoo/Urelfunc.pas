unit Urelfunc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, ADODB;

type
  TForm1 = class(TForm)
    QuickRep1: TQuickRep;
    QRImage1: TQRImage;
    ADOQuery1: TADOQuery;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
