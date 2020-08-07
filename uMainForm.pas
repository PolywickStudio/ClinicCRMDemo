unit uMainForm;

interface

uses
  Data.Bind.Components,
  Data.Bind.Controls,
  Data.Bind.DBScope,
  Data.Bind.EngExt,
  Data.Bind.Grid,
  Data.DB,
  System.Actions,
  System.Bindings.Outputs,
  System.Classes,
  System.ImageList,
  System.IOUtils,
  System.Rtti,
  System.SysUtils,
  System.Variants,
  Vcl.ActnList,
  Vcl.BaseImageCollection,
  Vcl.Bind.DBEngExt,
  Vcl.Bind.Editors,
  Vcl.Bind.Grid,
  Vcl.Bind.Navigator,
  Vcl.Buttons,
  Vcl.ComCtrls,
  Vcl.Controls,
  Vcl.DBCtrls,
  Vcl.DBGrids,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Vcl.Grids,
  Vcl.ImageCollection,
  Vcl.Imaging.pngimage,
  Vcl.ImgList,
  Vcl.Menus,
  Vcl.StdCtrls,
  Vcl.Themes,
  Vcl.TitleBarCtrls,
  Vcl.VirtualImage,
  Vcl.VirtualImageList,
  Vcl.WinXCalendars,
  Vcl.WinXCtrls,
  Vcl.WinXPanels,
  Winapi.Messages,
  Winapi.Windows;

