unit uDoctorSelection;

interface

uses
  Data.DB,
  System.Classes,
  System.SysUtils,
  System.Variants,
  uDataMod,
  Vcl.Buttons,
  Vcl.Controls,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Winapi.Messages,
  Winapi.Windows;

type
  TDoctorSelectionForm = class(TForm)
    Cancel: TSpeedButton;
    dgDoctors: TDBGrid;
    Panel1: TPanel;
    SelectButton: TSpeedButton;
    procedure CancelClick(Sender: TObject);
    procedure dgDoctorsDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
  private
    IDRes: string;
  public
    function GetID: string;
    function GetName: string;
  end;

var
  DoctorSelectionForm: TDoctorSelectionForm;

implementation

{$R *.dfm}

procedure TDoctorSelectionForm.FormCreate(Sender: TObject);
begin
  dgDoctors.DataSource.DataSet.Active := true;
end;

procedure TDoctorSelectionForm.FormDestroy(Sender: TObject);
begin
  dgDoctors.DataSource.DataSet.Active := false;
end;

function TDoctorSelectionForm.GetID: string;
begin
  Result := IDRes;
end;

function TDoctorSelectionForm.GetName: string;
begin
  Result := '';
  if (dgDoctors.Fields[1].AsString <> '') then begin
    Result := Result + dgDoctors.Fields[1].AsString + ' ';
  end;
  if (dgDoctors.Fields[2].AsString <> '') then begin
    Result := Result + dgDoctors.Fields[2].AsString + ' ';
  end;
  if (dgDoctors.Fields[3].AsString <> '') then begin
    Result := Result + dgDoctors.Fields[3].AsString + ' ';
  end;
  if (dgDoctors.Fields[4].AsString <> '') then begin
    Result := Result + dgDoctors.Fields[4].AsString + ' ';
  end;
  if (dgDoctors.Fields[5].AsString <> '') then begin
    Result := Result + dgDoctors.Fields[5].AsString + ' ';
  end;
  Result := Trim(Result);
end;

procedure TDoctorSelectionForm.dgDoctorsDblClick(Sender: TObject);
begin
  SelectButtonClick(SelectButton);
end;

procedure TDoctorSelectionForm.SelectButtonClick(Sender: TObject);
begin
  IDRes := dgDoctors.Fields[0].AsString;
  Close;
end;

procedure TDoctorSelectionForm.CancelClick(Sender: TObject);
begin
  Close;
end;

end.


