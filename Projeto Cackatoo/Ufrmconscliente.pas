unit Ufrmconscliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, jpeg,
  Mask, DBCtrls;

type
  Tfrmconscliente = class(TForm)
    Image1: TImage;
    DBGrid1: TDBGrid;
    rgpop: TRadioGroup;
    edtnome: TEdit;
    edtcodigo: TEdit;
    btnconsultar: TBitBtn;
    btncancelar: TBitBtn;
    btnfechar: TBitBtn;
    edtendereco: TEdit;
    dsresultado: TDataSource;
    qconsulta: TADOQuery;
    btncadcli: TBitBtn;
    lblordenado: TLabel;
    lblquantidade: TLabel;
    btngera_rel: TButton;
    edtrg: TEdit;
    edtbairro: TDBLookupComboBox;
    dsbairro: TDataSource;
    dscod_area: TDataSource;
    combo_sexo: TComboBox;
    combo_cod_area: TDBLookupComboBox;
    qconsultaid_cliente: TAutoIncField;
    qconsultanome_bairro: TStringField;
    qconsultanome_cliente: TStringField;
    qconsultanome_tipo: TStringField;
    qconsultatelefone: TStringField;
    qconsultaendereco: TStringField;
    qconsultanum: TStringField;
    qconsultarg: TStringField;
    qconsultasexo: TStringField;
    qconsultaddd: TStringField;
    qconsultadata_nascimento: TDateField;
    qconsultaativo: TSmallintField;
    qconsultacpf: TStringField;
    qconsultaemail: TStringField;
    cons_ddd: TADOQuery;
    cons_dddddd: TStringField;
    cons_bairro: TADOQuery;
    cons_bairronome_bairro: TStringField;
    cons_bairroid_bairro: TAutoIncField;
    procedure btnconsultarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnfecharClick(Sender: TObject);
    procedure rgpopClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btncadcliClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btngera_relClick(Sender: TObject);
    procedure edtcodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edtrgKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmconscliente: Tfrmconscliente;
  texto:string;

implementation

uses Uconsfornecedor, Ucadcliente, Ufrmrelclientes;

{$R *.dfm}