type
  TMainForm = class(TForm)
    PatientRelativePanel: TRelativePanel;
    ActiveLeadsPanel: TPanel;
    BindDoctors: TBindSourceDB;
    BindingsList1: TBindingsList;
    BindPrescriptions: TBindSourceDB;
    CalendarButton: TButton;
    CalendarTab: TTabSheet;
    CalendarView1: TCalendarView;
    ClinicButton: TButton;
    ClinicDBNavigator: TDBNavigator;
    ClinicTab: TTabSheet;
    ClosedPanel: TPanel;
    ConsultBindNewSourceD: TBindSourceDB;
    ConsultSearchBox: TSearchBox;
    CreatePatientButton: TSpeedButton;
    CreateConsultButton: TSpeedButton;
    CreatePrescriptionButton: TSpeedButton;
    CreateUserButton: TSpeedButton;
    dgDoctors: TDBGrid;
    dgPatients: TDBGrid;
    dgPrescriptions: TDBGrid;
    DoctorsSearchBox: TSearchBox;
    ExportAcctsDialog: TSaveDialog;
    ExportLeadsDialog: TSaveDialog;
    gdInClinic: TDBGrid;
    gdLeft: TDBGrid;
    gdNew: TDBGrid;
    gdSeenDoctor: TDBGrid;
    gridPopupMenu: TPopupMenu;
    Image5: TImage;
    ImageCollection1: TImageCollection;
    ImportLeadsDialog: TOpenDialog;
    Label1: TLabel;
    Label3: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    lblTitle: TLabel;
    LeadsBindActiveSourceDB: TBindSourceDB;
    LeadsBindClosedSourceDB: TBindSourceDB;
    LeadsBindNewSourceDB: TBindSourceDB;
    LeadsBindProposalSentSourceDB: TBindSourceDB;
    LeadsBindSourceDB: TBindSourceDB;
    ClinicRelativePanel: TRelativePanel;
    MenuVirtualImage: TVirtualImage;
    N1: TMenuItem;
    N2: TMenuItem;
    NavPanel: TPanel;
    NewLeadsPanel: TPanel;
    PageControl: TPageControl;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    PatientsButton: TButton;
    PatientsDBNavigator: TDBNavigator;
    PatientSearchBox: TSearchBox;
    PatientsTab: TTabSheet;
    pmAdd: TMenuItem;
    pmDelete: TMenuItem;
    pmRefresh: TMenuItem;
    pmView: TMenuItem;
    pnlToolbar: TPanel;
    PrescriptionDBNavigator: TDBNavigator;
    PrescriptionsButton: TButton;
    PrescriptionsSearchBox: TSearchBox;
    PrescriptionsTab: TTabSheet;
    ProposalSentPanel: TPanel;
    ProposalsRelativePanel: TRelativePanel;
    RemovePatientButton: TSpeedButton;
    RemoveUserButton: TSpeedButton;
    SaveEmailsDialog: TSaveDialog;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    SplitView: TSplitView;
    StaffDBNavigator: TDBNavigator;
    StaffTab: TTabSheet;
    TitleBarPanel1: TTitleBarPanel;
    UsernameComboBox: TComboBox;
    UsersButton: TButton;
    UsersRelativePanel: TRelativePanel;
    VCLStylesCB: TComboBox;
    ViewConsultButton: TSpeedButton;
    ViewPrescriptionButton: TSpeedButton;
    VirtualImage2: TVirtualImage;
    VirtualImage3: TVirtualImage;
    VirtualImage4: TVirtualImage;
    VirtualImage6: TVirtualImage;
    VirtualImage7: TVirtualImage;
    VirtualImageList1: TVirtualImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PatientRelativePanelResize(Sender: TObject);
    procedure CalendarView1DrawDayItem(Sender: TObject; DrawParams: TDrawViewInfoParams;
      CalendarViewViewInfo: TCellItemViewInfo);
    procedure ClinicDBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure ConsultSearchBoxInvokeSearch(Sender: TObject);
    procedure CreatePatientButtonClick(Sender: TObject);
    procedure CreateConsultButtonClick(Sender: TObject);
    procedure CreatePrescriptionButtonClick(Sender: TObject);
    procedure CreateUserButtonClick(Sender: TObject);
    procedure DashboardButtonClick(Sender: TObject);
    procedure dgPrescriptionsDblClick(Sender: TObject);
    procedure DoctorsSearchBoxInvokeSearch(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gdClinicDblClick(Sender: TObject);
    procedure gdClinicDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure gdClinicDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean);
    procedure gdClinicEnter(Sender: TObject);
    procedure gridPopupMenuPopup(Sender: TObject);
    procedure ClinicRelativePanelResize(Sender: TObject);
    procedure MenuVirtualImageClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure PatientSearchBoxInvokeSearch(Sender: TObject);
    procedure pmAddClick(Sender: TObject);
    procedure pmDeleteClick(Sender: TObject);
    procedure pmRefreshClick(Sender: TObject);
    procedure pmViewClick(Sender: TObject);
    procedure PrescriptionDBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
    procedure PrescriptionsSearchBoxInvokeSearch(Sender: TObject);
    procedure ProposalsRelativePanelResize(Sender: TObject);
    procedure RemovePatientButtonClick(Sender: TObject);
    procedure RemoveUserButtonClick(Sender: TObject);
    procedure Splitter3CanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
    procedure SplitViewClosing(Sender: TObject);
    procedure SplitViewOpening(Sender: TObject);
    procedure UsernameComboBoxChange(Sender: TObject);
    procedure UsernameComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure UsersRelativePanelResize(Sender: TObject);
    procedure VCLStylesCBChange(Sender: TObject);
    procedure VCLStylesCBKeyPress(Sender: TObject; var Key: Char);
    procedure ViewConsultButtonClick(Sender: TObject);
    procedure ViewPrescriptionButtonClick(Sender: TObject);
  private
    { Private declarations }
    FRanOnce: Boolean;
    procedure AppIdle(Sender: TObject; var Done: Boolean);
    procedure UpdateNavButtons;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uConsultation,
  uDataMod,
  uDraftProposal,
  uLeads,
  uPrescription,
  uProposal;

