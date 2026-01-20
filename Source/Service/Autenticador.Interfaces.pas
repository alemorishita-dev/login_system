unit Autenticador.Interfaces;

interface

uses
  System.SysUtils;

type
  IAutenticador = interface
  ['{BCA7E463-F682-4071-A133-FFED02402BA5}']
    function ValidarAcesso(const pUsuario, pSenha: string): Boolean;
  end;

implementation

end.

