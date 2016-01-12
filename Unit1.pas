unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tcalc_double = function ( r: real ): real;stdcall;
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  hndDLLHandle: THandle;
  calc_double: Tcalc_double;
begin
    //загружаем динамически
    hndDLLHandle := loadLibrary ( 'dll2.dll' );
      // получаем адрес функции
      @calc_double := getProcAddress ( hndDLLHandle, 'calc_double' );
        showMessage ( floatToStr ( calc_double ( 10.2 ) ) );end;
end.
