program GestaoAluno;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {FrPrincipal},
  ListaCadCliente in 'ListaCadCliente.pas' {FrListaCadCliente},
  ModulodeDados in 'ModulodeDados.pas' {DMDados: TDataModule},
  CadCliente in 'CadCliente.pas' {FrCadCliente},
  Funcoes in 'Funcoes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrPrincipal, FrPrincipal);
  Application.CreateForm(TFrListaCadCliente, FrListaCadCliente);
  Application.CreateForm(TDMDados, DMDados);
  Application.CreateForm(TFrCadCliente, FrCadCliente);
  Application.Run;
end.
