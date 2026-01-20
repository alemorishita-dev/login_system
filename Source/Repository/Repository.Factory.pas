unit Repository.Factory;

interface

uses
  System.SysUtils,
  Usuario.Repository,
  Usuario.Interfaces;

type
  TRepositoryFactory = class
  public
    class function CriarUsuarioRepository: IUsuarioRepository;
  end;

implementation

{ TRepositoryFactory }

class function TRepositoryFactory.CriarUsuarioRepository: IUsuarioRepository;
begin
  Result := TUsuarioRepository.Create;
end;

end.