procedure TMainForm.AppIdle(Sender: TObject; var Done: Boolean);
begin
  if not FRanOnce then begin
    FRanOnce := True;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  Application.OnIdle := AppIdle;

  for StyleName in TStyleManager.StyleNames do
    VCLStylesCB.Items.Add(StyleName);

  VCLStylesCB.ItemIndex := VCLStylesCB.Items.IndexOf(TStyleManager.ActiveStyle.Name);

  UpdateNavButtons;
  CalendarView1.Date := Now;
  PageControl.ActivePageIndex := 0;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  if FRanOnce then begin
  end;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  if MainForm.Width <= 640 then begin
    if SplitView.Opened = True then
      SplitView.Opened := False;
  end else begin
    if SplitView.Opened = False then
      SplitView.Opened := True;
  end;
end;

procedure TMainForm.PageControlChange(Sender: TObject);
begin
  if PageControl.ActivePageIndex = PatientsTab.PageIndex then begin
    PatientsButton.SetFocus;
  end else
  if PageControl.ActivePageIndex = CalendarTab.PageIndex then begin
    CalendarButton.SetFocus;
  end else
  if PageControl.ActivePageIndex = StaffTab.PageIndex then begin
    UsersButton.SetFocus;
  end else
  if PageControl.ActivePageIndex = ClinicTab.PageIndex then begin
    DM.dbConsultNew.Active := false;
    DM.dbConsultVisited.Active := false;
    DM.dbConsultSeenDoctor.Active := false;
    DM.dbConsultLeft.Active := false;

    DM.dbConsultNew.Active := true;
    DM.dbConsultVisited.Active := true;
    DM.dbConsultSeenDoctor.Active := true;
    DM.dbConsultLeft.Active := true;
    ClinicButton.SetFocus;
  end else
  if PageControl.ActivePageIndex = PrescriptionsTab.PageIndex then begin
    if dgPrescriptions.DataSource.DataSet.Active = false then
      dgPrescriptions.DataSource.DataSet.Active := true;
    dgPrescriptions.DataSource.DataSet.Refresh;
    PrescriptionsButton.SetFocus;
  end;
end;

procedure TMainForm.UsernameComboBoxChange(Sender: TObject);
begin
  LeadsForm.Close;
  DraftProposalForm.Close;
  ProposalForm.Close;
end;

procedure TMainForm.UsernameComboBoxKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TMainForm.SplitViewClosing(Sender: TObject);
begin
  PatientsButton.Caption := '';
  ClinicButton.Caption := '';
  PrescriptionsButton.Caption := '';
  CalendarButton.Caption := '';
  UsersButton.Caption := '';
end;

procedure TMainForm.SplitViewOpening(Sender: TObject);
begin
  PatientsButton.Caption := '          ' + PatientsButton.Hint;
  ClinicButton.Caption := '          ' + ClinicButton.Hint;
  PrescriptionsButton.Caption := '          ' + PrescriptionsButton.Hint;
  CalendarButton.Caption := '          ' + CalendarButton.Hint;
  UsersButton.Caption := '          ' + UsersButton.Hint;
end;

//==================================================================================================
// CALENDAR
//==================================================================================================

procedure TMainForm.CalendarView1DrawDayItem(Sender: TObject;
  DrawParams: TDrawViewInfoParams; CalendarViewViewInfo: TCellItemViewInfo);
begin
  if DayOfWeek(CalendarViewViewInfo.Date) in [1, 7] then begin
    DrawParams.Font.Style := [fsBold];
  end;
end;

//==================================================================================================
// PATIENTS
//==================================================================================================

procedure TMainForm.PatientRelativePanelResize(Sender: TObject);
begin
  if PatientRelativePanel.Width <= 634 then begin
    CreatePatientButton.Caption := '';
    CreatePatientButton.Width := 40;
    RemovePatientButton.Caption := '';
    RemovePatientButton.Width := 40;
  end else begin
    CreatePatientButton.Caption := CreatePatientButton.Hint;
    CreatePatientButton.Width := 112;
    RemovePatientButton.Caption := RemovePatientButton.Hint;
    RemovePatientButton.Width := 112;
  end;
end;

procedure TMainForm.CreatePatientButtonClick(Sender: TObject);
begin
  DM.dbPatients.Insert;
