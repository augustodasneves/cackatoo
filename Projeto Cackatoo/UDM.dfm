object DM: TDM
  OldCreateOrder = False
  Left = 182
  Top = 20
  Height = 438
  Width = 549
  object dbconexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=123456;Persist Security Info=True;Us' +
      'er ID=root;Data Source=banco_agro;'
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object tbproduto: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'produto'
    Left = 104
    Top = 8
    object tbprodutoid_produto: TAutoIncField
      FieldName = 'id_produto'
      ReadOnly = True
    end
    object tbprodutofornecedor_id_fornecedor: TIntegerField
      FieldName = 'fornecedor_id_fornecedor'
    end
    object tbprodutoid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object tbprodutoid_categoria: TIntegerField
      FieldName = 'id_categoria'
    end
    object tbprodutonome_prod: TStringField
      FieldName = 'nome_prod'
      Size = 100
    end
    object tbprodutomarca: TStringField
      FieldName = 'marca'
      Size = 50
    end
    object tbprodutovalor_venda: TBCDField
      FieldName = 'valor_venda'
      currency = True
      Precision = 10
      Size = 2
    end
    object tbprodutodata_modificacao: TDateField
      FieldName = 'data_modificacao'
    end
    object tbprodutovalor_forn: TBCDField
      FieldName = 'valor_forn'
      currency = True
      Precision = 10
      Size = 2
    end
    object tbprodutoqtd: TIntegerField
      FieldName = 'qtd'
    end
    object tbprodutouni_medida: TStringField
      FieldName = 'uni_medida'
      Size = 50
    end
    object tbprodutoobservacao: TStringField
      FieldName = 'observacao'
      Size = 220
    end
    object tbprodutoestoque_minimo: TIntegerField
      FieldName = 'estoque_minimo'
    end
    object tbprodutoperecivel: TSmallintField
      FieldName = 'perecivel'
    end
    object tbprodutoprazo_validade: TDateField
      FieldName = 'prazo_validade'
    end
    object tbprodutocor: TStringField
      FieldName = 'cor'
      Size = 30
    end
  end
  object tbfuncionarios: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'funcionarios'
    Left = 168
    Top = 8
    object tbfuncionariosid_funcionario: TAutoIncField
      FieldName = 'id_funcionario'
      ReadOnly = True
    end
    object tbfuncionariosid_tipo_tel: TIntegerField
      FieldName = 'id_tipo_tel'
    end
    object tbfuncionariosnome_funcionario: TStringField
      FieldName = 'nome_funcionario'
      Size = 100
    end
    object tbfuncionariosdata_admissao: TDateField
      FieldName = 'data_admissao'
    end
    object tbfuncionariostelefone: TStringField
      FieldName = 'telefone'
      Size = 9
    end
    object tbfuncionariosddd: TStringField
      FieldName = 'ddd'
      FixedChar = True
      Size = 2
    end
    object tbfuncionariossexo: TStringField
      FieldName = 'sexo'
      FixedChar = True
      Size = 10
    end
    object tbfuncionariossalario_liquido: TBCDField
      FieldName = 'salario_liquido'
      currency = True
      Precision = 10
      Size = 2
    end
    object tbfuncionariossalario_bruto: TBCDField
      FieldName = 'salario_bruto'
      currency = True
      Precision = 10
      Size = 2
    end
    object tbfuncionariosdata_nascimento: TDateField
      FieldName = 'data_nascimento'
    end
  end
  object tbfornecedor: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'fornecedor'
    Left = 32
    Top = 64
    object tbfornecedorid_fornecedor: TAutoIncField
      FieldName = 'id_fornecedor'
      ReadOnly = True
    end
    object tbfornecedorid_tipo_tel: TIntegerField
      FieldName = 'id_tipo_tel'
    end
    object tbfornecedorid_bairro: TIntegerField
      FieldName = 'id_bairro'
    end
    object tbfornecedornome_fantasia: TStringField
      FieldName = 'nome_fantasia'
      Size = 100
    end
    object tbfornecedorrazao_social: TStringField
      FieldName = 'razao_social'
      Size = 100
    end
    object tbfornecedorcnpj: TStringField
      FieldName = 'cnpj'
      FixedChar = True
      Size = 15
    end
    object tbfornecedortelefone_forn: TStringField
      FieldName = 'telefone_forn'
      Size = 9
    end
    object tbfornecedoremail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object tbfornecedorendereco: TStringField
      FieldName = 'endereco'
      Size = 100
    end
    object tbfornecedornum: TStringField
      FieldName = 'num'
      Size = 5
    end
    object tbfornecedorfax: TStringField
      FieldName = 'fax'
      Size = 12
    end
    object tbfornecedorddd: TStringField
      FieldName = 'ddd'
      Size = 2
    end
    object tbfornecedorativo: TSmallintField
      FieldName = 'ativo'
    end
    object tbfornecedorinscricao: TStringField
      FieldName = 'inscricao'
      Size = 12
    end
  end
  object tbusuario: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'usuario'
    Left = 104
    Top = 64
    object tbusuarioid_usuario: TAutoIncField
      FieldName = 'id_usuario'
      ReadOnly = True
    end
    object tbusuariosenha: TStringField
      FieldName = 'senha'
      Size = 12
    end
    object tbusuariosenha_crip: TStringField
      FieldName = 'senha_crip'
      Size = 32
    end
    object tbusuarioid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object tbusuariologin: TStringField
      FieldName = 'login'
      Size = 50
    end
  end
  object tbnota_fiscal: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'venda'
    Left = 168
    Top = 64
    object tbnota_fiscalid_nf: TAutoIncField
      FieldName = 'id_nf'
      ReadOnly = True
    end
    object tbnota_fiscalid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object tbnota_fiscalid_cliente: TIntegerField
      FieldName = 'id_cliente'
    end
    object tbnota_fiscalvalor_orc: TBCDField
      FieldName = 'valor_orc'
      currency = True
      Precision = 10
      Size = 2
    end
    object tbnota_fiscaldata_orc: TDateField
      FieldName = 'data_orc'
    end
    object tbnota_fiscalhora: TTimeField
      FieldName = 'hora'
    end
    object tbnota_fiscaldesconto: TBCDField
      FieldName = 'desconto'
      currency = True
      Precision = 10
      Size = 2
    end
    object tbnota_fiscaltipo_documento: TStringField
      FieldName = 'tipo_documento'
      Size = 50
    end
  end
  object tbcategoria: TADOTable
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'categoria'
    Left = 232
    Top = 8
    object tbcategoriacategoria: TStringField
      FieldName = 'categoria'
      Size = 100
    end
    object tbcategoriaid_categoria: TAutoIncField
      FieldName = 'id_categoria'
      ReadOnly = True
    end
  end
  object tbcliente: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'cliente'
    Left = 232
    Top = 64
    object tbclienteid_cliente: TAutoIncField
      FieldName = 'id_cliente'
      ReadOnly = True
    end
    object tbclienteid_tipo_telefone: TIntegerField
      FieldName = 'id_tipo_telefone'
    end
    object tbclienteid_bairro: TIntegerField
      FieldName = 'id_bairro'
    end
    object tbclientenome_cliente: TStringField
      FieldName = 'nome_cliente'
      Size = 100
    end
    object tbclientetelefone: TStringField
      FieldName = 'telefone'
      Size = 9
    end
    object tbclienteendereco: TStringField
      FieldName = 'endereco'
      Size = 100
    end
    object tbclientenum: TStringField
      FieldName = 'num'
      Size = 5
    end
    object tbclienterg: TStringField
      FieldName = 'rg'
      Size = 12
    end
    object tbclientesexo: TStringField
      FieldName = 'sexo'
      Size = 10
    end
    object tbclienteddd: TStringField
      FieldName = 'ddd'
      Size = 2
    end
    object tbclientedata_nascimento: TDateField
      FieldName = 'data_nascimento'
    end
    object tbclienteativo: TSmallintField
      FieldName = 'ativo'
    end
    object tbclientecpf: TStringField
      FieldName = 'cpf'
      Size = 15
    end
    object tbclienteemail: TStringField
      FieldName = 'email'
      Size = 24
    end
  end
  object tbitens_venda: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'itens_venda'
    Left = 40
    Top = 128
    object tbitens_vendaid_item: TIntegerField
      FieldName = 'id_item'
    end
    object tbitens_vendaid_produto: TIntegerField
      FieldName = 'id_produto'
    end
    object tbitens_vendaid_nf: TIntegerField
      FieldName = 'id_nf'
    end
    object tbitens_vendavalor_unitario: TBCDField
      FieldName = 'valor_unitario'
      currency = True
      Precision = 10
      Size = 2
    end
    object tbitens_vendaqtd: TIntegerField
      FieldName = 'qtd'
    end
    object tbitens_vendasubtotal: TBCDField
      FieldName = 'subtotal'
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object tblog: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'log_eventos'
    Left = 104
    Top = 120
    object tblogid_log: TAutoIncField
      FieldName = 'id_log'
      ReadOnly = True
    end
    object tblogid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object tblogdata_hora: TStringField
      FieldName = 'data_hora'
      Size = 40
    end
    object tbloglocal_acesso: TStringField
      FieldName = 'local_acesso'
      Size = 50
    end
    object tblogoperacao: TStringField
      FieldName = 'operacao'
      Size = 100
    end
  end
  object tbentrega: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'entrega'
    Left = 280
    Top = 64
    object tbentregaid_entrega: TAutoIncField
      FieldName = 'id_entrega'
      ReadOnly = True
    end
    object tbentregaid_nf: TIntegerField
      FieldName = 'id_nf'
    end
    object tbentregaid_bairro: TIntegerField
      FieldName = 'id_bairro'
    end
    object tbentregahorario_entregue: TDateTimeField
      FieldName = 'horario_entregue'
    end
    object tbentregapendente: TSmallintField
      FieldName = 'pendente'
    end
  end
  object tbbairro: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'bairro'
    Left = 152
    Top = 255
    object tbbairroid_bairro: TAutoIncField
      FieldName = 'id_bairro'
      ReadOnly = True
    end
    object tbbairroid_cidade: TIntegerField
      FieldName = 'id_cidade'
    end
    object tbbairronome_bairro: TStringField
      FieldName = 'nome_bairro'
      Size = 75
    end
    object tbbairrovalor_entrega: TBCDField
      FieldName = 'valor_entrega'
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object tbcidade: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'cidade'
    Left = 24
    Top = 192
    object tbcidadeid_cidade: TAutoIncField
      FieldName = 'id_cidade'
      ReadOnly = True
    end
    object tbcidadeid_uf: TIntegerField
      FieldName = 'id_uf'
    end
    object tbcidadenome_cidade: TStringField
      FieldName = 'nome_cidade'
      Size = 75
    end
  end
  object tbuf: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'uf'
    Left = 104
    Top = 196
    object tbufid_uf: TAutoIncField
      FieldName = 'id_uf'
      ReadOnly = True
    end
    object tbufnome_uf: TStringField
      FieldName = 'nome_uf'
      Size = 100
    end
    object tbufsigla_uf: TStringField
      FieldName = 'sigla_uf'
      FixedChar = True
      Size = 3
    end
  end
  object tbtipo_telefone: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'tipo_telefone'
    Left = 192
    Top = 176
    object tbtipo_telefoneid_tipo: TAutoIncField
      FieldName = 'id_tipo'
      ReadOnly = True
    end
    object tbtipo_telefonenome_tipo: TStringField
      FieldName = 'nome_tipo'
      Size = 50
    end
  end
  object tb_a_vista: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'a_vista'
    Left = 168
    Top = 111
    object tb_a_vistaid_vista: TAutoIncField
      FieldName = 'id_vista'
      ReadOnly = True
    end
    object tb_a_vistaid_nf: TIntegerField
      FieldName = 'id_nf'
    end
    object tb_a_vistavalor_recebido: TBCDField
      FieldName = 'valor_recebido'
      currency = True
      Precision = 10
      Size = 2
    end
    object tb_a_vistatroco: TBCDField
      FieldName = 'troco'
      currency = True
      Precision = 10
      Size = 2
    end
  end
  object tbparcelado: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'parcela'
    Left = 232
    Top = 229
    object tbparceladoid_parcela: TAutoIncField
      FieldName = 'id_parcela'
      ReadOnly = True
    end
    object tbparceladoid_nf: TIntegerField
      FieldName = 'id_nf'
    end
    object tbparceladonro_parcelas: TIntegerField
      FieldName = 'nro_parcelas'
    end
    object tbparceladovalor_parcela: TBCDField
      FieldName = 'valor_parcela'
      Precision = 10
      Size = 2
    end
    object tbparceladodata_parcela: TDateField
      FieldName = 'data_parcela'
    end
  end
  object tbcaixa: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'caixa'
    Left = 344
    Top = 216
    object tbcaixaid_caixa: TAutoIncField
      FieldName = 'id_caixa'
      ReadOnly = True
    end
    object tbcaixaid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object tbcaixavalor: TBCDField
      FieldName = 'valor'
      currency = True
      Precision = 10
      Size = 2
    end
    object tbcaixadata_fechamento: TDateField
      FieldName = 'data_fechamento'
    end
    object tbcaixaobservacao: TStringField
      FieldName = 'observacao'
      Size = 200
    end
  end
  object tblista_telefonica: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'lista_telefonica'
    Left = 384
    Top = 168
    object tblista_telefonicaid_lista: TAutoIncField
      FieldName = 'id_lista'
      ReadOnly = True
    end
    object tblista_telefonicaid_tipo: TIntegerField
      FieldName = 'id_tipo'
    end
    object tblista_telefonicanome: TStringField
      FieldName = 'nome'
      Size = 255
    end
    object tblista_telefonicatelefone: TIntegerField
      FieldName = 'telefone'
    end
    object tblista_telefonicaddd: TIntegerField
      FieldName = 'ddd'
    end
  end
  object tbrenda_mensal: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'rendimento_mensal'
    Left = 312
    Top = 104
    object tbrenda_mensalid_mensal: TAutoIncField
      FieldName = 'id_mensal'
      ReadOnly = True
    end
    object tbrenda_mensalid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object tbrenda_mensalmes: TStringField
      FieldName = 'mes'
      Size = 100
    end
    object tbrenda_mensalvalor: TBCDField
      FieldName = 'valor'
      currency = True
      Precision = 10
      Size = 2
    end
    object tbrenda_mensalobservacoes: TStringField
      FieldName = 'observacoes'
      Size = 120
    end
  end
  object tbretirada: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'retiradas'
    Left = 304
    Top = 168
    object tbretiradaid_retirada: TAutoIncField
      FieldName = 'id_retirada'
      ReadOnly = True
    end
    object tbretiradaid_funcionario: TIntegerField
      FieldName = 'id_funcionario'
    end
    object tbretiradadata_retirada: TDateField
      FieldName = 'data_retirada'
    end
    object tbretiradavalor: TBCDField
      FieldName = 'valor'
      currency = True
      Precision = 10
      Size = 2
    end
    object tbretiradadestino: TStringField
      FieldName = 'destino'
      Size = 150
    end
    object tbretiradaobservacao: TStringField
      FieldName = 'observacao'
      Size = 120
    end
  end
  object tbMarca: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'marca'
    Left = 40
    Top = 240
  end
end
