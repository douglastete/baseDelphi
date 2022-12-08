unit Master;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls;

type
  TFormMaster = class(TForm)
    pnlBotoes: TPanel;
    btnSair: TButton;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMaster: TFormMaster;

implementation

{$R *.dfm}

uses Biblio;


procedure TFormMaster.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMaster.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFormMaster.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (not Assigned(Self.ActiveControl)) or
     (Self.ActiveControl.Name = 'edtCodigo') then
  begin
    Exit;
  end;

  if Self.ActiveControl is TDBEdit then
  begin
    if Assigned(TDBEdit(Self.ActiveControl).OnKeyDown) then
    begin
      Exit;
    end;
  end;

  if Self.ActiveControl is TEdit then
  begin
    if Assigned(TEdit(Self.ActiveControl).OnKeyDown) then
    begin
      Exit;
    end;
  end;

  if (Key = VK_RETURN) then
  begin
    Perform(WM_NEXTDLGCTL, 0, 0);
    Key := 0;
  end;
end;

procedure TFormMaster.FormShow(Sender: TObject);
begin
  Top  := 0;
  Left := (Application.MainForm.Width - Width) div 2;
end;

end.