end;

procedure TMainForm.RemovePatientButtonClick(Sender: TObject);
begin
  PatientsDBNavigator.BtnClick(nbDelete);
end;

procedure TMainForm.PatientSearchBoxInvokeSearch(Sender: TObject);
begin
  dgPatients.BeginUpdate;
  DM.SearchPatients(PatientSearchBox.Text);
  dgPatients.EndUpdate;
end;

//==================================================================================================
// CLINIC
//==================================================================================================

procedure TMainForm.CreateConsultButtonClick(Sender: TObject);
var
  iStatus: integer;
  frm: TConsultationForm;
begin
  DM.dbConsultations.Insert;
  if Assigned(ClinicDBNavigator.DataSource) then begin
    iStatus := ClinicDBNavigator.DataSource.DataSet.Tag;
  end else begin
    iStatus := 0;
  end;
  frm := TConsultationForm.Create(nil);
  try
    frm.ID := DM.dbConsultationsID.AsString;
    frm.Init(true, iStatus);
    frm.UserName := UsernameCombobox.Text;
    frm.ShowModal;
    if (frm.Status >= 0) then begin
      case frm.Status of
        IndexNew: gdNew.DataSource.DataSet.Refresh;
        IndexVisited: gdInClinic.DataSource.DataSet.Refresh;
        IndexSeenDoctor: gdSeenDoctor.DataSource.DataSet.Refresh;
        IndexLeft: gdLeft.DataSource.DataSet.Refresh;
      end;
    end else begin
      //DM.dbConsultations.Cancel;
    end;
  finally
    frm.Free;
  end;
end;

procedure TMainForm.pmAddClick(Sender: TObject);
begin
  CreateConsultButtonClick(Sender);
end;

procedure TMainForm.pmDeleteClick(Sender: TObject);
begin
  ClinicDBNavigator.DataSource.DataSet.Delete;
  ClinicDBNavigator.DataSource.DataSet.Refresh;
end;

procedure TMainForm.pmRefreshClick(Sender: TObject);
begin
  ClinicDBNavigator.DataSource.DataSet.Refresh;
end;

procedure TMainForm.pmViewClick(Sender: TObject);
begin
  ViewConsultButtonClick(Sender);
end;

procedure TMainForm.ClinicDBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then begin
    ClinicDBNavigator.DataSource.DataSet.Refresh;
  end;
end;

procedure TMainForm.gdClinicEnter(Sender: TObject);
begin
  ClinicDBNavigator.DataSource := TDBGrid(Sender).DataSource;
end;

procedure TMainForm.gdClinicDblClick(Sender: TObject);
begin
  ViewConsultButtonClick(Sender);
end;

procedure TMainForm.gdClinicDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
  var Accept: Boolean);
begin
  Accept := Source is TDBGrid;
end;

procedure TMainForm.gdClinicDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  CID: string;
begin
  if (Source <> Sender) then begin
    CID := TDBGrid(Source).Fields[0].AsString;
    if (CID <> '') then begin
      if DM.dbConsultations.Locate('ID', CID, []) then begin
        DM.dbConsultations.Edit;
        case TDBGrid(Sender).Tag of
          0: DM.dbConsultationsStatus.AsString := 'Booked Today';
          1: begin
              DM.dbConsultationsStatus.AsString := 'In Clinic';
              if (DM.dbConsultationsVisited.AsDateTime = 0) then begin
                DM.dbConsultationsVisited.AsDateTime := Now;
              end;
            end;
          2: begin
              DM.dbConsultationsStatus.AsString := 'Seen Doctor';
              if (DM.dbConsultationsVisited.AsDateTime = 0) then begin
                DM.dbConsultationsVisited.AsDateTime := Now;
              end;
            end;
          3: DM.dbConsultationsStatus.AsString := 'Left';
        end;
        DM.dbConsultations.Post;
      end;
    end;
    TDBGrid(Source).DataSource.DataSet.Refresh;
    TDBGrid(Sender).DataSource.DataSet.Refresh;
    ClinicDBNavigator.DataSource := TDBGrid(Sender).DataSource;
    TDBGrid(Sender).SetFocus;
  end;
