object FrCadCliente: TFrCadCliente
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Cliente'
  ClientHeight = 418
  ClientWidth = 706
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PcCadCliente: TPageControl
    Left = 0
    Top = 0
    Width = 706
    Height = 377
    ActivePage = Dados
    Align = alClient
    TabOrder = 0
    TabPosition = tpBottom
    object Dados: TTabSheet
      Caption = 'Dados Cadastrais'
      object Label2: TLabel
        Left = 32
        Top = 11
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label3: TLabel
        Left = 38
        Top = 44
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label4: TLabel
        Left = 20
        Top = 78
        Width = 49
        Height = 13
        Caption = 'Endere'#231'o:'
      end
      object Label5: TLabel
        Left = 448
        Top = 78
        Width = 41
        Height = 13
        Caption = 'N'#250'mero:'
      end
      object Label6: TLabel
        Left = 467
        Top = 146
        Width = 23
        Height = 13
        Caption = 'CEP:'
      end
      object Label7: TLabel
        Left = 46
        Top = 247
        Width = 23
        Height = 13
        Caption = 'CPF:'
      end
      object Label8: TLabel
        Left = 187
        Top = 247
        Width = 18
        Height = 13
        Caption = 'RG:'
      end
      object Label9: TLabel
        Left = 32
        Top = 179
        Width = 37
        Height = 13
        Caption = 'Cidade:'
      end
      object Label10: TLabel
        Left = 473
        Top = 179
        Width = 17
        Height = 13
        Caption = 'UF:'
      end
      object Label1: TLabel
        Left = 10
        Top = 213
        Width = 59
        Height = 13
        Caption = 'Estado Civil:'
      end
      object Label11: TLabel
        Left = 227
        Top = 213
        Width = 28
        Height = 13
        Caption = 'Sexo:'
      end
      object Label12: TLabel
        Left = 23
        Top = 281
        Width = 46
        Height = 13
        Caption = 'Telefone:'
      end
      object Label13: TLabel
        Left = 213
        Top = 281
        Width = 37
        Height = 13
        Caption = 'Celular:'
      end
      object Label14: TLabel
        Left = 41
        Top = 315
        Width = 28
        Height = 13
        Caption = 'Email:'
      end
      object Label15: TLabel
        Left = 0
        Top = 146
        Width = 69
        Height = 13
        Caption = 'Complemento:'
      end
      object Label16: TLabel
        Left = 392
        Top = 213
        Width = 100
        Height = 13
        Caption = 'Data de Nascimento:'
      end
      object Label17: TLabel
        Left = 37
        Top = 112
        Width = 32
        Height = 13
        Caption = 'Bairro:'
      end
      object cbSexo: TComboBox
        Left = 261
        Top = 209
        Width = 116
        Height = 21
        Style = csDropDownList
        TabOrder = 10
        Items.Strings = (
          'MASCULINO'
          'FEMININO')
      end
      object cbEstadoCivil: TComboBox
        Left = 74
        Top = 209
        Width = 145
        Height = 21
        Style = csDropDownList
        TabOrder = 9
        Items.Strings = (
          'SOLTEIRO'
          'CASADO'
          'VIUVO'
          'DIVORCIADO')
      end
      object edtRG: TEdit
        Left = 211
        Top = 243
        Width = 165
        Height = 21
        TabOrder = 13
      end
      object mktCPF: TMaskEdit
        Left = 74
        Top = 243
        Width = 100
        Height = 21
        EditMask = '!999.999.999-00;1;_'
        MaxLength = 14
        TabOrder = 12
        Text = '   .   .   -  '
      end
      object mktCep: TMaskEdit
        Left = 496
        Top = 142
        Width = 72
        Height = 21
        EditMask = '00.000\-999;1;_'
        MaxLength = 10
        TabOrder = 6
        Text = '  .   -   '
      end
      object edtUF: TEdit
        Left = 496
        Top = 175
        Width = 33
        Height = 21
        ReadOnly = True
        TabOrder = 8
      end
      object edtNumero: TEdit
        Left = 496
        Top = 74
        Width = 72
        Height = 21
        TabOrder = 3
      end
      object edtEndereco: TEdit
        Left = 74
        Top = 74
        Width = 368
        Height = 21
        TabOrder = 2
      end
      object edtNome: TEdit
        Left = 74
        Top = 40
        Width = 368
        Height = 21
        TabOrder = 1
      end
      object edtCodigo: TEdit
        Left = 74
        Top = 7
        Width = 86
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object cbCidade: TComboBox
        Left = 74
        Top = 175
        Width = 368
        Height = 21
        Style = csDropDownList
        TabOrder = 7
        OnChange = cbCidadeChange
      end
      object mktTelefone: TMaskEdit
        Left = 75
        Top = 277
        Width = 111
        Height = 21
        EditMask = '(##) ####-####'
        MaxLength = 14
        TabOrder = 14
        Text = '(  )     -    '
        OnEnter = mktTelefoneEnter
        OnExit = mktTelefoneExit
      end
      object mktCelular: TMaskEdit
        Left = 256
        Top = 277
        Width = 115
        Height = 21
        EditMask = '(##) ####-####'
        MaxLength = 14
        TabOrder = 15
        Text = '(  )     -    '
        OnEnter = mktCelularEnter
        OnExit = mktCelularExit
      end
      object edtEmail: TEdit
        Left = 74
        Top = 311
        Width = 303
        Height = 21
        TabOrder = 16
      end
      object edtComplemento: TEdit
        Left = 74
        Top = 142
        Width = 368
        Height = 21
        TabOrder = 5
      end
      object mktDataNascimento: TMaskEdit
        Left = 504
        Top = 209
        Width = 64
        Height = 21
        EditMask = '!99/99/0000;1;_'
        MaxLength = 10
        TabOrder = 11
        Text = '  /  /    '
      end
      object edtBairro: TEdit
        Left = 74
        Top = 108
        Width = 368
        Height = 21
        TabOrder = 4
      end
    end
    object Historico: TTabSheet
      Caption = 'Hist'#243'rico'
      ImageIndex = 1
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 377
    Width = 706
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 383
    object btnGravar: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Gravar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        AD5A59AA5454A24D4EAA9595C1C8C7CCCBCACECBCACAC8C7C6CAC9B79E9E9840
        41994444A65151FF00FFFF00FFBC7871CF6666D26868B95A5B9B8080BEA1A0E2
        D0CEFEF9F5FFFDFAF2F6F4D2B3B3962D2C993232C25B5BB05859FF00FFBB7871
        CB6565CE6767B85D5D9E7B7C9D4343B77675E7DFDDFDFBF9FEFFFDD9BAB9962E
        2E993333C05A5AAF5859FF00FFBB7871CB6565CE6667B85D5DA884839939399B
        3636CDBCBBF2F0EEFFFFFFE2C3C1962D2D983333C05A5AAF5859FF00FFBB7871
        CB6565CE6666B75C5CB28F8E9F4848943232A69A9AD5DBD8FAFFFEE6C9C8932B
        2B963030BF5959AF5859FF00FFBB7871CB6565CF6666BB5C5CC3908FC29695B3
        8686AA8D8EBAA2A1E1CAC8DCA9A9A33A3AA43E3EC35D5DAE5758FF00FFBB7871
        CC6566CB6464CB6464CB6364CC6767CD6767CC6464C85B5BC95E5ECA6161CC65
        65CD6666CF6868AC5657FF00FFBC7972B75351B25B57C68684D2A4A2D5ABAAD5
        AAA9D5ABAAD5A5A4D5A8A7D5AAA9D6AEACD39C9CCD6666AC5556FF00FFBC7871
        B14F4CE4CDCBFAF7F7F8F4F3F9F5F4F9F5F4F9F5F4F9F6F5F9F5F4F9F5F4FBFB
        FADEBEBDC45C5DAD5657FF00FFBC7871B3514EEBD7D6FCFBFAF7F0EFF7F1F0F7
        F1F0F7F1F0F7F1F0F7F1F0F6F1F0FBF9F8DEBCBBC35B5BAD5657FF00FFBC7871
        B3514EEBD7D4F0EFEFD8D5D4DAD7D7DAD7D7DAD7D7DAD7D7DAD7D7D8D5D5ECEC
        EBE0BDBCC25B5BAD5657FF00FFBC7871B3514EEBD7D5F3F1F1DEDAD9DFDBDBDF
        DBDBDFDBDBDFDBDBDFDBDBDDDAD9EEEEEEE0BDBCC35B5BAD5657FF00FFBC7871
        B3514EEAD7D5F5F4F3E4DFDEE5E1E0E5E1E0E5E1E0E5E1E0E5E1E0E4DFDFF2F1
        F0DFBDBBC35B5BAD5657FF00FFBC7871B3514EEBD7D6F1F0EFD9D5D5DAD8D7DA
        D8D7DAD8D7DAD8D7DAD8D7D8D5D5EDECEBE1BEBDC35B5BAD5657FF00FFBC7870
        B3514EE9D6D4FEFBFBFAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FAF3F2FDFA
        F9DEBCBBC35C5CAD5657FF00FFFF00FFA8504CC9B6B5D3D5D4D1CECED1CECED1
        CECED1CECED1CECED1CECED1CECED3D4D4CBAEADA34D4EFF00FF}
      TabOrder = 0
      OnClick = btnGravarClick
    end
    object btnExcluir: TBitBtn
      Left = 194
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FF0732DE0732DEFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FF0732DE
        0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732
        DE0732DEFF00FFFF00FFFF00FF0732DE0732DD0732DE0732DEFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FF
        0534ED0732DF0732DE0732DEFF00FFFF00FFFF00FFFF00FF0732DE0732DEFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0732DE0732DE0732DDFF
        00FF0732DD0732DE0732DEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0633E60633E60633E90732DCFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0633E307
        32E30534EFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF0732DD0534ED0533E90434EF0434F5FF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0434F40534EF0533EBFF
        00FFFF00FF0434F40335F8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF0335FC0534EF0434F8FF00FFFF00FFFF00FFFF00FF0335FC0335FBFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB0335FCFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF0335FB0335FBFF00FFFF00FFFF00FFFF00FF0335FB
        0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF0335FBFF00FFFF00FF0335FB0335FB0335FBFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0335FB0335FB
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnDesistir: TBitBtn
      Left = 284
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Desistir'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF9A6666693334FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A6666B96666BB
        6868693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        9A66669A6666C66A6BD06A6BD26869C368696933349A66669A66669A66669A66
        669A66669A6666FF00FFFF00FFFF00FF9A6666DE7374D77071D56F70D56D6EC7
        6A6D693334FEA2A3FCAFB0FABCBDF9C5C6F9C5C69A6666FF00FFFF00FFFF00FF
        9A6666E07778DB7576DA7475DA7273CC6E7169333439C56525CF6329CC6319CB
        5BF9C5C69A6666FF00FFFF00FFFF00FF9A6666E57D7EE07A7BDF797ADF7778D0
        727569333442C46830CD6733CB6724CB60F9C5C69A6666FF00FFFF00FFFF00FF
        9A6666EA8283E57F80E37D7EE68081D374766933343DC26429CB632FCA6420CA
        5EF9C5C69A6666FF00FFFF00FFFF00FF9A6666F08788E98182EC9697FBDDDED8
        888A693334B8E1AC6BDC895DD58046D473F9C5C69A6666FF00FFFF00FFFF00FF
        9A6666F58C8DEE8687F0999AFDDCDDDA888A693334FFF5D8FFFFE0FFFFDEECFD
        D4F9C5C69A6666FF00FFFF00FFFF00FF9A6666FA9192F48E8FF28B8CF48C8DDC
        7F80693334FDF3D4FFFFDFFFFFDDFFFFE0F9C5C69A6666FF00FFFF00FFFF00FF
        9A6666FE9798F99394F89293F99092E08585693334FDF3D4FFFFDFFFFFDDFFFF
        DFF9C5C69A6666FF00FFFF00FFFF00FF9A6666FF9B9CFD9798FC9697FE9798E3
        8889693334FDF3D4FFFFDFFFFFDDFFFFDFF9C5C69A6666FF00FFFF00FFFF00FF
        9A6666FF9FA0FF9A9BFF999AFF9A9BE78C8D693334FDF3D4FFFFDFFFFFDDFFFF
        DFF9C5C69A6666FF00FFFF00FFFF00FF9A66669A6666E98E8FFE999AFF9D9EEB
        8F90693334FBF0D2FDFCDCFDFCDAFDFCDCF9C5C69A6666FF00FFFF00FFFF00FF
        FF00FFFF00FF9A6666B07172D78687DA88886933349A66669A66669A66669A66
        669A66669A6666FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9A66669A
        6666693334FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 2
      OnClick = btnDesistirClick
    end
    object btnAnterior: TBitBtn
      Left = 373
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Anterior'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF00104C001460001872001872001462001150FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0015640015640020980026B800
        27BC0027BC0027BA00209C00166C00166CFF00FFFF00FFFF00FFFF00FFFF00FF
        001874001C880028C00028C20027BC0026B80027BC0027BC0028C00028C2001D
        8A001150FF00FFFF00FFFF00FF001874001F94002CD2002AC80027BC0026B800
        26B80027BA0027BA0027BA0027BC0028C2001D8A00166CFF00FFFF00FF001874
        002EDE002DD8002ACA0027BC5D76D3EDF0FADEE3F62042C30027BA0027BA0027
        BC0028C200166CFF00FF00197A0025B40032F0002DD80028C2546ED3F7F8FDFF
        FFFF96A6E3082EBC0027BA0027BA0027BA0028C000209C00146000197A002FE0
        0032F0002EDE526DD6F6F7FDFDFDFE899BE00027BA0027BA0027BA0027BA0027
        BA0027BE0025B2001460001E900034F80034FA6A88FCF2F4FEFFFFFFF8F9FEBC
        C9F9B9C6F8BDC7EDBDC7EDBEC8EDC0CAEE0027BC0027BC00166A0021A02552FF
        0B3EFFBAC8FEFFFFFFFFFFFFFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF0027BE0027BC0018720021A04168FF335DFF1846F5A3B6FEFFFFFFFAFBFF80
        9AFC3C60E94A69E04A69DF4B69DE4A69DE002AC80026B80015660021A0335DFF
        819BFF0035FF0234F292A8FEFFFFFFE3E9FF496CF3002EDE002DDA002DDA002C
        D2002ACA0023AA001566FF00FF0031ECA9BBFF5D7FFF0030E80234F08AA2FEFF
        FFFFF5F7FF224CE9002DDA002CD6002BCE002CD4001E8EFF00FFFF00FF0031EC
        436AFFC7D3FF5B7DFF0034FA0535EE93A9FDAABBFE0E3CEB002FE2002EDE002F
        E00029C4001E8EFF00FFFF00FFFF00FF002CD25D7FFFD3DCFF97ADFF3F67FF1F
        4EFF0D3FFF1344FF1344FF0539FF002CD6001D8AFF00FFFF00FFFF00FFFF00FF
        FF00FF335DFF335DFF95ABFFBFCCFFA7B9FF8DA5FF7390FF3962FF002FE0002F
        E0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0030E81747FF2D
        59FF2552FF0034FC0029C6FF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 3
      OnClick = btnAnteriorClick
    end
    object btnProximo: TBitBtn
      Left = 463
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Pr'#243'ximo'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF00104C001460001872001872001462001150FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0015640015640020980026B800
        27BC0027BC0027BA00209C00166C00166CFF00FFFF00FFFF00FFFF00FFFF00FF
        001874001C880028C00028C20027BC0026B80027BC0027BC0028C00028C2001D
        8A001150FF00FFFF00FFFF00FF001874001F94002CD2002AC80027BC0026B800
        26B80027BA0027BA0027BA0027BC0028C2001D8A00166CFF00FFFF00FF001874
        002EDE002DD8002ACA0027BC2042C3DEE3F6EDF0FA5D76D30027BA0027BA0027
        BC0028C200166CFF00FF00197A0025B40032F0002DD80028C20027BE082EBC96
        A6E3FFFFFFF7F8FD546ED10027BA0027BA0028C000209C00146000197A002FE0
        0032F0002EDE0028C20027BC0027BE0027BC899BDFFDFDFEF6F7FD526CD00027
        BA0027BE0025B2001460001E900034F80034FAC0CDFEBECAFABDC9F7BDCAFAB9
        C6F9BCC8F8F8F9FDFFFFFFF2F4FB6A81D70027BC0027BC00166A0021A02552FF
        0B3EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFEFFFFFFFFFFFFBAC5
        EC0027BE0027BC0018720021A04168FF335DFF4A6EF74B70FD4A6FFD4A6FFD3C
        64FA8097F1FAFBFEFFFFFFA3B3EE183FD4002AC80026B80015660021A0335DFF
        819BFF0035FF0032F20034FC0034FC496EFDE3E8FDFFFFFF92A5EF022FDA002C
        D2002ACA0023AA001566FF00FF0031ECA9BBFF5D7FFF0030E80032F0224FFCF5
        F7FFFFFFFF8AA0F4022FDA002CD6002BCE002CD4001E8EFF00FFFF00FF0031EC
        436AFFC7D3FF5B7DFF0034FA0E3CEFAABBFD93A9FE0535EA002FE2002EDE002F
        E00029C4001E8EFF00FFFF00FFFF00FF002CD25D7FFFD3DCFF97ADFF3F67FF1F
        4EFF0D3FFF1344FF1344FF0539FF002CD6001D8AFF00FFFF00FFFF00FFFF00FF
        FF00FF335DFF335DFF95ABFFBFCCFFA7B9FF8DA5FF7390FF3962FF002FE0002F
        E0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0030E81747FF2D
        59FF2552FF0034FC0029C6FF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 4
      OnClick = btnProximoClick
    end
    object btnNovo: TBitBtn
      Left = 105
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FF00007200007200006B000066000065000065FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0001B70001B7050DAC393EB058
        5AB25657AB2E2F9000006F000069000069FF00FFFF00FFFF00FFFF00FFFF00FF
        0016CE0915C66C74D9CED1F2FFFFFFFFFFFFFFFFFFFFFFFFC1C2DF5A5A9F0101
        6900007DFF00FFFF00FFFF00FF0018DF0A1DD3A8B0EDFFFFFFFFFFFFBDBEE98C
        8CD18D8DD0CACAEAFFFFFFFFFFFF8C8CBD010169000072FF00FFFF00FF0018DF
        919DEFFFFFFFE6E8F94F53CE0002AB00009D0000950000975F5FBEF0F0FAFFFF
        FF6565A6000072FF00FF001EF12743E7FBFBFFF7F8FD3B4BDA0000C0161DBEB0
        B4E7A3A5E00A0CA000008F5252B9FFFFFFD9D9E90B0B7F00007A001EF17287F6
        FFFFFF91A1F4000DDA000BD0161DCBF1F4FEDEE1F60508A900009A000093ACAC
        DDFFFFFF5353AF00007A0023F8A8B8FCFFFFFF4060F61734ECA0AEF2BABEF1F8
        F9FEF3F4FBB6B8E99799DC0D0EA25A5BBFFFFFFF8487D60000790E3EFEC5CFFE
        FFFFFF3259FE2649F9FAFCFFFFFFFFFFFFFFFFFFFFFFFFFFEBECF91519B14A4F
        C1FFFFFF9094D90000A23C63FFC4D0FFFFFFFF5979FF052EFF375CFB586DF4F0
        F3FEE3E6FA4D5ADE3446D20004B7757CD6FFFFFF797DD50000A8103EFFB6C5FF
        FFFFFFC7D2FF032CFF0020FF1739FBF3F6FFE1E5FA071FDC0007CE0C1CCBD9DC
        F5FDFDFE313CC80000A8FF00FF8DA4FFFFFFFFFFFFFF8AA0FF0027FF002CFF46
        6AFF4163F8001DE9061CDFA1ACF1FFFFFFB4BAED0007BBFF00FFFF00FF718DFF
        DAE1FFFFFFFFFFFFFFB1C0FF3B5DFF1538FF1739FE4966F8C0CAFAFFFFFFEDEF
        FC3041D30007BBFF00FFFF00FFFF00FF88A0FFE6EBFFFFFFFFFFFFFFFDFDFFE2
        E9FFE4EBFFFFFFFFFFFFFFDBE0FA3D50E0000BCCFF00FFFF00FFFF00FFFF00FF
        FF00FF8AA1FFBAC7FEE8ECFFFFFFFFFFFFFFFFFFFFE4E9FE889BF61738E6000B
        CCFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8AA0FF8AA3FF90
        A6FF7993FE4A6BF91A40EFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 5
      OnClick = btnNovoClick
    end
  end
end