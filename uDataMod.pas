unit uDataMod;
interface
uses
  System.SysUtils,
  System.Classes,
  ADOCS,
  ADOXCS,
  ADODS,
  Data.DB,
  Vcl.Dialogs,
  Vcl.Forms;

type
  TDM = class(TDataModule)
    adodb: TWADODatabase;
    dbCompany: TWADODataSet;
    dbCompanyAddress1: TStringField;
    dbCompanyAddress2: TStringField;
    dbCompanyCity: TStringField;
    dbCompanyCompanyName: TStringField;
    dbCompanyCounty: TStringField;
    dbCompanyID: TStringField;
    dbCompanyState: TStringField;
    dbCompanyZip: TStringField;
    dbConsultations: TWADODataSet;
    dbConsultationsConsultation: TStringField;
    dbConsultationsCreated: TDateTimeField;
    dbConsultationsID: TStringField;
    dbConsultationsLinkToPatient: TStringField;
    dbConsultationsStatus: TStringField;
    dbConsultationsUsername: TStringField;
    dbConsultationsVisited: TDateTimeField;
    dbConsultLeft: TWADOQuery;
    dbConsultLeftCreated: TDateTimeField;
    dbConsultLeftFirstName: TStringField;
    dbConsultLeftID: TStringField;
    dbConsultLeftLastName: TStringField;
    dbConsultLeftLinkToPatient: TStringField;
    dbConsultLeftMiddleName: TStringField;
    dbConsultLeftStatus: TStringField;
    dbConsultLeftSuffix: TStringField;
    dbConsultLeftUpdateSQL: TWADOUpdateSQL;
    dbConsultLeftVisited: TDateTimeField;
    dbConsultNew: TWADOQuery;
    dbConsultNewCreated: TDateTimeField;
    dbConsultNewFirstName: TStringField;
    dbConsultNewID: TStringField;
    dbConsultNewLastName: TStringField;
    dbConsultNewLinkToPatient: TStringField;
    dbConsultNewMiddleName: TStringField;
    dbConsultNewStatus: TStringField;
    dbConsultNewSuffix: TStringField;
    dbConsultNewUpdateSQL: TWADOUpdateSQL;
    dbConsultNewVisited: TDateTimeField;
    dbConsultSeenDoctor: TWADOQuery;
    dbConsultSeenDoctorCreated: TDateTimeField;
    dbConsultSeenDoctorFirstName: TStringField;
    dbConsultSeenDoctorID: TStringField;
    dbConsultSeenDoctorLastName: TStringField;
    dbConsultSeenDoctorLinkToPatient: TStringField;
    dbConsultSeenDoctorMiddleName: TStringField;
    dbConsultSeenDoctorStatus: TStringField;
    dbConsultSeenDoctorSuffix: TStringField;
    dbConsultSeenDoctorUpdateSQL: TWADOUpdateSQL;
    dbConsultSeenDoctorVisited: TDateTimeField;
    dbConsultVisited: TWADOQuery;
    dbConsultVisitedCreated: TDateTimeField;
    dbConsultVisitedFirstName: TStringField;
    dbConsultVisitedID: TStringField;
    dbConsultVisitedLastName: TStringField;
    dbConsultVisitedLinkToPatient: TStringField;
    dbConsultVisitedMiddleName: TStringField;
    dbConsultVisitedStatus: TStringField;
    dbConsultVisitedSuffix: TStringField;
    dbConsultVisitedUpdateSQL: TWADOUpdateSQL;
    dbConsultVisitedVisited: TDateTimeField;
    dbDoctors: TWADODataSet;
    dbDoctorsAvailability: TStringField;
    dbDoctorsFirstName: TStringField;
    dbDoctorsID: TStringField;
    dbDoctorsLastName: TStringField;
    dbDoctorsMiddleName: TStringField;
    dbDoctorsSelection: TWADODataSet;
    dbDoctorsSpeciality: TStringField;
    dbDoctorsSuffix: TStringField;
    dbDoctorsTitle: TStringField;
    dbPatients: TWADODataSet;
    dbPatientsFirstName: TStringField;
    dbPatientsID: TStringField;
    dbPatientsLastName: TStringField;
    dbPatientsMiddleName: TStringField;
    dbPatientsSelection: TWADODataSet;
    dbPatientsSuffix: TStringField;
    dbPrescriptions: TWADOQuery;
    dbPrescriptionsCreated: TDateTimeField;
    dbPrescriptionsDFirstName: TStringField;
    dbPrescriptionsDLastName: TStringField;
    dbPrescriptionsDMiddleName: TStringField;
    dbPrescriptionsDoctor: TStringField;
    dbPrescriptionsDSuffix: TStringField;
    dbPrescriptionsID: TStringField;
    dbPrescriptionsLinkToDoctor: TStringField;
    dbPrescriptionsLinkToPatient: TStringField;
    dbPrescriptionsMaster: TWADODataSet;
    dbPrescriptionsMasterCreated: TDateTimeField;
    dbPrescriptionsMasterID: TStringField;
    dbPrescriptionsMasterLinkToDoctor: TStringField;
    dbPrescriptionsMasterLinkToPatient: TStringField;
    dbPrescriptionsMasterPrescription: TStringField;
    dbPrescriptionsPatient: TStringField;
    dbPrescriptionsPFirstName: TStringField;
    dbPrescriptionsPLastName: TStringField;
    dbPrescriptionsPMiddleName: TStringField;
    dbPrescriptionsPrescription: TStringField;
    dbPrescriptionsPSuffix: TStringField;
    dbPrescriptionsTitle: TStringField;
    dbPrescriptionsUpdateSQL: TWADOUpdateSQL;
    dsCompany: TDataSource;
    dsConsultations: TDataSource;
    dsConsultLeft: TDataSource;
    dsConsultNew: TDataSource;
    dsConsultSeenDoctor: TDataSource;
    dsConsultVisited: TDataSource;
    dsDoctors: TDataSource;
    dsDoctorsSelection: TDataSource;
    dsPatients: TDataSource;
    dsPatientsSelection: TDataSource;
    dsPrescriptions: TDataSource;
    OpenDBDialog: TOpenDialog;
    procedure DataModuleCreate(Sender: TObject);
    procedure dbConsultationsNewRecord(DataSet: TDataSet);
    procedure dbConsultFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dbDoctorsNewRecord(DataSet: TDataSet);
    procedure dbPatientsNewRecord(DataSet: TDataSet);
    procedure dbPrescriptionsCalcFields(DataSet: TDataSet);
    procedure dbPrescriptionsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dbPrescriptionsMasterNewRecord(DataSet: TDataSet);
  private
    SearchKeyword: string;
  public
    function GetPatientNameByID(AID: string): string;
    procedure SearchPrescriptions(AKeyword: string);
    procedure SearchConsults(AKeyword: string);
    procedure SearchPatients(AKeyword: string);
    procedure SearchDoctors(AKeyword: string);
  end;

