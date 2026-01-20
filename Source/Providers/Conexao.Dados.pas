unit Conexao.Dados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef;

type
  TDataProvider = class
    Conexao: TFDConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
    constructor Create;
    class var FInstancia: TDataProvider;
    procedure ConfigurarConexao;
  public
    class function ObterInstancia: TDataProvider;
    class procedure Finalizar;

    function GetConexao: TFDConnection;
  end;

implementation

{ TDataProvider }

procedure TDataProvider.ConfigurarConexao;
begin
  Conexao.Params.Clear;
  Conexao.Params.DriverID := 'FB'; // Exemplo com Firebird
  //Conexao.Params.Database := 'C:\Dados\SEU_BANCO.FDB';
  Conexao.Params.Database := 'C:\Bases de Dados\login_system\BD_LOGIN.FDB';
  Conexao.Params.UserName := 'SYSDBA';
  Conexao.Params.Password := 'masterkey';

  Conexao.LoginPrompt := False;

  try
    Conexao.Connected := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao conectar ao banco de dados: ' + E.Message);
  end;
end;

constructor TDataProvider.Create;
begin
  Conexao := TFDConnection.Create(nil);
end;

procedure TDataProvider.DataModuleCreate(Sender: TObject);
begin
  ConfigurarConexao;
end;

class procedure TDataProvider.Finalizar;
begin
  if Assigned(FInstancia) then
    FreeAndNil(FInstancia);

end;

function TDataProvider.GetConexao: TFDConnection;
begin
  if not Conexao.Connected then
    Conexao.Connected := True;

  Result := Conexao;
end;

class function TDataProvider.ObterInstancia: TDataProvider;
begin
  if not Assigned(FInstancia) then
  begin
    FInstancia := TDataProvider.Create;
    FInstancia.ConfigurarConexao;
  end;

  Result := FInstancia;
end;

initialization

finalization
  TDataProvider.Finalizar;

end.
