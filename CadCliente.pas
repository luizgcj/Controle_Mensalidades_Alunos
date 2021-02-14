unit CadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.Buttons, FireDac.Comp.Client, StrUtils, DB;

type
  TFrCadCliente = class(TForm)
    PcCadCliente: TPageControl;
    Dados: TTabSheet;
    Historico: TTabSheet;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label11: TLabel;
    cbSexo: TComboBox;
    cbEstadoCivil: TComboBox;
    edtRG: TEdit;
    mktCPF: TMaskEdit;
    mktCep: TMaskEdit;
    edtUF: TEdit;
    edtNumero: TEdit;
    edtEndereco: TEdit;
    edtNome: TEdit;
    edtCodigo: TEdit;
    cbCidade: TComboBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    mktTelefone: TMaskEdit;
    mktCelular: TMaskEdit;
    edtEmail: TEdit;
    Label15: TLabel;
    edtComplemento: TEdit;
    Panel1: TPanel;
    btnGravar: TBitBtn;
    btnExcluir: TBitBtn;
    btnDesistir: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    Label16: TLabel;
    mktDataNascimento: TMaskEdit;
    Label17: TLabel;
    edtBairro: TEdit;
    btnNovo: TBitBtn;
    procedure btnDesistirClick(Sender: TObject);
    procedure cbCidadeChange(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mktCelularEnter(Sender: TObject);
    procedure mktTelefoneEnter(Sender: TObject);
    procedure mktTelefoneExit(Sender: TObject);
    procedure mktCelularExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);

  private
    { Private declarations }
    function GravarDados():Boolean;
    function BuscarUF(iCodigo : Integer):String;
    function BuscarCodCidade(sCidade : String):Integer;
    function ValidaDados():Boolean;
    procedure ConsultaCliente(sMaiorMenor : String);
    procedure LimpaCampos();
  public
    { Public declarations }
    procedure AtribuirDados(Query : TFDQuery);
    procedure CarregarCidades();


  end;

var
  FrCadCliente: TFrCadCliente;

implementation

{$R *.dfm}

uses Funcoes, ModulodeDados;



procedure TFrCadCliente.btnAnteriorClick(Sender: TObject);
begin
  ConsultaCliente('<');
end;

procedure TFrCadCliente.btnDesistirClick(Sender: TObject);
begin
  Close;
end;

procedure TFrCadCliente.btnExcluirClick(Sender: TObject);
var
  vQuery : TFDQuery;
begin
  if Application.MessageBox('Tem certeza que deseja excluir este cadastro?','Aten��o',MB_ICONQUESTION + MB_YESNO) = IDYES then
  begin
    vQuery := TFDQuery.Create(nil);
    vQuery.Connection := DMDados.FDCBaseDados;
    vQuery.SQL.Text := 'DELETE FROM CADCLIENTE WHERE CODIGO = :CODIGO';
    vQuery.ParamByName('CODIGO').AsInteger := StrToInt(edtCodigo.Text);
    vQuery.ExecSQL;
    FreeAndNil(vQuery);
    Close;
  end;
end;

procedure TFrCadCliente.btnGravarClick(Sender: TObject);
begin
  if ValidaDados() then
    if GravarDados() then
      Close;
end;

procedure TFrCadCliente.btnNovoClick(Sender: TObject);
begin
  LimpaCampos();
  edtCodigo.Text := IntToStr(TFuncoes.AutoIncremento('CADCLIENTE','CODIGO',DMDados.FDCBaseDados));
  edtNome.SetFocus;
end;

procedure TFrCadCliente.btnProximoClick(Sender: TObject);
begin
  ConsultaCliente('>');
end;

procedure TFrCadCliente.AtribuirDados(Query : TFDQuery);
Var
  sEstadoCivil : String;
begin
  if not Query.Eof then
  begin
    edtCodigo.Text := Query.FieldByName('CODIGO').AsString;
    edtNome.Text := Query.FieldByName('NOME').AsString;
    edtEndereco.Text := Query.FieldByName('ENDERECO').AsString;
    edtNumero.Text := Query.FieldByName('NUMERO').AsString;
    edtBairro.Text := Query.FieldByName('BAIRRO').AsString;
    edtComplemento.Text := Query.FieldByName('COMPLEMENTO').AsString;
    mktCep.EditText := Query.FieldByName('CEP').AsString;
    cbCidade.ItemIndex := cbCidade.Items.IndexOf(Query.FieldByName('CIDADE').AsString);
    edtUF.Text := Query.FieldByName('UF').AsString;

    case AnsiIndexStr(Query.FieldByName('ESTADOCIVIL').AsString, ['S','C','V','D']) of
      0: sEstadoCivil := 'SOLTEIRO';
      1: sEstadoCivil := 'CASADO';
      2: sEstadoCivil := 'VIUVO';
      3: sEstadoCivil := 'DIVORCIADO';
    end;
    cbEstadoCivil.ItemIndex := cbEstadoCivil.Items.IndexOf(sEstadoCivil);

    if Query.FieldByName('SEXO').AsString = 'M' then
      cbSexo.ItemIndex := 0
    else
      cbSexo.ItemIndex := 1;

    if not Query.FieldByName('DATANASCIMENTO').IsNull then
      mktDataNascimento.Text := DateToStr(Query.FieldByName('DATANASCIMENTO').AsDateTime)
    else
      mktDataNascimento.Text := '';
    mktCPF.EditText := Query.FieldByName('CPF').AsString;
    edtRG.Text := Query.FieldByName('RG').AsString;
    if Query.FieldByName('TELEFONE').AsString <> '' then
    begin
      mktTelefone.EditMask := '';
      mktTelefone.EditText := Query.FieldByName('TELEFONE').AsString;
      TFuncoes.CarregaMascaraTelefone(mktTelefone, 0);
    end
    else
      mktTelefone.Text := '';
    if Query.FieldByName('CELULAR').AsString <> '' then
    begin
      mktCelular.EditMask := '';
      mktCelular.EditText := Query.FieldByName('CELULAR').AsString;
      TFuncoes.CarregaMascaraTelefone(mktCelular, 0);
    end
    else
      mktCelular.Text := '';

    edtEmail.Text := Query.FieldByName('EMAIL').AsString;

  end;