var
  DM: TDM;

const
  IndexNew = 0;
  IndexVisited = 1;
  IndexSeenDoctor = 2;
  IndexLeft = 3;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);

  procedure OpenDatabase(sFilename: string);
  begin
    try
      adodb.DatabaseConnect :=
        'Provider=Microsoft.ACE.OLEDB.16.0;' +
        'Data Source=' + sFilename + ';' +
        'Persist Security Info=False';
      adodb.Connected := true;
      dbDoctors.Active := true;
      dbPatients.Active := true;
      dbConsultations.Active := true;
      dbConsultNew.Active := true;
      dbPrescriptionsMaster.Active := true;
      dbPrescriptions.Active := true;

      dbConsultVisited.Active := true;
      dbConsultSeenDoctor.Active := true;
      dbConsultLeft.Active := true;
    except
      on E: Exception do begin
        ShowMessage('Error when opening the database: ' + E.Message);
        Application.Terminate;
      end;
    end;
  end;

var
  sDatabase: string;
begin
  sDatabase := ExtractFilePath(Paramstr(0)) + '..\..\Database\Windows10CRMDemo.accdb';
  if FileExists(sDatabase) then begin
    OpenDatabase(sDatabase);
  end else begin
    if OpenDBDialog.Execute then begin
      OpenDatabase(OpenDBDialog.Filename);
    end else begin
      ShowMessage('Unable to open database.');
      Application.Terminate;
    end;
  end;
end;

procedure TDM.dbPrescriptionsCalcFields(DataSet: TDataSet);
var
  sTemp: string;
