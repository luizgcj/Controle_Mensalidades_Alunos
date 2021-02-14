unit Funcoes;


interface

Uses SysUtils, Vcl.Mask, FireDac.Comp.Client;

Type  TFuncoes = class abstract
  public
    class procedure CarregaMascaraTelefone(Telefone : TMaskedit; key:Integer);
    class function AutoIncremento(sTabela, sCampo : String; ConexaoBanco : TFDConnection) : Integer;
    class function LimpaMascaraNumero(pStr:String): String;
end;

implementation

class procedure TFuncoes.CarregaMascaraTelefone(Telefone : TMaskedit; key:Integer);
var
  campo : string;
begin
  if (key <> 37) and (key <> 38) and (key <> 39)  and (key <> 40) and (key <> 8) then
  begin
    Telefone.EditMask := '';
    campo := trim(Telefone.Text);
    Telefone.Text := '';
     if (Length(trim(campo)) =10) then
        Telefone.EditMask := '!\(##\) ####\-####;0; ';

     if (Length(trim(campo)) >10) then
      Telefone.EditMask := '!\(##\) #####\-####;0; ';

     if (Length(trim(campo)) =9) then
        Telefone.EditMask := '!\(##\) #####\-####;0; ';


     if (Length(trim(campo)) <=8) then
        Telefone.EditMask := '!\(##\) ####\-####;0; ';

      Telefone.Text := campo;
  END;
end;

class function TFuncoes.AutoIncremento(sTabela, sCampo : String; ConexaoBanco : TFDConnection): Integer;
var
  vQuery : TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  vQuery.Connection := ConexaoBanco;
  vQuery.SQL.Add('SELECT MAX(' + sCampo + ') AS ULTIMO FROM ' + sTabela);
  vQuery.Open();
  result := vQuery.FieldByName('ULTIMO').AsInteger + 1;
end;

class function TFuncoes.LimpaMascaraNumero(pStr:String): String;
Var
I: Integer;
begin
  Result := '';
  For I := 1 To Length(pStr) do
   If pStr[I] In ['1','2','3','4','5','6','7','8','9','0'] Then
     Result := Result + pStr[I];
End;


end.
