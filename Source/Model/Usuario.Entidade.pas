unit Usuario.Entidade;

interface

uses
  System.StrUtils, System.SysUtils;

type

  TUsuarioEntidade = class
  private
    FID: Integer;
    FNome: string;
    FEmail: string;
    FLogin: string;
    FSenha: string;
    FAtivo: Boolean;

    function GetID: Integer;
    function GetNome: string;
    function GetEmail: string;
    function GetLogin: string;
    function GetSenha: string;
    function GetAtivo: Boolean;

    procedure SetID(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetLogin(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetAtivo(const Value: Boolean);
  public

    property ID: Integer read GetID write SetID;
    property Nome: string read GetNome write SetNome;
    property Email: string read GetEmail write SetEmail;
    property Login: string read GetLogin write SetLogin;
    property Senha: string read GetSenha write SetSenha;
    property Ativo: Boolean read GetAtivo write SetAtivo;
  end;

implementation

{ TUsuarioEntidade }

function TUsuarioEntidade.GetAtivo: Boolean;
begin
  Result := FAtivo;
end;

function TUsuarioEntidade.GetEmail: string;
begin
  Result := FEmail;
end;

function TUsuarioEntidade.GetID: Integer;
begin
  Result := FId;
end;

function TUsuarioEntidade.GetLogin: string;
begin
  Result := FLogin;
end;

function TUsuarioEntidade.GetNome: string;
begin
  Result := UpperCase(FNome);
end;

function TUsuarioEntidade.GetSenha: string;
begin
  Result := FSenha;
end;

procedure TUsuarioEntidade.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TUsuarioEntidade.SetEmail(const Value: string);
begin
  FEmail := Value.ToLower;
end;

procedure TUsuarioEntidade.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TUsuarioEntidade.SetLogin(const Value: string);
begin
  FLogin := Value;
end;

procedure TUsuarioEntidade.SetNome(const Value: string);
begin
  if Value.Trim.IsEmpty then
      raise Exception.Create('O nome não pode estar vazio.');
    FNome := Value;
end;

procedure TUsuarioEntidade.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

end.
