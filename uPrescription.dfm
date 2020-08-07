object PrescriptionForm: TPrescriptionForm
  Left = 0
  Top = 0
  Caption = 'Prescription Detail'
  ClientHeight = 618
  ClientWidth = 832
  Color = clBtnFace
  CustomTitleBar.Height = 31
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
  PixelsPerInch = 96
  TextHeight = 21
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 25
    Top = 3
    Width = 804
    Height = 67
    Margins.Left = 25
    Align = alTop
    BevelOuter = bvNone
    FullRepaint = False
    TabOrder = 0
    DesignSize = (
      804
      67)
    object Label1: TLabel
      AlignWithMargins = True
      Left = 108
      Top = 15
      Width = 278
      Height = 42
      Margins.Top = 15
      Margins.Bottom = 10
      Align = alLeft
      Caption = 'Prescription Detail'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 45
    end
    object VirtualImage1: TVirtualImage
      Left = 0
      Top = 0
      Width = 105
      Height = 67
      Align = alLeft
      ImageWidth = 0
      ImageHeight = 0
      ImageIndex = 0
      ExplicitLeft = 8
    end
    object CancelConsultationButton: TSpeedButton
      Left = 542
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
      OnClick = CancelConsultationButtonClick
      ExplicitLeft = 527
    end
    object CompleteConsultationButton: TSpeedButton
      Left = 672
      Top = 20
      Width = 121
      Height = 38
      Hint = 'Complete'
      Anchors = []
      Caption = 'Complete'
      ImageIndex = 9
      ImageName = 'baseline_create_white'
      Images = MainForm.VirtualImageList1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = CompleteConsultationButtonClick
      ExplicitLeft = 558
    end
  end
  object ScrollBox1: TScrollBox
    AlignWithMargins = True
    Left = 3
    Top = 106
    Width = 826
    Height = 509
    Margins.Top = 33
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 1
    object DetailRelativePanel: TRelativePanel
      Left = 0
      Top = 0
      Width = 809
      Height = 1206
      ControlCollection = <
        item
          Control = FormPanel
          AlignBottomWithPanel = False
          AlignHorizontalCenterWithPanel = False
          AlignLeftWithPanel = True
          AlignRightWithPanel = False
          AlignTopWithPanel = True
          AlignVerticalCenterWithPanel = False
        end>
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      FullRepaint = False
      TabOrder = 0
      DesignSize = (
        809
        1206)
      object FormPanel: TPanel
        AlignWithMargins = True
        Left = 30
        Top = 3
        Width = 750
        Height = 1200
        Margins.Left = 30
        Margins.Right = 30
        Anchors = []
        BevelOuter = bvNone
        FullRepaint = False
        TabOrder = 0
        object DatesPanel: TPanel
          Left = 0
          Top = 33
          Width = 750
          Height = 80
          Align = alTop
          BevelOuter = bvNone
          FullRepaint = False
          TabOrder = 0
          object DateCreatedPanel: TPanel
            Left = 0
            Top = 0
            Width = 375
            Height = 80
            Align = alLeft
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 0
            object Label5: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 369
              Height = 30
              Align = alTop
              Caption = 'Date Created'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -21
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ExplicitWidth = 122
            end
            object DateCreatedPicker: TDateTimePicker
              AlignWithMargins = True
              Left = 3
              Top = 46
              Width = 369
              Height = 31
              Margins.Top = 10
              Align = alClient
              Date = 43916.000000000000000000
              Time = 43916.000000000000000000
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              ExplicitHeight = 29
            end
          end
        end
        object AcctPanel: TPanel
          Left = 0
          Top = 186
          Width = 750
          Height = 73
          Align = alTop
          BevelOuter = bvNone
          FullRepaint = False
          TabOrder = 2
          object Label4: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 126
            Height = 30
            Align = alTop
            Caption = 'Patient Name'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Panel2: TPanel
            Left = 0
            Top = 36
            Width = 750
            Height = 37
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 0
            object SelectPatientButton: TSpeedButton
              AlignWithMargins = True
              Left = 666
              Top = 3
              Width = 81
              Height = 31
              Hint = 'Cancel'
              Align = alRight
              Caption = 'Select'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              OnClick = SelectPatientButtonClick
            end
            object Patient: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 657
              Height = 31
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              ExplicitHeight = 29
            end
          end
        end
        object NotesPanel: TPanel
          Left = 0
          Top = 259
          Width = 750
          Height = 185
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 3
          object Label6: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 744
            Height = 30
            Align = alTop
            AutoSize = False
            Caption = 'Notes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ExplicitLeft = 0
            ExplicitWidth = 194
          end
          object NotesMemo: TMemo
            AlignWithMargins = True
            Left = 3
            Top = 39
            Width = 744
            Height = 143
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object LeadIdPanel: TPanel
          Left = 0
          Top = 0
          Width = 750
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          FullRepaint = False
          TabOrder = 4
          object Label7: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 138
            Height = 30
            Align = alLeft
            Caption = 'Prescription Id:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object LeadIdLabel: TLabel
            AlignWithMargins = True
            Left = 147
            Top = 3
            Width = 6
            Height = 30
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 113
          Width = 750
          Height = 73
          Align = alTop
          BevelOuter = bvNone
          FullRepaint = False
          TabOrder = 1
          object Label2: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 125
            Height = 30
            Align = alTop
            Caption = 'Doctor Name'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object Panel4: TPanel
            Left = 0
            Top = 36
            Width = 750
            Height = 37
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            BevelOuter = bvNone
            FullRepaint = False
            TabOrder = 0
            object SelectDoctorButton: TSpeedButton
              AlignWithMargins = True
              Left = 666
              Top = 3
              Width = 81
              Height = 31
              Hint = 'Cancel'
              Align = alRight
              Caption = 'Select'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              OnClick = SelectDoctorButtonClick
            end
            object Doctor: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 657
              Height = 31
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              ExplicitHeight = 29
            end
          end
        end
      end
    end
  end
end
