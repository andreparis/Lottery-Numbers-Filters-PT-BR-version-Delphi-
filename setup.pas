unit setup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormSetup = class(TForm)
    etPair: TEdit;
    etOdd: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnSave: TButton;
    etSumMin: TEdit;
    etDezMin: TEdit;
    etDezMax: TEdit;
    etSumMax: TEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    (*procedure etDezMinChange(Sender: TObject);
    procedure etDezMaxChange(Sender: TObject);
    procedure etSumMaxChange(Sender: TObject);
    procedure etSumMinChange(Sender: TObject);*)
    procedure FormCreate(Sender: TObject);
  protected
  public
  end;

var
   TSetup: TFormSetup;

implementation
uses Unit1;

{$R *.dfm}

procedure TFormSetup.FormCreate(Sender: TObject);
var
setup: TextFile;
dezMin, dezMax, sumMin, sumMax, pair, odd: integer;
sdezMin, sdezMax, ssumMin, ssumMax, spair, sodd: string;
begin
     if fileexists('setup.txt') then
     begin
          AssignFile(setup, 'setup.txt');
          Reset(setup);
          ReadLn(setup, dezMin, dezMax);
          ReadLn(setup, sumMin, sumMax);
          ReadLn(setup, pair, odd);
          CloseFile(setup);
     end
     else
     begin
          dezMin := 3;
          dezMax := 5;
          sumMin := 110;
          sumMax := 250;
          pair := 5;
          odd := 5;
     end;
     sdezMin := IntToStr(dezMin);
     sdezMax := IntToStr(dezMax);
     ssumMin := IntToStr(sumMin);
     ssumMax := IntToStr(sumMax);
     spair := IntToStr(pair);
     sodd := IntToStr(odd);
     etDezMin.Text := sdezMin;
     etDezMax.Text := sdezMax;
     etSumMin.Text := ssumMin;
     etSumMax.Text := ssumMax;
     etPair.Text := Trim(spair);
     etOdd.Text := Trim(sodd);
end;

procedure TFormSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree
end;

procedure TFormSetup.btnSaveClick(Sender: TObject);
var
newFile: TextFile;
setup: TFormSetup;
main: TMain;
dezMin, dezMax, sumMin, sumMax, pair, odd: integer;
begin
     main := TMain.Create(Self);
     setup := TFormSetup.Create(Self);
     dezMin := StrToInt(etDezMin.Text);
     dezMax := StrToInt(etDezMax.Text);
     sumMin := StrToInt(etSumMin.Text);
     sumMax := StrToInt(etSumMax.Text);
     pair := StrToInt(etPair.Text);
     odd := StrToInt(etOdd.Text);
     try
       AssignFile(newFile, 'setup.txt');
       Rewrite(newFile);
       WriteLn(newFile, dezMin, ' ', dezMax);
       WriteLn(newFile, sumMin, ' ', sumMax);
       WriteLn(newFile, pair, ' ', odd);
       CloseFile(newFile);
       main.defString(etDezMin.Text, etDezMax.Text, etSumMin.Text, etSumMax.Text, etPair.Text, etOdd.Text);
       setup.Release;
       setup := nil;
       close;
     except
       showmessage('Erro ao salvar novas configurações. Por favor, tente novamente!')
     end;
end;
(*
procedure TFormSetup.etDezMinChange(Sender: TObject);
var
dezMin, dezMax: integer;
begin
     dezMin := StrToInt(etDezMin.Text);
     dezMax := StrToInt(etDezMax.Text);
     if (dezMin > dezMax) then btnSave.Enabled := False
     else btnSave.Enabled := True;
end;

procedure TFormSetup.etDezMaxChange(Sender: TObject);
var
dezMin, dezMax: integer;
begin
     dezMin := StrToInt(etDezMin.Text);
     dezMax := StrToInt(etDezMax.Text);
     if (dezMin > dezMax) then btnSave.Enabled := False
     else btnSave.Enabled := True;
end;

procedure TFormSetup.etSumMaxChange(Sender: TObject);
var
sumMin, sumMax: integer;
begin
     sumMin := StrToInt(etSumMin.Text);
     sumMax := StrToInt(etSumMax.Text);
     if (sumMin > sumMax) then btnSave.Enabled := False
     else btnSave.Enabled := True;
end;

procedure TFormSetup.etSumMinChange(Sender: TObject);
var
sumMin, sumMax: integer;
begin
     sumMin := StrToInt(etSumMin.Text);
     sumMax := StrToInt(etSumMax.Text);
     if (sumMin > sumMax) then btnSave.Enabled := False
     else btnSave.Enabled := True;
end;
*)
end.