end;

procedure TFrCadCliente.CarregarCidades();
var
  vQuery : TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := DMDados.FDCBaseDados;
  vQuery.SQL.Text := 'SELECT C.DESCRICAO, C.ESTADO FROM CIDADE C INNER JOIN ESTADO E ON C.ESTADO = E.CODIGO';
  vQuery.Open();
  while not vQuery.Eof do
  begin
    cbCidade.Items.AddObject(vQuery.FieldByName('DESCRICAO').AsString,TObject(vQuery.FieldByName('ESTADO').AsInteger));
    vQuery.Next;
  end;


end;

procedure TFrCadCliente.cbCidadeChange(Sender: TObject);
begin
  edtUF.Text := BuscarUF(Integer(cbCidade.Items.Objects[cbCidade.ItemIndex]));
end;

procedure TFrCadCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;
end;

procedure TFrCadCliente.FormShow(Sender: TObject);
begin
  PcCadCliente.TabIndex := 0;
  edtNome.SetFocus;

end;

function TFrCadCliente.BuscarUF(iCodigo : Integer):String;
var
  vQuery : TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := DMDados.FDCBaseDados;
  vQuery.SQL.Text := 'SELECT UF FROM ESTADO WHERE CODIGO = :CODIGO';
  vQuery.ParamByName('CODIGO').AsInteger := iCodigo;
  vQuery.Open();
  result := vQuery.FieldByName('UF').AsString;
  FreeAndNil(vQuery);
end;

function TFrCadCliente.BuscarCodCidade(sCidade : String):Integer;
var
  vQuery : TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := DMDados.FDCBaseDados;
  vQuery.SQL.Text := 'SELECT CODIGO FROM CIDADE WHERE DESCRICAO = :DESCRICAO';
  vQuery.ParamByName('DESCRICAO').AsString := sCidade;
  vQuery.Open();
  result := vQuery.FieldByName('CODIGO').AsInteger;
  FreeAndNil(vQuery);
end;

function TFrCadCliente.GravarDados():Boolean;
var
  vQuery : TFDQuery;
begin
  try
    vQuery := TFDQuery.Create(nil);
    vQuery.Connection := DMDados.FDCBaseDados;
    vQuery.SQL.Text := 'UPDATE OR INSERT INTO CADCLIENTE'
     + ' (CODIGO, NOME, ENDERECO, NUMERO, BAIRRO, CIDADE, CPF, RG, DATANASCIMENTO,'
     + ' ESTADOCIVIL, CEP, SEXO, COMPLEMENTO, TELEFONE, CELULAR, EMAIL)'
     + ' VALUES '
     + ' (:CODIGO, :NOME, :ENDERECO, :NUMERO, :BAIRRO, :CIDADE, :CPF, :RG, :DATANASCIMENTO,'
     + ' :ESTADOCIVIL, :CEP, :SEXO, :COMPLEMENTO, :TELEFONE, :CELULAR, :EMAIL)';
     vQuery.ParamByName('CODIGO').AsInteger := StrToInt(edtCodigo.Text);
     vQuery.ParamByName('NOME').AsString := Trim(edtNome.Text);
     vQuery.ParamByName('ENDERECO').AsString := Trim(edtEndereco.Text);
     vQuery.ParamByName('NUMERO').AsString := Trim(edtNumero.Text);
     vQuery.ParamByName('BAIRRO').AsString := Trim(edtBairro.Text);
     vQuery.ParamByName('CIDADE').AsInteger := BuscarCodCidade(cbCidade.Text);
     vQuery.ParamByName('CPF').AsString := Trim(mktCPF.Text);
     vQuery.ParamByName('RG').AsString := Trim(edtRG.Text);
     if mktDataNascimento.Text <> '  /  /    ' then
       vQuery.ParamByName('DATANASCIMENTO').AsDateTime := StrToDateTime(mktDataNascimento.Text)
     else
     begin
       vQuery.ParamByName('DATANASCIMENTO').DataType := ftDateTime;
       vQuery.ParamByName('DATANASCIMENTO').Value := null;
     end;
     if cbEstadoCivil.ItemIndex >= 0 then
       vQuery.ParamByName('ESTADOCIVIL').AsString := Copy(cbEstadoCivil.Text,1,1)
     else
     begin
       vQuery.ParamByName('ESTADOCIVIL').DataType := ftString;
       vQuery.ParamByName('ESTADOCIVIL').Value := null;
     end;

     vQuery.ParamByName('CEP').AsString := Trim(TFuncoes.LimpaMascaraNumero(mktCep.Text));
     vQuery.ParamByName('SEXO').AsString :=  Copy(cbSexo.Text,1,1);
     vQuery.ParamByName('COMPLEMENTO').AsString := Trim(edtComplemento.Text);
     mktTelefone.EditMask := '';
     vQuery.ParamByName('TELEFONE').AsString := Trim(mktTelefone.Text);
     mktCelular.EditMask := '';
     vQuery.ParamByName('CELULAR').AsString := Trim(mktCelular.Text);
     vQuery.ParamByName('EMAIL').AsString := Trim(edtEmail.Text);
     vQuery.ExecSQL;
     Close;
  except
    on e:Exception do
    begin
      Application.MessageBox('Erro ao gravar cliente, reinicialize o sistema e tente novamente.','Aten��o',MB_ICONEXCLAMATION);
      Result := False;
      Exit;
    end;
  end;
  result := True;

