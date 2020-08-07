unit uConsultation;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Variants,
  uDataMod,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Vcl.StdCtrls,
  Vcl.VirtualImage,
  Vcl.WinXCtrls,
  Winapi.Messages,
  Winapi.Windows;

type
  TConsultationForm = class(TForm)
    AcctPanel: TPanel;
    CancelConsultationButton: TSpeedButton;
    CompleteConsultationButton: TSpeedButton;
    DateContactedPanel: TPanel;
    DateCreatedPanel: TPanel;
    DateCreatedPicker: TDateTimePicker;
    DatesPanel: TPanel;
    DateVisitedPicker: TDateTimePicker;
    DetailRelativePanel: TRelativePanel;
    FormPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    LeadIdLabel: TLabel;
    LeadIdPanel: TPanel;
    NotesMemo: TMemo;
    NotesPanel: TPanel;
    Panel1: TPanel;
    Patient: TEdit;
    ScrollBox1: TScrollBox;
    SelectPatientButton: TSpeedButton;
    StatusComboBox: TComboBox;
    StatusPanel: TPanel;
    VirtualImage1: TVirtualImage;
    procedure FormCreate(Sender: TObject);
    procedure CancelConsultationButtonClick(Sender: TObject);
    procedure CompleteConsultationButtonClick(Sender: TObject);
    procedure SelectPatientButtonClick(Sender: TObject);
  private
  public
    ID: string;
    UserName: string;
    PatientID: string;
    Status: integer;
    procedure Init(ANew: boolean = false; AStatus: Integer = -1);
  end;

var
  ConsultationForm: TConsultationForm;

implementation

uses
  uPatientSelection;

{$R *.dfm}

procedure TConsultationForm.FormCreate(Sender: TObject);
begin
  ID := '';
  PatientID := '';
  Status := -1;
end;

procedure TConsultationForm.Init(ANew: boolean = false; AStatus: Integer = -1);
begin
  if ANew then begin
    DateCreatedPicker.Date := Now;
    DateVisitedPicker.Date := Now;
    DateVisitedPicker.Checked := false;
    StatusComboBox.ItemIndex := AStatus;
  end else begin
    if DM.dbConsultations.Locate('ID', ID, []) then begin
      if (DM.dbConsultationsLinkToPatient.AsString <> '') then begin
        PatientID := DM.dbConsultationsLinkToPatient.AsString;
        Patient.Text := DM.GetPatientNameByID(DM.dbConsultationsLinkToPatient.AsString);
      end;
      DateVisitedPicker.Checked := false;
      if (DM.dbConsultationsVisited.AsDateTime <> 0) then begin
        DateVisitedPicker.Date := DM.dbConsultationsVisited.AsDateTime;
        DateVisitedPicker.Checked := true;
      end;
      if DM.dbConsultationsStatus.AsString = 'Booked Today' then begin
        StatusComboBox.ItemIndex := IndexNew;
      end else if DM.dbConsultationsStatus.AsString = 'In Clinic' then begin
        StatusComboBox.ItemIndex := IndexVisited;
      end else if DM.dbConsultationsStatus.AsString = 'Seen Doctor' then begin
        StatusComboBox.ItemIndex := IndexSeenDoctor;
      end else if DM.dbConsultationsStatus.AsString = 'Left' then begin
        StatusComboBox.ItemIndex := IndexLeft;
      end;
      NotesMemo.Lines.Text := DM.dbConsultationsConsultation.AsString;
      DateCreatedPicker.Date := DM.dbConsultationsCreated.AsDateTime;
    end;
  end;
end;

procedure TConsultationForm.SelectPatientButtonClick(Sender: TObject);
var
  frm: TPatientSelectionForm;
begin
  frm := TPatientSelectionForm.Create(nil);
  try
    frm.ShowModal;
    if (frm.GetID <> '') then begin
      PatientID := frm.GetID;
      Patient.Text := frm.GetName;
    end;
  finally
    frm.Free;
  end;
end;

procedure TConsultationForm.CompleteConsultationButtonClick(Sender: TObject);
begin
  if ((DM.dbConsultations.State in [dsInsert, dsEdit]) = false) then begin
    if DM.dbConsultations.Locate('ID', ID, []) then begin
      DM.dbConsultations.Edit;
    end else begin
      DM.dbConsultations.Insert;
    end;
  end;
  DM.dbConsultationsCreated.AsDateTime := DateCreatedPicker.Date;
  if DateVisitedPicker.Checked then begin
    DM.dbConsultationsVisited.AsDateTime := DateVisitedPicker.Date;
  end;
  DM.dbConsultationsUsername.AsString := UserName;
  DM.dbConsultationsLinkToPatient.AsString := PatientID;
  DM.dbConsultationsStatus.AsString := StatusComboBox.Text;
  DM.dbConsultationsConsultation.AsString := NotesMemo.Lines.Text;
  DM.dbConsultations.Post;
  Status := StatusComboBox.ItemIndex;

  Close;
end;

procedure TConsultationForm.CancelConsultationButtonClick(Sender: TObject);
begin
  Status := -1;
  Close;
end;

end.
