program ProjetoLogin;

uses
  Vcl.Forms,
  Login.View in 'Source\View\Login.View.pas' {FormLogin},
  Autenticador.Interfaces in 'Source\Service\Autenticador.Interfaces.pas',
  Autenticador.BancoDados in 'Source\Service\Autenticador.BancoDados.pas',
  Sessao.Usuario in 'Source\Service\Sessao.Usuario.pas',
  Usuario.Entidade in 'Source\Model\Usuario.Entidade.pas',
  Conexao.Dados in 'Source\Providers\Conexao.Dados.pas',
  Usuario.Repository in 'Source\Repository\Usuario.Repository.pas',
  Usuario.Interfaces in 'Source\Repository\Usuario.Interfaces.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.Run;
end.
