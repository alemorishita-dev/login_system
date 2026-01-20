unit Usuario.Interfaces;

interface

uses
  System.SysUtils, Usuario.Entidade;

type
  IUsuarioRepository = interface
    ['{E23D70ED-1A22-46FE-9F06-418A45AE43CE}']
    function BuscarPorLogin(const pLogin: string): TUsuarioEntidade;
  end;

implementation

end.