begin
  sTemp := '';
  if (dbPrescriptionsTitle.AsString <> '') then
    sTemp := sTemp + dbPrescriptionsTitle.AsString + ' ';
  if (dbPrescriptionsDFirstName.AsString <> '') then
    sTemp := sTemp + dbPrescriptionsDFirstName.AsString + ' ';
  if (dbPrescriptionsDMiddleName.AsString <> '') then
    sTemp := sTemp + dbPrescriptionsDMiddleName.AsString + ' ';
  if (dbPrescriptionsDLastName.AsString <> '') then
    sTemp := sTemp + dbPrescriptionsDLastName.AsString + ' ';
  if (dbPrescriptionsDSuffix.AsString <> '') then
    sTemp := sTemp + dbPrescriptionsDSuffix.AsString + ' ';
  dbPrescriptionsDoctor.AsString := Trim(sTemp);

  sTemp := '';
  if (dbPrescriptionsPFirstName.AsString <> '') then
    sTemp := sTemp + dbPrescriptionsPFirstName.AsString + ' ';
  if (dbPrescriptionsPMiddleName.AsString <> '') then
    sTemp := sTemp + dbPrescriptionsPMiddleName.AsString + ' ';
  if (dbPrescriptionsPLastName.AsString <> '') then
    sTemp := sTemp + dbPrescriptionsPLastName.AsString + ' ';
  if (dbPrescriptionsPSuffix.AsString <> '') then
    sTemp := sTemp + dbPrescriptionsPSuffix.AsString + ' ';
  dbPrescriptionsPatient.AsString := Trim(sTemp);
end;

procedure TDM.dbConsultationsNewRecord(DataSet: TDataSet);
var
  uid: TGuid;
  res: HResult;
begin
  res := CreateGuid(Uid);
  if res = S_OK then begin
    dbConsultationsID.AsString := GuidToString(Uid);
  end;
end;

procedure TDM.dbDoctorsNewRecord(DataSet: TDataSet);
var
  uid: TGuid;
  res: HResult;
begin
  res := CreateGuid(Uid);
  if res = S_OK then begin
    dbDoctorsID.AsString := GuidToString(Uid);
  end;
end;

procedure TDM.dbPatientsNewRecord(DataSet: TDataSet);
var
  uid: TGuid;
  res: HResult;
begin
  res := CreateGuid(Uid);
  if res = S_OK then begin
    dbPatientsID.AsString := GuidToString(Uid);
  end;
end;

procedure TDM.dbPrescriptionsMasterNewRecord(DataSet: TDataSet);
var
  uid: TGuid;
  res: HResult;
begin
  res := CreateGuid(Uid);
  if res = S_OK then begin
    dbPrescriptionsMasterID.AsString := GuidToString(Uid);
  end;
end;

//==================================================================================================
// SEARCH AND FILTERING
//==================================================================================================

function TDM.GetPatientNameByID(AID: string): string;
begin
  if dbPatients.Active then begin
    if dbPatients.Locate('ID', AID, []) then begin
      Result := '';
      if (dbPatientsFirstName.AsString <> '') then begin
        Result := Result + dbPatientsFirstName.AsString + ' ';
      end;
      if (dbPatientsMiddleName.AsString <> '') then begin
        Result := Result + dbPatientsMiddleName.AsString + ' ';
      end;
      if (dbPatientsLastName.AsString <> '') then begin
        Result := Result + dbPatientsLastName.AsString + ' ';
      end;
      if (dbPatientsSuffix.AsString <> '') then begin
        Result := Result + dbPatientsSuffix.AsString + ' ';
      end;
      Result := Trim(Result);
    end;
  end;
end;

procedure TDM.dbPrescriptionsFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  DoctorName: string;
  PatientName: string;
begin
  DoctorName := Uppercase(Dataset.Fields[1].AsString + ' ' + Dataset.Fields[2].AsString + ' ' +
    Dataset.Fields[3].AsString + ' ' + Dataset.Fields[4].AsString + ' ' + Dataset.Fields[5].AsString);
  PatientName := Uppercase(Dataset.Fields[6].AsString + ' ' + Dataset.Fields[7].AsString + ' ' +
    Dataset.Fields[8].AsString + ' ' + Dataset.Fields[9].AsString);

  Accept := (Pos(SearchKeyword, DoctorName) > 0)
    or (Pos(SearchKeyword, PatientName) > 0)
    or (Pos(SearchKeyword, Dataset.Fields[10].AsString) > 0);
