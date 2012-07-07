program Prjcackatoo;

uses
  Forms,
  Ucackatoo in 'Ucackatoo.pas' {frmprincipal},
  UDM in 'UDM.pas' {DM: TDataModule},
  Ufrmcadfuncionario in 'Ufrmcadfuncionario.pas' {frmcadfuncionarios},
  Ucadfornecedor in 'Ucadfornecedor.pas' {frmcadfornecedores},
  Uconsultafunc in 'Uconsultafunc.pas' {frmconsfunc},
  Uconsproduto in 'Uconsproduto.pas' {frmconsproduto},
  Uconsfornecedor in 'Uconsfornecedor.pas' {frmconsfornecedor},
  Ufrmlogin in 'Ufrmlogin.pas' {frmlogin},
  Ucadusuario in 'Ucadusuario.pas' {frmcadusuarios},
  Usobre in 'Usobre.pas' {frmsobre},
  Uconsusuario in 'Uconsusuario.pas' {frmconsusuario},
  Ucadcategoria in 'Ucadcategoria.pas' {frmcadcategoria},
  Ucadcliente in 'Ucadcliente.pas' {frmcadcliente},
  Urelproduto in 'Urelproduto.pas' {frmrelproduto},
  Ufrmconscliente in 'Ufrmconscliente.pas' {frmconscliente},
  Ufrmrelclientes in 'Ufrmrelclientes.pas' {frmrelclientes},
  Ufrmrelfuncionarios in 'Ufrmrelfuncionarios.pas' {frmrelfuncionarios},
  Ufrmrelfornecedores in 'Ufrmrelfornecedores.pas' {frmrelfornecedores},
  Ucadproduto in 'Ucadproduto.pas' {frmcadproduto},
  Ucaixa in 'Ucaixa.pas' {frmcaixa},
  Ucaduf in 'Ucaduf.pas' {frmcaduf},
  Ucadcidade in 'Ucadcidade.pas' {frmcadcidade},
  Ucadbairro in 'Ucadbairro.pas' {frmcadbairro},
  Ulista_telefonica in 'Ulista_telefonica.pas' {frmlista_telefonica},
  Uvenda in 'Uvenda.pas' {frmvenda},
  Ucad_tipo_tel in 'Ucad_tipo_tel.pas' {frmcad_tipo_tel},
  Ucad_faturamento in 'Ucad_faturamento.pas' {frmfaturamento},
  Ucadretirada in 'Ucadretirada.pas' {frmretirada};
                                
{$R *.res}
          
begin                              
  Application.Initialize;
  Application.Title := 'Cackatoo - Ferragem e Agropecuária Lima Neves';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(Tfrmlogin, frmlogin);
  Application.CreateForm(Tfrmlista_telefonica, frmlista_telefonica);
  Application.CreateForm(Tfrmvenda, frmvenda);
  Application.CreateForm(Tfrmcad_tipo_tel, frmcad_tipo_tel);
  Application.CreateForm(Tfrmfaturamento, frmfaturamento);
  Application.CreateForm(Tfrmretirada, frmretirada);
  Application.Run;
end.
