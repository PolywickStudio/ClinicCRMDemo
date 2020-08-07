unit uPatientSelection;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.VirtualImage, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, uDataMod;

type
  TPatientSelectionForm = class(TForm)
    dgPatients: TDBGrid;
    Panel1: TPanel;
    Cancel: TSpeedButton;
    SelectButton: TSpeedButton;
    procedure CancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure dgPatientsDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    IDRes: string;
  public
    function GetID: string;
    function GetName: string;
  end;

var
  PatientSelectionForm: TPatientSelectionForm;

implementation

{$R *.dfm}

procedure TPatientSelectionForm.FormCreate(Sender: TObject);
begin
  IDRes := '';
  DM.dbPatientsSelection.Active := true;
end;

procedure TPatientSelectionForm.FormDestroy(Sender: TObject);
begin
  DM.dbPatientsSelection.Active := false;
end;

function TPatientSelectionForm.GetID: string;
begin
  Result := IDRes;
end;

function TPatientSelectionForm.GetName: string;
begin
  Result := '';
  if (dgPatients.Fields[1].AsString <> '') then begin
    Result := Result + dgPatients.Fields[1].AsString + ' ';
  end;
  if (dgPatients.Fields[2].AsString <> '') then begin
    Result := Result + dgPatients.Fields[2].AsString + ' ';
  end;
  if (dgPatients.Fields[3].AsString <> '') then begin
    Result := Result + dgPatients.Fields[3].AsString + ' ';
  end;
  if (dgPatients.Fields[4].AsString <> '') then begin
    Result := Result + dgPatients.Fields[4].AsString + ' ';
  end;
  Result := Trim(Result);
end;

procedure TPatientSelectionForm.dgPatientsDblClick(Sender: TObject);
begin
  SelectButtonClick(SelectButton);
end;

procedure TPatientSelectionForm.CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TPatientSelectionForm.SelectButtonClick(Sender: TObject);
begin
  IDRes := dgPatients.Fields[0].AsString;
  Close;
end;

end.
