object FrPrincipal: TFrPrincipal
  Left = 0
  Top = 0
  Caption = 'Gest'#227'o de Alunos'
  ClientHeight = 343
  ClientWidth = 691
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 40
    Top = 80
    object Sistema1: TMenuItem
      Caption = 'Sistema'
      object Sair1: TMenuItem
        Caption = 'Sair'
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Cliente1: TMenuItem
        Caption = 'Cliente'
        OnClick = Cliente1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object RelaodeMensalidadesPagas2: TMenuItem
        Caption = 'Rela'#231#227'o de Mensalidades Pagas'
      end
      object RelaodePendncias1: TMenuItem
        Caption = 'Rela'#231#227'o de Pend'#234'ncias '
      end
    end
  end
end
