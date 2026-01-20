unit Usuario.Repository;

interface

uses
  System.SysUtils, FireDAC.Comp.Client, Data.DB, FireDAC.Stan.Param,
  Usuario.Entidade,  Usuario.Interfaces, Conexao.Dados, Sessao.Usuario;

type
  TUsuarioRepository = class(TInterfacedObject, IUsuarioRepository)
  private
    FConexao: TFDConnection;
  public
    constructor Create;
    function BuscarPorLogin(const pLogin: string): TUsuarioEntidade;
  end;

implementation

uses
  FireDAC.DApt, FireDAC.Stan.Async;

{ TUsuarioRepository }

constructor TUsuarioRepository.Create;
begin
  FConexao := TDataProvider.ObterInstancia.GetConexao;
end;

function TUsuarioRepository.BuscarPorLogin(const pLogin: string): TUsuarioEntidade;
var
  lQuery: TFDQuery;
begin
  Result := nil;
  lQuery := nil;

  try
    lQuery := TFDQuery.Create(nil);
    lQuery.Connection := FConexao;
    lQuery.SQL.Add('SELECT ID, NOME, EMAIL, LOGIN, SENHA, ATIVO');
    lQuery.SQL.Add('  FROM USUARIOS');
    lQuery.SQL.Add(' WHERE LOGIN = :LOGIN');
    lQuery.Params.ParamByName('LOGIN').AsString := pLogin;
    lQuery.Open;

    if not lQuery.IsEmpty then
    begin
      Result := TUsuarioEntidade.Create;
      Result.ID :=    lQuery.Fields.FieldByName('ID').AsInteger;
      Result.Nome :=  lQuery.Fields.FieldByName('NOME').AsString;
      Result.Email := lQuery.Fields.FieldByName('EMAIL').AsString;
      Result.Login := lQuery.Fields.FieldByName('LOGIN').AsString;
      Result.Senha := lQuery.Fields.FieldByName('SENHA').AsString;
      Result.Ativo := lQuery.FieldByName('ATIVO').AsString = 'S';
    end;
  finally
    lQuery.Free;
  end;
end;

end.