end;

procedure TDM.dbConsultFilterRecord(DataSet: TDataSet; var Accept: Boolean);
var
  PatientName: string;
begin
  PatientName := Uppercase(Dataset.Fields[5].AsString + ' ' + Dataset.Fields[6].AsString + ' ' +
    Dataset.Fields[7].AsString + ' ' + Dataset.Fields[8].AsString);
  if (SearchKeyword.IsEmpty) then begin
    if (DataSet.Name = dbConsultNew.Name) then begin
      Accept := (Dataset.Fields[4].AsString = 'Booked Today');
    end;
    if (DataSet.Name = dbConsultVisited.Name) then begin
      Accept := (Dataset.Fields[4].AsString = 'In Clinic');
    end;
    if (DataSet.Name = dbConsultSeenDoctor.Name) then begin
      Accept := (Dataset.Fields[4].AsString = 'Seen Doctor');
    end;
    if (DataSet.Name = dbConsultLeft.Name) then begin
      Accept := (Dataset.Fields[4].AsString = 'Left');
    end;
  end else begin
    if (DataSet.Name = dbConsultNew.Name) then begin
      Accept := (Dataset.Fields[4].AsString = 'Booked Today') and (Pos(SearchKeyword, PatientName) > 0);
    end;
    if (DataSet.Name = dbConsultVisited.Name) then begin
      Accept := (Dataset.Fields[4].AsString = 'In Clinic') and (Pos(SearchKeyword, PatientName) > 0);
    end;
    if (DataSet.Name = dbConsultSeenDoctor.Name) then begin
      Accept := (Dataset.Fields[4].AsString = 'Seen Doctor') and (Pos(SearchKeyword, PatientName) > 0);
    end;
    if (DataSet.Name = dbConsultLeft.Name) then begin
      Accept := (Dataset.Fields[4].AsString = 'Left') and (Pos(SearchKeyword, PatientName) > 0);
    end;
  end;
end;

procedure TDM.SearchPrescriptions(AKeyword: string);
begin
  if (Trim(AKeyword).IsEmpty) then begin
    dbPrescriptions.Filtered := false;
  end else begin
    dbPrescriptions.Filtered := false;
    SearchKeyword := UpperCase(AKeyword);
    dbPrescriptions.Filtered := true;
    SearchKeyword := '';
  end;
end;

procedure TDM.SearchConsults(AKeyword: string);
begin
  SearchKeyword := UpperCase(AKeyword);
  dbConsultNew.Filtered := false;
  dbConsultNew.Filtered := true;
  dbConsultVisited.Filtered := false;
  dbConsultVisited.Filtered := true;
  dbConsultSeenDoctor.Filtered := false;
  dbConsultSeenDoctor.Filtered := true;
  dbConsultLeft.Filtered := false;
  dbConsultLeft.Filtered := true;
  SearchKeyword := '';
end;

procedure TDM.SearchPatients(AKeyword: string);
begin
  if (Trim(AKeyword).IsEmpty) then begin
    dbPatients.Filtered := false;
  end else begin
    dbPatients.Filtered := false;
    dbPatients.Filter := Format(
      '(FirstName LIKE ''*%s*'') ' +
      'OR (MiddleName LIKE ''*%s*'') ' +
      'OR (LastName LIKE ''*%s*'') ' +
      'OR (Suffix LIKE ''*%s*'')',
      [AKeyword, AKeyword, AKeyword, AKeyword]);
    dbPatients.Filtered := true;
  end;
end;

procedure TDM.SearchDoctors(AKeyword: string);
begin
  if (Trim(AKeyword).IsEmpty) then begin
    dbDoctors.Filtered := false;
  end else begin
    dbDoctors.Filtered := false;
    dbDoctors.Filter := Format(
      '(FirstName LIKE ''*%s*'') ' +
      'OR (MiddleName LIKE ''*%s*'') ' +
      'OR (LastName LIKE ''*%s*'') ' +
      'OR (Suffix LIKE ''*%s*'') ' +
      'OR (Title LIKE ''*%s*'') ' +
      'OR (Speciality LIKE ''*%s*'') ' +
      'OR (Availability LIKE ''*%s*'')',
      [AKeyword, AKeyword, AKeyword, AKeyword, AKeyword, AKeyword, AKeyword]);
    dbDoctors.Filtered := true;
  end;
end;

end.