procedure Tfrmconscliente.btnconsultarClick(Sender: TObject);
begin
  if((Length(edtrg.text))< 9)and (rgpop.ItemIndex=5) then
    begin
      Application.MessageBox('Verifique o campo RG, ele não deve ter menos de 9 caracteres','Atenção',MB_ICONWARNING);
    end
  else
    begin
   with qconsulta do
    begin
      Close;
      sql.Clear;
      case rgpop.ItemIndex of
        0:sql.Add('select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = bairro.id_bairro');

        1:sql.Add('select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = bairro.id_bairro and cliente.nome_cliente like '+QuotedStr(edtnome.Text+'%'));

        2:sql.Add('select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = bairro.id_bairro and cliente.id_cliente like ' +quotedstr(edtcodigo.text));

                  
        3:sql.Add('select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = bairro.id_bairro and cliente.endereco like '+Quotedstr(edtendereco.Text+'%'));

        4:sql.Add('select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = '+Quotedstr(edtbairro.KeyValue));





        5:SQL.Add('select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = bairro.id_bairro and cliente.rg like '+QuotedStr(edtrg.Text+'%'));

        6:SQL.Add('select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = bairro.id_bairro and cliente.sexo like '+QuotedStr(combo_sexo.Text));

        7:SQL.Add('select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = bairro.id_bairro and cliente.ddd like '+QuotedStr(combo_cod_area.Text));
      end;
      try
        texto:=sql.Text;
        open;
        if(qconsulta.RecordCount=0)then
          begin
            if(Application.MessageBox('Não há registro de clientes referente à consulta,'+ #13+ ' quer cadastrar um novo cliente agora?','Atenção',MB_YESNO+MB_ICONQUESTION)=idyes)then
              begin
                Application.CreateForm(Tfrmcadcliente,frmcadcliente);
                frmcadcliente.ShowModal;
                frmcadcliente.Free;
              end;
          end;
      except
        Application.MessageBox('Problemas ao Consultar!','Atenção',MB_ICONERROR+mb_OK);
        exit;
      end;
    end;
     if((rgpop.ItemIndex=0) and(qconsulta.RecordCount>1))then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Clientes cadastrados';
      end
    else if((qconsulta.RecordCount=1)and (rgpop.ItemIndex=0))then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Cliente Cadastrado';
      end
      else if(qconsulta.RecordCount=1)then
      begin
        lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Resultado para a Consulta';
      end
    else
      begin
       lblquantidade.Caption:='Há '+IntToStr(qconsulta.RecordCount)+' Resultados para a consulta';
      end;
    end;
end;

procedure Tfrmconscliente.btncancelarClick(Sender: TObject);
begin
  qconsulta.Close;
  qconsulta.SQL.Clear;
  qconsulta.SQL.Add('select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = bairro.id_bairro and cliente.id_cliente=-1');
  qconsulta.Open;
  frmconscliente.rgpop.ItemIndex:=0;
  frmconscliente.edtnome.Visible:=false;
  frmconscliente.edtcodigo.Visible:=false;
  frmconscliente.edtendereco.Visible:=false;
  frmconscliente.edtbairro.Visible:=false;
  frmconscliente.edtrg.Visible:=false;
  frmconscliente.DBGrid1.Refresh;
  lblquantidade.Caption:='';
end;

procedure Tfrmconscliente.btnfecharClick(Sender: TObject);
begin
    frmconscliente.Close;
end;

procedure Tfrmconscliente.rgpopClick(Sender: TObject);
begin
   case rgpop.ItemIndex of
    1:
      begin
        edtnome.Visible:=true;
        edtnome.Clear;
        edtnome.SetFocus;
        edtcodigo.Visible:=false;
        edtendereco.Visible:=false;
        edtbairro.Visible:=false;
        edtrg.Visible:=false;
        combo_sexo.Visible:=false;
        combo_cod_area.Visible:=false;
        btnconsultar.Default:=true;

      end;
    2:
      begin
        edtcodigo.Visible:=true;
        edtcodigo.Clear;
        edtcodigo.SetFocus;
        edtnome.Visible:=false;
        edtendereco.visible:=false;
        edtbairro.Visible:=false;
        edtrg.Visible:=false;
        combo_sexo.Visible:=false;
        combo_cod_area.Visible:=false;
        btnconsultar.Default:=true;
      end;
    3:
      begin
        edtendereco.Visible:=true;
        edtendereco.Clear;
        edtendereco.SetFocus;
        edtcodigo.Visible:=false;
        edtnome.Visible:=false;
        btnconsultar.Default:=true;
        edtrg.Visible:=false;
        combo_sexo.Visible:=false;
        combo_cod_area.Visible:=false;
        edtbairro.Visible:=false;
      end;
    4:
    begin
        edtendereco.Visible:=false;
        edtcodigo.Visible:=false;
        edtnome.Visible:=false;
        btnconsultar.Default:=true;
        combo_sexo.Visible:=false;
        edtbairro.Visible:=true;
        edtbairro.SetFocus;
        combo_cod_area.Visible:=false;
        edtrg.Visible:=false;
    end;
    5:
    begin
        edtendereco.Visible:=false;
        edtcodigo.Visible:=false;
        edtnome.Visible:=false;
        edtcodigo.Visible:=false;
        edtbairro.Visible:=false;
        edtrg.Visible:=true;
        edtrg.Clear;
        edtrg.SetFocus;
        combo_sexo.Visible:=false;
        combo_cod_area.Visible:=false;
        btnconsultar.Default:=true;
    end;
    6:
    begin
        edtendereco.Visible:=false;
        edtcodigo.Visible:=false;
        edtnome.Visible:=false;
        edtcodigo.Visible:=false;
        edtbairro.Visible:=false;
        edtrg.Visible:=false;
        combo_sexo.Visible:=true;
        combo_sexo.SetFocus;
        combo_cod_area.Visible:=false;
        btnconsultar.Default:=true;
    end;
    7:
      begin
        edtendereco.Visible:=false;
        edtcodigo.Visible:=false;
        edtnome.Visible:=false;
        edtcodigo.Visible:=false;
        edtbairro.Visible:=false;
        edtrg.Visible:=false;
        combo_cod_area.Visible:=true;
        combo_cod_area.SetFocus;
        combo_sexo.Visible:=false;
      end;
    {8:
      begin
        edtendereco.Visible:=false;
        edtcodigo.Visible:=false;
        edtnome.Visible:=false;
        edtcodigo.Visible:=false;
        edtbairro.Visible:=false;
        combo_sexo.Visible:=false;
        combo_cod_area.Visible:=true;
        combo_cod_area.SetFocus;
      end;}
    else
        edtnome.Visible:=false;
        edtcodigo.Visible:=false;
        edtendereco.Visible:=false;
        edtbairro.Visible:=false;
        edtrg.Visible:=false;
        combo_sexo.Visible:=false;
        combo_cod_area.Visible:=false;
    end;  
end;

procedure Tfrmconscliente.FormActivate(Sender: TObject);
begin
  edtnome.Visible:=false;
  edtcodigo.Visible:=false;
  edtbairro.Visible:=false;
  combo_cod_area.Visible:=false;
  combo_sexo.Visible:=false;
  btnconsultar.Click;
end;

procedure Tfrmconscliente.btncadcliClick(Sender: TObject);
begin
  Application.CreateForm(tfrmcadcliente, frmcadcliente);
  frmcadcliente.ShowModal;
  frmcadcliente.Free;
end;

procedure Tfrmconscliente.DBGrid1TitleClick(Column: TColumn);
var
campo:string;
cons:string;
i:integer;
begin
campo:=column.fieldname; // CAMPO RECEBE O NOME DA COLUNA CLICADA,
i:=1;
   while (i<10)and(dbgrid1.Columns.Items[i].FieldName <> campo)do
    begin
      i:=i+1;
    end;
  if texto = '' then
    begin
      cons := 'select cliente.id_cliente,'+
                  'cliente.nome_cliente,'+
                  'tipo_telefone.nome_tipo,'+
                  'cliente.ddd,'+
                  'cliente.telefone,'+
                  'bairro.nome_bairro,'+
                  'cliente.endereco,'+
                  'cliente.num,'+
                  'cliente.rg,'+
                  'cliente.sexo,'+
                  'cliente.data_nascimento,'+
                  'cliente.ativo,'+
                  'cliente.cpf,'+
                  'cliente.email'+
                  ' from cliente,tipo_telefone,bairro'+
                  ' where cliente.id_tipo_telefone = tipo_telefone.id_tipo'+
                  ' and cliente.id_bairro = bairro.id_bairro';
    end
  else
    begin
      cons := texto;
    end;
  application.processmessages; // para considerar algo que aconteça no dbgrid durante a entrada nesta procedure
  qconsulta.sql.clear; // LIMPA A QUERY
  qconsulta.sql.add(cons +' order by '+campo); // ESCREVE O SELECT COM O ORDER BY
  qconsulta.Open; // ABRE A QUERY COM A ORDEM ESCOLHIDA.
  lblordenado.caption:='Classificado por : [ '+Column.Title.Caption+' ]';
end;





procedure Tfrmconscliente.btngera_relClick(Sender: TObject);
begin
   if DBGrid1.FieldCount = 0 then
    begin
      if (Application.MessageBox('É necessário consultar para gerar um relatório','Atenção',MB_OK+MB_ICONERROR))=1 then
       begin
          rgpop.SetFocus;
       end;
   end
 else
   begin
      Application.CreateForm(Tfrmrelclientes,frmrelclientes);
      frmrelclientes.Free;
   end;
end;

procedure Tfrmconscliente.edtcodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;
procedure Tfrmconscliente.edtidadeKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;

procedure Tfrmconscliente.edtrgKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8, #13]) then
    begin
      Key := #0;
      ShowMessage('Este Campo aceita Somente Números');
    end;
end;

procedure Tfrmconscliente.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  With Application
Do CanClose := MessageBox ( 'Deseja fechar o formulário de consulta?',
PChar(Title),
mb_YesNo Or mb_IconQuestion ) = idYes
end;

end.
