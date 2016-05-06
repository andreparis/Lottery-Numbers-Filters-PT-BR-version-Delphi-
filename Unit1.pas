unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, ComCtrls, Utils;

type
  TMain = class(TForm)
    MainMenu1: TMainMenu;
    options: TMenuItem;
    checkResult: TMenuItem;
    GerarJogos1: TMenuItem;
    exit: TMenuItem;
    edtGame: TEdit;
    btnConfirm: TButton;
    cbBetInterval: TCheckBox;
    lbConfirmGame: TLabel;
    lbCheckBox: TLabel;
    cbSeqGame: TCheckBox;
    cbLines: TCheckBox;
    cbPair: TCheckBox;
    cbOdd: TCheckBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    pb1: TProgressBar;
    lbCok: TLabel;
    lbCfail: TLabel;
    lbSeqFail: TLabel;
    lbPairFail: TLabel;
    lbDezFail: TLabel;
    lbOddFail: TLabel;
    lbSeqOk: TLabel;
    lbPairOk: TLabel;
    lbDezOk: TLabel;
    lbOddOk: TLabel;
    lbCount: TLabel;
    lbSeq: TLabel;
    lbPairs: TLabel;
    lbDezenas: TLabel;
    lbOdds: TLabel;
    lbQuadra: TLabel;
    lbQuina: TLabel;
    lbSena: TLabel;
    lbQuadraOk: TLabel;
    lbQuadraFail: TLabel;
    lbQuinaFail: TLabel;
    lbSenaFail: TLabel;
    lbQuinaOk: TLabel;
    lbSenaOk: TLabel;
    cbSena: TCheckBox;
    mmoResult: TMemo;
    lbFinish: TLabel;
    Configuraes1: TMenuItem;
    procedure btnConfirmClick(Sender: TObject);
    procedure GerarJogos1Click(Sender: TObject);
    procedure exitClick(Sender: TObject);
    procedure Configuraes1Click(Sender: TObject);
    procedure CreateForm(Sender: TObject);
  private
procedure init;
    function getGameResult(game: ArrayOfInteger): string;
    procedure paintInterface;
  public
    procedure defString(dezMin, dezMax, sumMin, sumMax, pair, odd: string);
  end;

var
  Main: TMain;

implementation
uses Error, Filters, formGen, setup;
{$R *.dfm}

procedure TMain.paintInterface;
var
setup: TextFile;
dezMin, dezMax, sumMin, sumMax, pair, odd: integer;
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
     defString(IntToStr(dezMin), IntToStr(dezMax), IntToStr(sumMin),
                      IntToStr(sumMax), IntToStr(pair), IntToStr(odd));
end;

procedure TMain.CreateForm(Sender: TObject);
begin
   paintInterface;
end;


procedure TMain.init;
begin
     lbCount.Font.Color := clWindowFrame;
     lbSeq.Font.Color := clWindowFrame;
     lbDezenas.Font.Color := clWindowFrame;
     lbPairs.Font.Color := clWindowFrame;
     lbOdds.Font.Color := clWindowFrame;
     lbOdds.Font.Color := clWindowFrame;
     lbQuadra.Font.Color := clWindowFrame;
     lbQuina.Font.Color := clWindowFrame;
     lbSena.Font.Color := clWindowFrame;
     lbQuadraOk.Visible := False;
     lbQuadraFail.Visible := False;
     lbQuinaFail.Visible := False;
     lbSenaFail.Visible := False;
     lbQuinaOk.Visible := False;
     lbSenaOk.Visible := False;
     lbCok.Visible := False;
     lbCfail.Visible := False;
     lbSeqOk.Visible := False;
     lbSeqFail.Visible := False;
     lbPairOk.Visible := False;
     lbPairFail.Visible := False;
     lbDezOk.Visible := False;
     lbDezFail.Visible := False;
     lbOddOk.Visible := False;
     lbOddFail.Visible := False;
     lbFinish.Visible := False;
     pb1.Visible := True;
end;

procedure TMain.defString(dezMin, dezMax, sumMin, sumMax, pair, odd: string);
begin
     cbBetInterval.Caption := 'Proibir soma de jogo fora de '+ sumMin+' a '+sumMax;
     cbLines.Caption := 'Proibir dezenas fora de '+dezMin+' a '+dezMax;
     cbPair.Caption := 'Proibir mais que '+pair+' pares';
     cbOdd.Caption := 'Proibir mais que '+odd+' �mpares';
end;

function TMain.getGameResult(game: ArrayOfInteger): string;
var
results: string;
begin
     results := '';
     if game[2] <> 0 then results := results+IntToStr(game[2])+' ';
     if game[3] <> 0 then results := results+IntToStr(game[3])+' ';
     if game[4] <> 0 then results := results+IntToStr(game[4])+' ';
     if game[5] <> 0 then results := results+IntToStr(game[5])+' ';
     if game[6] <> 0 then results := results+IntToStr(game[6])+' ';
     if game[7] <> 0 then results := results+IntToStr(game[7]);
     Result := results;
end;