end;

procedure TFrCadCliente.mktCelularEnter(Sender: TObject);
begin
  mktCelular.EditMask := '';
end;

procedure TFrCadCliente.mktCelularExit(Sender: TObject);
begin
  TFuncoes.CarregaMascaraTelefone(mktCelular,0);
end;

procedure TFrCadCliente.mktTelefoneEnter(Sender: TObject);
begin
  mktTelefone.EditMask := '';
end;

procedure TFrCadCliente.mktTelefoneExit(Sender: TObject);
begin
  TFuncoes.CarregaMascaraTelefone(mktTelefone,0);
end;

function TFrCadCliente.ValidaDados():Boolean;
begin
  if Trim(edtNome.Text) = '' then
  begin
    Application.MessageBox('Nome inv�lido.','Aten��o',MB_ICONEXCLAMATION);
    edtNome.SetFocus;
    result := False;
    Exit;
  end;
  if Trim(edtEndereco.Text) = '' then
  begin
    Application.MessageBox('Endere�o inv�lido.','Aten��o',MB_ICONEXCLAMATION);
    edtEndereco.SetFocus;
    result := False;
    Exit;
  end;
  if cbCidade.ItemIndex < 0 then
  begin
    Application.MessageBox('Cidade inv�lida.','Aten��o',MB_ICONEXCLAMATION);
    cbCidade.SetFocus;
    result := False;
    Exit;
  end;
  Result := True;
end;

procedure TFrCadCliente.ConsultaCliente(sMaiorMenor : String);
var
  vQuery : TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := DMDados.FDCBaseDados;
  vQuery.SQL.Text := 'SELECT FIRST 1 CLI.CODIGO, CLI.NOME, CLI.ENDERECO, CLI.NUMERO, CLI.BAIRRO,'
                        + ' CLI.CPF, CLI.RG, CLI.CEP, CLI.COMPLEMENTO, CLI.TELEFONE, CLI.CELULAR,'
                        + ' CLI.EMAIL, CLI.SEXO, CLI.ESTADOCIVIL, CLI.DATANASCIMENTO,'
                        + ' CID.DESCRICAO AS CIDADE, EST.UF'
                        + ' FROM CADCLIENTE CLI'
                        + ' INNER JOIN CIDADE CID ON CLI.CIDADE = CID.CODIGO'
                        + ' INNER JOIN ESTADO EST ON EST.CODIGO = CID.ESTADO'
                        + ' WHERE CLI.CODIGO' + sMaiorMenor + ' ' + edtCodigo.Text;
  if sMaiorMenor = '<' then
    vQuery.SQL.Add('ORDER BY CLI.CODIGO DESC')
  else
    vQuery.SQL.Add('ORDER BY CLI.CODIGO');
  vQuery.Open();
  AtribuirDados(vQuery);
end;

procedure TFrCadCliente.LimpaCampos();
begin
  edtCodigo.Text := '';
  edtNome.Text := '';
  edtEndereco.Text := '';
  edtNumero.Text := '';
  edtBairro.Text := '';
  edtComplemento.Text := '';
  mktCep.Text := '';
  cbCidade.ItemIndex := -1;
  edtUF.Text := '';
  cbEstadoCivil.ItemIndex := -1;
  cbSexo.ItemIndex := -1;
  mktDataNascimento.Text := '';
  mktCPF.Text := '';
  edtRG.Text := '';
  mktTelefone.Text := '';
  mktCelular.Text := '';
  edtEmail.Text := '';
end;

end.
