object DoctorSelectionForm: TDoctorSelectionForm
  Left = 0
  Top = 0
  Caption = 'DoctorSelectionForm'
  ClientHeight = 590
  ClientWidth = 972
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object dgDoctors: TDBGrid
    Left = 0
    Top = 73
    Width = 972
    Height = 517
    Align = alClient
    DataSource = DM.dsDoctorsSelection
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -21
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dgDoctorsDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Title'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FirstName'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LastName'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MiddleName'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Suffix'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Speciality'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Availability'
        Width = 150
        Visible = True
      end>
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 25
    Top = 3
    Width = 944
    Height = 67
    Margins.Left = 25
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    DesignSize = (
      944
      67)
    object Cancel: TSpeedButton
      Left = 684
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
      ExplicitLeft = 681
    end
    object SelectButton: TSpeedButton
      Left = 812
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
      ExplicitLeft = 808
    end
  end
end
