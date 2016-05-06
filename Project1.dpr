program Project1;

{$R *.res}

uses
  Forms,
  Unit1 in 'Unit1.pas',
  Utils in 'Utils.pas',
  Error in 'Error.pas',
  Filters in 'Filters.pas',
  formGen in 'formGen.pas' {formGenerator},
  GenNums in 'GenNums.pas',
  setup in 'setup.pas' {FormSetup};

begin
  Application.Initialize;
  Application.Title := 'Loteria';
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