procedure TMain.btnConfirmClick(Sender: TObject);
var
utils: TUtils;
filter: TFilters;
error: Errors;
num, game,numAux: ArrayOfInteger;
nstr, str, result: string;
i, count, dezMin, dezMax, sumMin, sumMax, pair, odd: integer;
setup: TextFile;
begin
     SetLength(num, 15);
     SetLength(numAux, 15);
     FillChar(str, SizeOf(str), #0);
     FillChar(nstr, SizeOf(nstr), #0);
     init;
     pb1.Position := 0;
     filter := TFilters.Create;
     utils := TUtils.Create;
     error := Errors.Create;
     str := edtGame.Text;
     numAux := utils.strInput(str);
     count := 0;
     while numAux[count] <> 0 do
     begin
          Inc(count);
     end;
     SetLength(num, count);
     count := 0;
     while numAux[count] <> 0 do
     begin
          num[count] := numAux[count];
          Inc(count);
     end;
     nstr := error.inputData(num[0], str);
     if fileexists('setup.txt') then
     begin
          AssignFile(setup, 'setup.txt');
          Reset(setup);
          ReadLn(setup, dezMin, dezMax);
          ReadLn(setup, sumMin, sumMax);
          ReadLn(setup, pair, odd);
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
     filter.setGlobalParams(dezMin, dezMax, sumMin, sumMax, odd, pair);
     try
       if (nstr = 'none') then
       begin
            nstr := '';
            pb1.Position := 20;
            if cbBetInterval.checked then
            begin
               lbCount.Font.Color := clWindowText;
               if filter.fSum(num) then
               begin
                    lbCfail.Visible := True;
               end
               else
               begin
                    lbCok.Visible := True;
               end;
            end;
            pb1.Position := 40;
            if cbLines.checked then
            begin
               lbDezenas.Font.Color := clWindowText;
               if filter.fNL(num) then
               begin
                    lbDezFail.Visible := True;
               end
               else
               begin
                    lbDezOk.Visible := True;
               end;
            end;
            pb1.Position := 60;
            if cbSeqGame.checked then
            begin
               lbSeq.Font.Color := clWindowText;
               if filter.fSeq(num) then
               begin
                    lbSeqFail.Visible := True;
               end
               else
               begin
                    lbSeqOk.Visible := True;
               end;
            end;
            pb1.Position := 80;
            if cbPair.checked then
            begin
               lbPairs.Font.Color := clWindowText;
               if filter.fNP(num) then
               begin
                    lbPairFail.Visible := True;
               end
               else
               begin
                    lbPairOk.Visible := True;
               end;
            end;
            if cbOdd.checked then
            begin
               lbOdds.Font.Color := clWindowText;
               if filter.fNO(num) then
               begin
                    lbOddFail.Visible := True;
               end
               else
               begin
                    lbOddOk.Visible := True;
               end;
            end;
            if cbSena.checked then
            begin
                 if DirectoryExists('Jogos\') then
                 begin
                    lbQuadra.Font.Color := clWindowText;
                    lbQuina.Font.Color := clWindowText;
                    lbSena.Font.Color := clWindowText;
                    game := filter.fQQS(num);
                    if game[0] >= 4 then
                    begin
                      result := 'Jogo '+getGameResult(game)+' do arquivo '+
                             'Jogo('+IntToStr(game[1])+').txt';
                      if game[0] = 4 then
                      begin
                           lbQuadraOk.Visible := True;
                           lbQuinaFail.Visible := True;
                           lbSenaFail.Visible := True;
                      end;
                      if game[0] = 5 then
                      begin
                           lbQuinaOk.Visible := True;
                           lbQuadraFail.Visible := True;
                           lbSenaFail.Visible := True;
                      end;
                      if game[0] = 6 then
                      begin
                           lbSenaOk.Visible := True;
                           lbQuinaFail.Visible := True;
                           lbQuadraFail.Visible := True;
                      end;
                    end
                    else
                    begin
                         result := '';
                         lbQuadraFail.Visible := True;
                         lbQuinaFail.Visible := True;
                         lbSenaFail.Visible := True;
                    end;
                    mmoResult.Clear;
                    mmoResult.Lines.Add(result);
                 end
                 else
                 begin
                      showMessage('Pasta Jogos n�o encontrada!');
                 end;
            end;
            pb1.Position := 100;
            pb1.Visible := False;
            lbFinish.Visible := True;
       end
       else
       begin
            showMessage(nstr);
       end;
       Finalize(num);
       Finalize(game);
     Except
        ShowMessage('Desculpe, mas ocorreu um erro durante a execu��o do programa!');
     end;
end;

procedure TMain.GerarJogos1Click(Sender: TObject);
var
generator: TformGenerator;
main: TMain;
begin
     main := TMain.Create(Self);
     generator := TformGenerator.Create(Self);
     Application.ShowMainForm := False;
     main.free;
     generator.ShowModal;
     paintInterface;
end;

procedure TMain.exitClick(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TMain.Configuraes1Click(Sender: TObject);
var
setup: TFormSetup;
main: TMain;
begin
     setup := TFormSetup.Create(Self);
     main := TMain.Create(Self);
     Application.ShowMainForm := False;
     main.free;
     setup.ShowModal;
     paintInterface;
end;


end.
