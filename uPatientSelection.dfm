object PatientSelectionForm: TPatientSelectionForm
  Left = 0
  Top = 0
  Caption = 'Selection Patient'
  ClientHeight = 563
  ClientWidth = 968
  Color = clBtnFace
  CustomTitleBar.Height = 31
  DoubleBuffered = True
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Segoe UI'
  Font.Style = []
  GlassFrame.Top = 31
  OldCreateOrder = False
  Position = poScreenCenter
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 21
  object dgPatients: TDBGrid
    Left = 0
    Top = 73
    Width = 968
    Height = 490
    Align = alClient
    DataSource = DM.dsPatientsSelection
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -21
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dgPatientsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'FirstName'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MiddleName'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LastName'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Suffix'
        Width = 145
        Visible = True
      end>
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 25
    Top = 3
    Width = 940
    Height = 67
    Margins.Left = 25
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 1
    DesignSize = (
      940
      67)
    object Cancel: TSpeedButton
      Left = 681
      Top = 20
      Width = 121
      Height = 38
      Hint = 'Cancel'
      Anchors = []
      Caption = 'Cancel'
      ImageIndex = 14
      ImageName = 'baseline_clear_white'
      Images = MainForm.VirtualImageList1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = CancelClick
    end
    object SelectButton: TSpeedButton
      Left = 808
      Top = 20
      Width = 121
      Height = 38
      Hint = 'Complete'
      Anchors = []
      Caption = 'Select'
      Images = MainForm.VirtualImageList1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = SelectButtonClick
    end
  end
end
