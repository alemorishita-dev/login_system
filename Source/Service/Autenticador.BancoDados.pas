unit Autenticador.BancoDados;

interface

uses
  System.SysUtils,
  Autenticador.Interfaces,
  Usuario.Interfaces,
  Usuario.Entidade,
  Repository.Factory;

type
  TAutenticadorBancoDados = class(TInterfacedObject, IAutenticador)
    function ValidarAcesso(const pUsuario, pSenha: string): Boolean;
  end;

  TAutenticadorSimples = class(TInterfacedObject, IAutenticador)
    function ValidarAcesso(const pUsuario, pSenha: string): Boolean;
  end;

implementation

{ TAutenticadorBancoDados }

function TAutenticadorBancoDados.ValidarAcesso(const pUsuario, pSenha: string): Boolean;
var
  lRepository: IUsuarioRepository;
  lUsuarioEntidade: TUsuarioEntidade;
begin
  Result := False;

  lRepository := TRepositoryFactory.CriarUsuarioRepository;
  lUsuarioEntidade := lRepository.BuscarPorLogin(pUsuario);

  if Assigned(lUsuarioEntidade) then
  try
    Result := (lUsuarioEntidade.Senha = pSenha);
  finally
    lUsuarioEntidade.Free
  end;

end;

{ TAutenticadorSimples }

function TAutenticadorSimples.ValidarAcesso(const pUsuario, pSenha: string): Boolean;
begin
  Result := (pUsuario = 'admin') and (pSenha = '123');
end;

end.