end;

procedure TMainForm.ClinicRelativePanelResize(Sender: TObject);
begin
  if ClinicRelativePanel.Width <= 781 then begin
    CreateConsultButton.Caption := '';
    CreateConsultButton.Width := 40;
    ViewConsultButton.Caption := '';
    ViewConsultButton.Width := 40;
  end else begin
    CreateConsultButton.Caption := CreateConsultButton.Hint;
    CreateConsultButton.Width := 153;
    ViewConsultButton.Caption := ViewConsultButton.Hint;
    ViewConsultButton.Width := 153;
  end;
end;

procedure TMainForm.Splitter3CanResize(Sender: TObject; var NewSize: Integer; var Accept: Boolean);
begin
  Accept := ((Splitter3.Left + NewSize + 230) < Self.ClientWidth);
end;

//==================================================================================================
// PRESCRIPTIONS
//==================================================================================================

procedure TMainForm.ViewPrescriptionButtonClick(Sender: TObject);
var
  CID: string;
  PID: string;
  DID: string;
  frm: TPrescriptionForm;
begin
  CID := PrescriptionDBNavigator.DataSource.DataSet.FieldByName('ID').AsString;
  DID := PrescriptionDBNavigator.DataSource.DataSet.FieldByName('LinkToDoctor').AsString;
  ;
  PID := PrescriptionDBNavigator.DataSource.DataSet.FieldByName('LinkToPatient').AsString;
  ;
  if (CID <> '') then begin
    frm := TPrescriptionForm.Create(nil);
    try
      frm.ID := CID;
      frm.Init;
      frm.DoctorID := DID;
      frm.PatientID := PID;
      frm.ShowModal;
      if frm.Saved then begin
        PrescriptionDBNavigator.DataSource.DataSet.Refresh;
      end;
    finally
      frm.Free;
    end;
  end;
end;

procedure TMainForm.PrescriptionsSearchBoxInvokeSearch(Sender: TObject);
begin
  dgPrescriptions.BeginUpdate;
  DM.SearchPrescriptions(PrescriptionsSearchBox.Text);
  dgPrescriptions.EndUpdate;
end;

procedure TMainForm.DoctorsSearchBoxInvokeSearch(Sender: TObject);
begin
  dgDoctors.BeginUpdate;
  DM.SearchDoctors(DoctorsSearchBox.Text);
  dgDoctors.BeginUpdate;
end;

procedure TMainForm.UsersRelativePanelResize(Sender: TObject);
begin
  if UsersRelativePanel.Width <= 436 then begin
    CreateUserButton.Caption := '';
    CreateUserButton.Width := 40;
    RemoveUserButton.Caption := '';
    RemoveUserButton.Width := 40;
  end else begin
    CreateUserButton.Caption := CreateUserButton.Hint;
    CreateUserButton.Width := 121;
    RemoveUserButton.Caption := RemoveUserButton.Hint;
    RemoveUserButton.Width := 121;
  end;
end;

procedure TMainForm.VCLStylesCBChange(Sender: TObject);
begin
  MainForm.WindowState := TWindowState.wsMaximized;
  TStyleManager.TrySetStyle(VCLStylesCB.Text);
  UpdateNavButtons;
end;

procedure TMainForm.VCLStylesCBKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
end;

procedure TMainForm.ViewConsultButtonClick(Sender: TObject);
var
  CID: string;
  frm: TConsultationForm;
