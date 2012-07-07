unit Usobre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons;

type
  Tfrmsobre = class(TForm)
    imgsobre: TImage;
    btnok: TBitBtn;
    procedure btnokClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsobre: Tfrmsobre;

implementation

{$R *.dfm}

procedure Tfrmsobre.btnokClick(Sender: TObject);
begin
  frmsobre.Close;
end;

end.
