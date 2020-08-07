unit uPrescription;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.VirtualImage, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.WinXCtrls, Data.DB;

type
  TPrescriptionForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    VirtualImage1: TVirtualImage;
    CancelConsultationButton: TSpeedButton;
    CompleteConsultationButton: TSpeedButton;
    ScrollBox1: TScrollBox;
    DetailRelativePanel: TRelativePanel;
    FormPanel: TPanel;
    DatesPanel: TPanel;
    DateCreatedPanel: TPanel;
    Label5: TLabel;
    DateCreatedPicker: TDateTimePicker;
    AcctPanel: TPanel;
    Label4: TLabel;
    Panel2: TPanel;
    SelectPatientButton: TSpeedButton;
    Patient: TEdit;
    NotesPanel: TPanel;
    Label6: TLabel;
    NotesMemo: TMemo;
    LeadIdPanel: TPanel;
    Label7: TLabel;
    LeadIdLabel: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    Panel4: TPanel;
    SelectDoctorButton: TSpeedButton;
    Doctor: TEdit;
    procedure SelectPatientButtonClick(Sender: TObject);
    procedure SelectDoctorButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CompleteConsultationButtonClick(Sender: TObject);
    procedure CancelConsultationButtonClick(Sender: TObject);
  private
  public
    Saved: boolean;
    ID: string;
    PatientID, DoctorID: string;
    procedure Init(ANew: boolean = false);
  end;

var
  PrescriptionForm: TPrescriptionForm;

implementation

uses
  uDataMod, uDoctorSelection, uPatientSelection;

{$R *.dfm}

procedure TPrescriptionForm.FormCreate(Sender: TObject);
begin
  ID := '';
  DoctorID := '';
  PatientID := '';
end;

procedure TPrescriptionForm.Init(ANew: boolean = false);
begin
  if ANew then begin
    DateCreatedPicker.Date := Now;
  end else begin
    if DM.dbPrescriptions.Locate('ID', ID, []) then begin
      DateCreatedPicker.Date := DM.dbPrescriptionsCreated.AsDateTime;
      NotesMemo.Lines.Text := DM.dbPrescriptionsPrescription.AsString;
      Doctor.Text := DM.dbPrescriptionsDoctor.AsString;
      Patient.Text :=DM.dbPrescriptionsPatient.AsString;
    end;
  end;
end;

procedure TPrescriptionForm.SelectPatientButtonClick(Sender: TObject);
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

procedure TPrescriptionForm.SelectDoctorButtonClick(Sender: TObject);
var
  frm: TDoctorSelectionForm;
begin
  frm := TDoctorSelectionForm.Create(nil);
  try
    frm.ShowModal;
    if (frm.GetID <> '') then begin
      DoctorID := frm.GetID;
      Doctor.Text := frm.GetName;
    end;
  finally
    frm.Free;
  end;
end;

procedure TPrescriptionForm.CompleteConsultationButtonClick(Sender: TObject);
begin
  if not (DM.dbPrescriptionsMaster.State in [dsInsert, dsEdit]) then begin
    if DM.dbPrescriptionsMaster.Locate('ID', ID, []) then begin
      DM.dbPrescriptionsMaster.Edit;
    end else begin
      DM.dbPrescriptionsMaster.Insert;
    end;
  end;
  DM.dbPrescriptionsMasterCreated.AsDateTime := DateCreatedPicker.Date;
  DM.dbPrescriptionsMasterPrescription.AsString := NotesMemo.Lines.Text;
  DM.dbPrescriptionsMasterLinkToPatient.AsString := PatientID;
  DM.dbPrescriptionsMasterLinkToDoctor.AsString := DoctorID;
  DM.dbPrescriptionsMaster.Post;

  Saved := true;
  Close;
end;

procedure TPrescriptionForm.CancelConsultationButtonClick(Sender: TObject);
begin
  Close;
end;

end.