begin
  if Assigned(ClinicDBNavigator.DataSource) then begin
    CID := ClinicDBNavigator.DataSource.DataSet.FieldByName('ID').AsString;
    if (CID <> '') then begin
      frm := TConsultationForm.Create(nil);
      try
        frm.ID := CID;
        frm.Init;
        frm.ShowModal;
        if (frm.Status >= 0) then
          ClinicDBNavigator.DataSource.DataSet.Refresh;
        case frm.Status of
          IndexNew: gdNew.DataSource.DataSet.Refresh;
          IndexVisited: gdInClinic.DataSource.DataSet.Refresh;
          IndexSeenDoctor: gdSeenDoctor.DataSource.DataSet.Refresh;
          IndexLeft: gdLeft.DataSource.DataSet.Refresh;
        end;
      finally
        frm.Free;
      end;
    end;
  end;
end;

procedure TMainForm.MenuVirtualImageClick(Sender: TObject);
begin
  SplitView.Opened := not SplitView.Opened;
end;

procedure TMainForm.ProposalsRelativePanelResize(Sender: TObject);
begin
  if ProposalsRelativePanel.Width <= 436 then begin
    CreatePrescriptionButton.Caption := '';
    CreatePrescriptionButton.Width := 40;
    ViewPrescriptionButton.Caption := '';
    ViewPrescriptionButton.Width := 40;
  end else begin
    CreatePrescriptionButton.Caption := CreatePrescriptionButton.Hint;
    CreatePrescriptionButton.Width := 121;
    ViewPrescriptionButton.Caption := ViewPrescriptionButton.Hint;
    ViewPrescriptionButton.Width := 153;
  end;
end;

procedure TMainForm.CreatePrescriptionButtonClick(Sender: TObject);
var
  frm: TPrescriptionForm;
begin
  DM.dbPrescriptionsMaster.Insert;
  frm := TPrescriptionForm.Create(nil);
  try
    frm.ID := DM.dbPrescriptionsMasterID.AsString;
    frm.Init(true);
    frm.ShowModal;
    if frm.Saved then begin
      PrescriptionDBNavigator.DataSource.DataSet.Refresh;
    end else begin
      //DM.dbPrescriptionsMaster.Cancel;
    end;
  finally
    frm.Free;
  end;
  dgPrescriptions.DataSource.DataSet.Refresh;
end;

procedure TMainForm.CreateUserButtonClick(Sender: TObject);
begin
  DM.dbDoctors.Insert;
end;

procedure TMainForm.DashboardButtonClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := TButton(Sender).Tag;
end;

procedure TMainForm.PrescriptionDBNavigatorClick(Sender: TObject; Button: TNavigateBtn);
begin
  if Button = nbDelete then begin
    PrescriptionDBNavigator.DataSource.DataSet.Refresh;
  end;
end;

procedure TMainForm.dgPrescriptionsDblClick(Sender: TObject);
begin
  ViewPrescriptionButtonClick(ViewPrescriptionButton);
end;

procedure TMainForm.gridPopupMenuPopup(Sender: TObject);
begin
  pmDelete.Visible := ClinicDBNavigator.DataSource.DataSet.RecordCount > 0;
  pmView.Visible := pmDelete.Visible;
end;

procedure TMainForm.ConsultSearchBoxInvokeSearch(Sender: TObject);
begin
  DM.SearchConsults(ConsultSearchBox.Text);
end;

procedure TMainForm.UpdateNavButtons;
var
  LStyle: Dword;
begin
  LStyle := GetWindowLong(PatientsButton.Handle, GWL_STYLE);
  SetWindowLong(PatientsButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  PatientsButton.Caption := '          ' + PatientsButton.Hint;
  SetWindowLong(ClinicButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  ClinicButton.Caption := '          ' + ClinicButton.Hint;
  SetWindowLong(PrescriptionsButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  PrescriptionsButton.Caption := '          ' + PrescriptionsButton.Hint;
  SetWindowLong(CalendarButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  CalendarButton.Caption := '          ' + CalendarButton.Hint;
  SetWindowLong(UsersButton.Handle, GWL_STYLE, LStyle or BS_LEFT);
  UsersButton.Caption := '          ' + UsersButton.Hint;
end;

procedure TMainForm.RemoveUserButtonClick(Sender: TObject);
begin
  StaffDBNavigator.BtnClick(nbDelete);
end;

end.

