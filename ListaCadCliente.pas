unit ListaCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDac.Comp.Client,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkroom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringtime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxNavigator,
  cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, dxSkinscxPCPainter;


type
  TFrListaCadCliente = class(TForm)
    Panel1: TPanel;
    btnIncluir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnFechar: TSpeedButton;
    Panel2: TPanel;
    btnAtualizar: TSpeedButton;
    DbListaClientesDBTableView1: TcxGridDBTableView;
    DbListaClientesLevel1: TcxGridLevel;
    DbListaClientes: TcxGrid;
    DbListaClientesDBTableViewCODIGO: TcxGridDBColumn;
    DbListaClientesDBTableViewNOME: TcxGridDBColumn;
    DbListaClientesDBTableViewENDERECO: TcxGridDBColumn;
    DbListaClientesDBTableViewNUMERO: TcxGridDBColumn;
    DbListaClientesDBTableViewCIDADE: TcxGridDBColumn;
    DbListaClientesDBTableViewUF: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure DbListaClientesDblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure ConsultaClientes;
  public
    { Public declarations }
  end;

var
  FrListaCadCliente: TFrListaCadCliente;

implementation

{$R *.dfm}

uses Principal, ModulodeDados, CadCliente, Funcoes;

procedure TFrListaCadCliente.FormShow(Sender: TObject);
begin
  ConsultaClientes();
end;

procedure TFrListaCadCliente.btnAtualizarClick(Sender: TObject);
begin
  ConsultaClientes();
end;

procedure TFrListaCadCliente.btnEditarClick(Sender: TObject);
begin
  if DbListaClientesDBTableView1.DataController.DataSource.DataSet.RecNo > 0 then
    DbListaClientesDblClick(Nil);
end;

procedure TFrListaCadCliente.btnExcluirClick(Sender: TObject);
var
  vQuery : TFDQuery;
begin
  if DbListaClientesDBTableView1.DataController.DataSource.DataSet.RecNo > 0 then
  begin
    if Application.MessageBox(PChar('Confirma exclus�o do Cliente: ' +
       DbListaClientesDBTableView1.DataController.DataSource.DataSet.FieldByName('NOME').AsString + ' ?'),
       'Aten��o', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
    begin
      vQuery := TFDQuery.Create(nil);
      vQuery.Connection := DMDados.FDCBaseDados;
      vQuery.SQL.Text := 'DELETE FROM CADCLIENTE WHERE CODIGO = :CODIGO';
      vQuery.ParamByName('CODIGO').AsInteger := DbListaClientesDBTableView1.DataController.DataSource.DataSet.FieldByName('CODIGO').AsInteger;
      vQuery.ExecSQL;
      FreeAndNil(vQuery);
      btnAtualizarClick(nil);
    end;
  end;
end;

procedure TFrListaCadCliente.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrListaCadCliente.btnIncluirClick(Sender: TObject);
begin
  FrCadCliente := TFrCadCliente.Create(Self);
  FrCadCliente.edtCodigo.Text := IntToStr(TFuncoes.AutoIncremento('CADCLIENTE','CODIGO',DMDados.FDCBaseDados));
  FrCadCliente.CarregarCidades();
  FrCadCliente.ShowModal;
  FrCadCliente.Release;
  btnAtualizarClick(nil);
end;

procedure TFrListaCadCliente.ConsultaClientes;
var
  DataSource : TDataSource;
  vQrClientes : TFDQuery;
begin
  DataSource := TDataSource.Create(nil);
  vQrClientes := TFDQuery.Create(nil);
  vQrClientes.Connection := DMDados.FDCBaseDados;

  DataSource.DataSet := vQrClientes;
  DbListaClientesDBTableView1.DataController.DataSource := DataSource;

  vQrClientes.SQL.Text := 'SELECT CLI.CODIGO, CLI.NOME, CLI.ENDERECO, CLI.NUMERO, CLI.BAIRRO,'
                        + ' CLI.CPF, CLI.RG, CLI.CEP, CLI.COMPLEMENTO, CLI.TELEFONE, CLI.CELULAR,'
                        + ' CLI.EMAIL, CLI.SEXO, CLI.ESTADOCIVIL, CLI.DATANASCIMENTO,'
                        + ' CID.DESCRICAO AS CIDADE, EST.UF'
                        + ' FROM CADCLIENTE CLI'
                        + ' INNER JOIN CIDADE CID ON CLI.CIDADE = CID.CODIGO'
                        + ' INNER JOIN ESTADO EST ON EST.CODIGO = CID.ESTADO'
                        + ' WHERE CLI.CODIGO > 0';
  vQrClientes.Open();


end;

procedure TFrListaCadCliente.DbListaClientesDblClick(Sender: TObject);
begin
  FrCadCliente := TFrCadCliente.Create(Self);
  FrCadCliente.CarregarCidades();
  FrCadCliente.AtribuirDados(TFDQuery(DbListaClientesDBTableView1.DataController.DataSource.DataSet));
  FrCadCliente.ShowModal;
  FrCadCliente.Release;
  btnAtualizarClick(nil);


end;

end.