object DM: TDM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 553
  Width = 581
  object dbCompany: TWADODataSet
    CommandType = ctTableDirect
    CursorLocation = clServer
    Database = adodb
    DatabaseProvider = ''
    IndexName = ''
    Options = [opWithoutADOEvents, opWriteModifiedFieldsOnly]
    Params = <>
    TableName = 'Company'
    UseADOVersion = avADO
    Left = 390
    Top = 356
    object dbCompanyID: TStringField
      FieldName = 'ID'
      Size = 36
    end
    object dbCompanyCompanyName: TStringField
      FieldName = 'CompanyName'
      Size = 40
    end
    object dbCompanyAddress1: TStringField
      FieldName = 'Address1'
      Size = 40
    end
    object dbCompanyAddress2: TStringField
      FieldName = 'Address2'
      Size = 40
    end
    object dbCompanyCity: TStringField
      FieldName = 'City'
      Size = 40
    end
    object dbCompanyState: TStringField
      FieldName = 'State'
      Size = 40
    end
    object dbCompanyZip: TStringField
      FieldName = 'Zip'
      Size = 40
    end
    object dbCompanyCounty: TStringField
      FieldName = 'County'
      Size = 40
    end
  end
  object adodb: TWADODatabase
    ConnectionAttributes = []
    DatabaseConnect = 'Provider=Microsoft.ACE.OLEDB.16.0;Persist Security Info=False'
    DatabaseProvider = 'Microsoft.ACE.OLEDB.16.0'
    ConnectionOptions = []
    UseADOVersion = avADO
    Left = 36
    Top = 16
  end
  object dsDoctors: TDataSource
    DataSet = dbDoctors
    Left = 511
    Top = 414
  end
  object dbDoctors: TWADODataSet
    CommandType = ctTableDirect
    CursorLocation = clServer
    Database = adodb
    DatabaseProvider = ''
    IndexName = ''
    Options = [opWithoutADOEvents, opWriteModifiedFieldsOnly]
    Params = <>
    TableName = 'Doctors'
    UseADOVersion = avADO
    OnNewRecord = dbDoctorsNewRecord
    Left = 390
    Top = 414
    object dbDoctorsID: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object dbDoctorsFirstName: TStringField
      FieldName = 'FirstName'
      Size = 40
    end
    object dbDoctorsLastName: TStringField
      FieldName = 'LastName'
      Size = 40
    end
    object dbDoctorsMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 40
    end
    object dbDoctorsSuffix: TStringField
      FieldName = 'Suffix'
      Size = 40
    end
    object dbDoctorsTitle: TStringField
      FieldName = 'Title'
      Size = 40
    end
    object dbDoctorsSpeciality: TStringField
      FieldName = 'Speciality'
      Size = 50
    end
    object dbDoctorsAvailability: TStringField
      FieldName = 'Availability'
      Size = 50
    end
  end
  object dsCompany: TDataSource
    DataSet = dbCompany
    Left = 511
    Top = 350
  end
  object dbPatients: TWADODataSet
    CommandType = ctTableDirect
    CursorLocation = clServer
    Database = adodb
    DatabaseProvider = ''
    IndexName = ''
    Options = [opWithoutADOEvents, opWriteModifiedFieldsOnly]
    Params = <>
    TableName = 'Patients'
    UseADOVersion = avADO
    OnNewRecord = dbPatientsNewRecord
    Left = 390
    Top = 295
    object dbPatientsID: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object dbPatientsFirstName: TStringField
      FieldName = 'FirstName'
      Size = 40
    end
    object dbPatientsLastName: TStringField
      FieldName = 'LastName'
      Size = 40
    end
    object dbPatientsMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 40
    end
    object dbPatientsSuffix: TStringField
      FieldName = 'Suffix'
      Size = 40
    end
  end
  object dsPatients: TDataSource
    DataSet = dbPatients
    Left = 511
    Top = 291
  end
  object dbConsultations: TWADODataSet
    CommandType = ctTableDirect
    CursorLocation = clServer
    Database = adodb
    DatabaseProvider = ''
    IndexName = ''
    Options = [opWithoutADOEvents, opWriteModifiedFieldsOnly]
    Params = <>
    TableName = 'Consultation'
    UseADOVersion = avADO
    OnNewRecord = dbConsultationsNewRecord
    Left = 390
    Top = 246
    object dbConsultationsID: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object dbConsultationsCreated: TDateTimeField
      FieldName = 'Created'
    end
    object dbConsultationsConsultation: TStringField
      FieldName = 'Consultation'
      Size = 255
    end
    object dbConsultationsVisited: TDateTimeField
      FieldName = 'Visited'
    end
    object dbConsultationsLinkToPatient: TStringField
      FieldName = 'LinkToPatient'
      Size = 38
    end
    object dbConsultationsStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object dbConsultationsUsername: TStringField
      FieldName = 'Username'
      Size = 50
    end
  end
  object dsConsultations: TDataSource
    DataSet = dbConsultations
    Left = 513
    Top = 242
  end
  object dsConsultNew: TDataSource
    DataSet = dbConsultNew
    Left = 511
    Top = 20
  end
  object dsConsultVisited: TDataSource
    DataSet = dbConsultVisited
    Left = 511
    Top = 76
  end
  object dsConsultSeenDoctor: TDataSource
    DataSet = dbConsultSeenDoctor
    Left = 511
    Top = 134
  end
  object dsConsultLeft: TDataSource
    DataSet = dbConsultLeft
    Left = 511
    Top = 186
  end
  object dbConsultNew: TWADOQuery
    Database = adodb
    Filter = 'Status='#39'Booked Today'#39
    Filtered = True
    Options = [opWriteModifiedFieldsOnly]
    Params = <>
    SQL.Strings = (
      'SELECT C.ID, C.LinkToPatient, Created, C.Visited, C.Status,'
      'P.FirstName, P.LastName, P.MiddleName, P.Suffix'
      'FROM Consultation C'
      'INNER JOIN Patients P ON P.ID=C.LinkToPatient'
      '')
    UpdateObject = dbConsultNewUpdateSQL
    UseADOVersion = avADO
    OnFilterRecord = dbConsultFilterRecord
    Left = 396
    Top = 18
    object dbConsultNewID: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object dbConsultNewLinkToPatient: TStringField
      FieldName = 'LinkToPatient'
      Size = 38
    end
    object dbConsultNewCreated: TDateTimeField
      FieldName = 'Created'
    end
    object dbConsultNewVisited: TDateTimeField
      FieldName = 'Visited'
    end
    object dbConsultNewStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object dbConsultNewFirstName: TStringField
      FieldName = 'FirstName'
      Size = 40
    end
    object dbConsultNewLastName: TStringField
      FieldName = 'LastName'
      Size = 40
    end
    object dbConsultNewMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 40
    end
    object dbConsultNewSuffix: TStringField
      FieldName = 'Suffix'
      Size = 40
    end
  end
  object dbConsultNewUpdateSQL: TWADOUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Consultation WHERE ID=:ID')
    Left = 130
    Top = 36
  end
  object dbConsultVisited: TWADOQuery
    Tag = 1
    Database = adodb
    Filter = 'Status='#39'In Clinic'#39
    Filtered = True
    Options = [opWriteModifiedFieldsOnly]
    Params = <>
    SQL.Strings = (
      'SELECT C.ID, C.LinkToPatient, Created, C.Visited, C.Status,'
      'P.FirstName, P.LastName, P.MiddleName, P.Suffix'
      'FROM Consultation C'
      'INNER JOIN Patients P ON P.ID=C.LinkToPatient'
      '')
    UpdateObject = dbConsultVisitedUpdateSQL
    UseADOVersion = avADO
    OnFilterRecord = dbConsultFilterRecord
    Left = 392
    Top = 80
    object dbConsultVisitedID: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object dbConsultVisitedLinkToPatient: TStringField
      FieldName = 'LinkToPatient'
      Size = 38
    end
    object dbConsultVisitedCreated: TDateTimeField
      FieldName = 'Created'
    end
    object dbConsultVisitedVisited: TDateTimeField
      FieldName = 'Visited'
    end
    object dbConsultVisitedStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object dbConsultVisitedFirstName: TStringField
      FieldName = 'FirstName'
      Size = 40
    end
    object dbConsultVisitedLastName: TStringField
      FieldName = 'LastName'
      Size = 40
    end
    object dbConsultVisitedMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 40
    end
    object dbConsultVisitedSuffix: TStringField
      FieldName = 'Suffix'
      Size = 40
    end
  end
  object dbConsultSeenDoctor: TWADOQuery
    Tag = 2
    Database = adodb
    Filter = 'Status='#39'Seen Doctor'#39
    Filtered = True
    Options = [opWriteModifiedFieldsOnly]
    Params = <>
    SQL.Strings = (
      'SELECT C.ID, C.LinkToPatient, Created, C.Visited, C.Status,'
      'P.FirstName, P.LastName, P.MiddleName, P.Suffix'
      'FROM Consultation C'
      'INNER JOIN Patients P ON P.ID=C.LinkToPatient'
      '')
    UpdateObject = dbConsultSeenDoctorUpdateSQL
    UseADOVersion = avADO
    OnFilterRecord = dbConsultFilterRecord
    Left = 396
    Top = 134
    object dbConsultSeenDoctorID: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object dbConsultSeenDoctorLinkToPatient: TStringField
      FieldName = 'LinkToPatient'
      Size = 38
    end
    object dbConsultSeenDoctorCreated: TDateTimeField
      FieldName = 'Created'
    end
    object dbConsultSeenDoctorVisited: TDateTimeField
      FieldName = 'Visited'
    end
    object dbConsultSeenDoctorStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object dbConsultSeenDoctorFirstName: TStringField
      FieldName = 'FirstName'
      Size = 40
    end
    object dbConsultSeenDoctorLastName: TStringField
      FieldName = 'LastName'
      Size = 40
    end
    object dbConsultSeenDoctorMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 40
    end
    object dbConsultSeenDoctorSuffix: TStringField
      FieldName = 'Suffix'
      Size = 40
    end
  end
  object dbConsultLeft: TWADOQuery
    Tag = 3
    Database = adodb
    Filter = 'Status='#39'Left'#39
    Filtered = True
    Options = [opWriteModifiedFieldsOnly]
    Params = <>
    SQL.Strings = (
      'SELECT C.ID, C.LinkToPatient, Created, C.Visited, C.Status,'
      'P.FirstName, P.LastName, P.MiddleName, P.Suffix'
      'FROM Consultation C'
      'INNER JOIN Patients P ON P.ID=C.LinkToPatient'
      '')
    UpdateObject = dbConsultLeftUpdateSQL
    UseADOVersion = avADO
    OnFilterRecord = dbConsultFilterRecord
    Left = 390
    Top = 190
    object dbConsultLeftID: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object dbConsultLeftLinkToPatient: TStringField
      FieldName = 'LinkToPatient'
      Size = 38
    end
    object dbConsultLeftCreated: TDateTimeField
      FieldName = 'Created'
    end
    object dbConsultLeftVisited: TDateTimeField
      FieldName = 'Visited'
    end
    object dbConsultLeftStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object dbConsultLeftFirstName: TStringField
      FieldName = 'FirstName'
      Size = 40
    end
    object dbConsultLeftLastName: TStringField
      FieldName = 'LastName'
      Size = 40
    end
    object dbConsultLeftMiddleName: TStringField
      FieldName = 'MiddleName'
      Size = 40
    end
    object dbConsultLeftSuffix: TStringField
      FieldName = 'Suffix'
      Size = 40
    end
  end
  object dbConsultVisitedUpdateSQL: TWADOUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Consultation WHERE ID=:ID')
    Left = 240
    Top = 52
  end
  object dbConsultSeenDoctorUpdateSQL: TWADOUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Consultation WHERE ID=:ID')
    Left = 246
    Top = 118
  end
  object dbConsultLeftUpdateSQL: TWADOUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Consultation WHERE ID=:ID')
    Left = 258
    Top = 186
  end
  object dbPrescriptionsMaster: TWADODataSet
    CommandType = ctTableDirect
    CursorLocation = clServer
    Database = adodb
    DatabaseProvider = ''
    IndexName = ''
    Options = [opWithoutADOEvents, opWriteModifiedFieldsOnly]
    Params = <>
    TableName = 'Prescriptions'
    UseADOVersion = avADO
    OnNewRecord = dbPrescriptionsMasterNewRecord
    Left = 144
    Top = 472
    object dbPrescriptionsMasterID: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object dbPrescriptionsMasterLinkToPatient: TStringField
      FieldName = 'LinkToPatient'
      Size = 38
    end
    object dbPrescriptionsMasterLinkToDoctor: TStringField
      FieldName = 'LinkToDoctor'
      Size = 38
    end
    object dbPrescriptionsMasterPrescription: TStringField
      FieldName = 'Prescription'
      Size = 255
    end
    object dbPrescriptionsMasterCreated: TDateTimeField
      FieldName = 'Created'
    end
  end
  object dsPrescriptions: TDataSource
    DataSet = dbPrescriptions
    Left = 511
    Top = 474
  end
  object dbPrescriptions: TWADOQuery
    CacheSize = 10
    Database = adodb
    Options = [opWriteModifiedFieldsOnly]
    Params = <>
    SQL.Strings = (
      'SELECT'
      'A.ID, D.Title, D.FirstName, D.MiddleName, D.LastName, D.Suffix,'
      'P.FirstName, P.MiddleName, P.LastName, P.Suffix,'
      'A.Prescription, A.LinkToDoctor, A.LinkToPatient,'
      'A.Created'
      'FROM (Prescriptions A'
      'LEFT JOIN Doctors D ON D.ID=A.LinkToDoctor)'
      'LEFT JOIN Patients P ON P.ID=A.LinkToPatient')
    UpdateObject = dbPrescriptionsUpdateSQL
    UseADOVersion = avADO
    OnCalcFields = dbPrescriptionsCalcFields
    OnFilterRecord = dbPrescriptionsFilterRecord
    Left = 394
    Top = 480
    object dbPrescriptionsID: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object dbPrescriptionsTitle: TStringField
      FieldName = 'Title'
      Size = 40
    end
    object dbPrescriptionsDFirstName: TStringField
      FieldName = 'D.FirstName'
      Size = 40
    end
    object dbPrescriptionsDMiddleName: TStringField
      FieldName = 'D.MiddleName'
      Size = 40
    end
    object dbPrescriptionsDLastName: TStringField
      FieldName = 'D.LastName'
      Size = 40
    end
    object dbPrescriptionsDSuffix: TStringField
      FieldName = 'D.Suffix'
      Size = 40
    end
    object dbPrescriptionsPFirstName: TStringField
      FieldName = 'P.FirstName'
      Size = 40
    end
    object dbPrescriptionsPMiddleName: TStringField
      FieldName = 'P.MiddleName'
      Size = 40
    end
    object dbPrescriptionsPLastName: TStringField
      FieldName = 'P.LastName'
      Size = 40
    end
    object dbPrescriptionsPSuffix: TStringField
      FieldName = 'P.Suffix'
      Size = 40
    end
    object dbPrescriptionsPrescription: TStringField
      FieldName = 'Prescription'
      Size = 255
    end
    object dbPrescriptionsDoctor: TStringField
      FieldKind = fkCalculated
      FieldName = 'Doctor'
      Size = 255
      Calculated = True
    end
    object dbPrescriptionsPatient: TStringField
      FieldKind = fkCalculated
      FieldName = 'Patient'
      Size = 255
      Calculated = True
    end
    object dbPrescriptionsLinkToDoctor: TStringField
      FieldName = 'LinkToDoctor'
      Size = 38
    end
    object dbPrescriptionsLinkToPatient: TStringField
      FieldName = 'LinkToPatient'
      Size = 38
    end
    object dbPrescriptionsCreated: TDateTimeField
      FieldName = 'Created'
    end
  end
  object dbPrescriptionsUpdateSQL: TWADOUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Prescriptions WHERE ID=:ID')
    Left = 258
    Top = 468
  end
  object dsPatientsSelection: TDataSource
    DataSet = dbPatientsSelection
    Left = 258
    Top = 289
  end
  object dbPatientsSelection: TWADODataSet
    CommandType = ctTableDirect
    CursorLocation = clServer
    Database = adodb
    DatabaseProvider = ''
    IndexName = ''
    Options = [opWithoutADOEvents, opWriteModifiedFieldsOnly]
    Params = <>
    TableName = 'Patients'
    UseADOVersion = avADO
    OnNewRecord = dbPatientsNewRecord
    Left = 142
    Top = 293
    object StringField1: TStringField
      FieldName = 'ID'
      Size = 38
    end
    object StringField2: TStringField
      FieldName = 'FirstName'
      Size = 40
    end
    object StringField3: TStringField
      FieldName = 'LastName'
      Size = 40
    end
    object StringField4: TStringField
      FieldName = 'MiddleName'
      Size = 40
    end
    object StringField5: TStringField
      FieldName = 'Suffix'
      Size = 40
    end
  end
  object dbDoctorsSelection: TWADODataSet
    CommandType = ctTableDirect
    CursorLocation = clServer
    Database = adodb
    DatabaseProvider = ''
    IndexName = ''
    Options = [opWithoutADOEvents, opWriteModifiedFieldsOnly]
    Params = <>
    TableName = 'Doctors'
    UseADOVersion = avADO
    OnNewRecord = dbDoctorsNewRecord
    Left = 144
    Top = 360
  end
  object dsDoctorsSelection: TDataSource
    DataSet = dbDoctorsSelection
    Left = 262
    Top = 360
  end
  object OpenDBDialog: TOpenDialog
    DefaultExt = 'accdb'
    Filter = 'Access Database (*.accdb)|*.accdb'
    Options = [ofReadOnly, ofHideReadOnly, ofEnableSizing]
    Title = 'Select Database'
    Left = 64
    Top = 176
  end
end
