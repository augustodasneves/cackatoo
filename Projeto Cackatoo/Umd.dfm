object dm: Tdm
  OldCreateOrder = False
  Left = 294
  Height = 220
  Width = 229
  object dbconexao: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=root;Persist Security Info=True;User' +
      ' ID=root;Data Source=banco_agro'
    LoginPrompt = False
    Left = 80
    Top = 8
  end
  object tbusuarios: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'usuarios'
    Left = 80
    Top = 104
    object tbusuariosLogin: TStringField
      FieldName = 'Login'
    end
    object tbusuariosSenha: TStringField
      FieldName = 'Senha'
    end
  end
  object tbfuncionarios: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'funcionarios'
    Left = 24
    Top = 56
    object tbfuncionarioscod_funcionario: TAutoIncField
      FieldName = 'cod_funcionario'
      ReadOnly = True
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
      FixedChar = True
      Size = 12
    end
  end
  object tbprodutos: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'produto'
    Left = 80
    Top = 56
    object tbprodutoscod_prod: TAutoIncField
      FieldName = 'cod_prod'
      ReadOnly = True
    end
    object tbprodutosnome_prod: TStringField
      FieldName = 'nome_prod'
      Size = 100
    end
    object tbprodutosmarca: TStringField
      FieldName = 'marca'
      Size = 50
    end
    object tbprodutosvalor: TFloatField
      FieldName = 'valor'
    end
    object tbprodutosfornecedor: TStringField
      FieldName = 'fornecedor'
      Size = 100
    end
  end
  object tbforn: TADOTable
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'fornecedor'
    Left = 136
    Top = 56
    object tbforncod_forn: TAutoIncField
      FieldName = 'cod_forn'
      ReadOnly = True
    end
    object tbforncnpj: TStringField
      FieldName = 'cnpj'
      FixedChar = True
      Size = 15
    end
    object tbfornnome_forn: TStringField
      FieldName = 'nome_forn'
      Size = 100
    end
    object tbforntelefone_forn: TStringField
      FieldName = 'telefone_forn'
      FixedChar = True
      Size = 12
    end
    object tbfornemail: TStringField
      FieldName = 'email'
      Size = 50
    end
    object tbforncod_prod: TIntegerField
      FieldName = 'cod_prod'
    end
  end
  object tborc: TADOTable
    Active = True
    Connection = dbconexao
    CursorType = ctStatic
    TableName = 'orcamento'
    Left = 21
    Top = 102
    object tborccod_orc: TAutoIncField
      FieldName = 'cod_orc'
      ReadOnly = True
    end
    object tborcnome_prod: TStringField
      FieldName = 'nome_prod'
      Size = 100
    end
    object tborcvalor_orc: TFloatField
      FieldName = 'valor_orc'
    end
    object tborcdata_orc: TDateField
      FieldName = 'data_orc'
    end
  end
end
