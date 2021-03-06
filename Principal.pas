unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList;

type
  TFrPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Sair1: TMenuItem;
    Cadastros1: TMenuItem;
    Cliente1: TMenuItem;
    Relatrios1: TMenuItem;
    RelaodeMensalidadesPagas2: TMenuItem;
    RelaodePendncias1: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrPrincipal: TFrPrincipal;

implementation

{$R *.dfm}

uses ListaCadCliente;

procedure TFrPrincipal.Cliente1Click(Sender: TObject);
begin
  FrListaCadCliente := TFrListaCadCliente.Create(Self);
  FrListaCadCliente.ShowModal;
  FrListaCadCliente.Release;
end;

end.
