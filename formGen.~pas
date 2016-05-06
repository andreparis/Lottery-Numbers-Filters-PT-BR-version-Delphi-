unit formGen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, Utils;

type
  TformGenerator = class(TForm)
    btnGen: TButton;
    Menu: TMainMenu;
    options: TMenuItem;
    checkResult: TMenuItem;
    GerarJogos1: TMenuItem;
    exit: TMenuItem;
    progressBar: TProgressBar;
    mmoLot: TMemo;
    lbInfFilters: TStaticText;
    Bevel1: TBevel;
    btn12: TButton;
    Configuraes1: TMenuItem;
    procedure btnGenClick(Sender: TObject);
    procedure checkResultClick(Sender: TObject);
    procedure exitClick(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Configuraes1Click(Sender: TObject);
  private
    function setActGame(n1, n2, n3, n4, n5, n6: integer): ArrayOfInteger;
    function compGames(game: ArrayOfInteger; n1, n2, n3, n4, n5, n6: integer): integer;
  public
    { Public declarations }
  end;

var
  formGenerator: TformGenerator;

implementation
uses Filters, ComObj, Unit1, setup;

{$R *.dfm}

procedure TformGenerator.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action := caFree
end;

function TformGenerator.compGames(game: ArrayOfInteger; n1, n2, n3, n4, n5, n6: integer): integer;
var count, m: integer;
begin
     count := 0;
    for m := 0 to Length(game) do
    begin
         if game[m] = n1 then
         begin
              Inc(count);
         end
         else if game[m] = n2 then
         begin
              Inc(count);
         end
         else if game[m] = n3 then
         begin
              Inc(count);
         end
         else if game[m] = n4 then
         begin
              Inc(count);
         end
         else if game[m] = n5 then
         begin
              Inc(count);
         end
         else if game[m] = n6 then
         begin
              Inc(count);
         end
    end;
    Result := count;
end;

function TformGenerator.setActGame(n1, n2, n3, n4, n5, n6: integer): ArrayOfInteger;
var
results: ArrayOfInteger;
begin
     setLength(results, 6);
     results[0] := n1;
     results[1] := n2;
     results[2] := n3;
     results[3] := n4;
     results[4] := n5;
     results[5] := n6;
     Result := results;
end;

procedure TformGenerator.btnGenClick(Sender: TObject);
var
filter: TFilters;
myFile : TextFile;
i, j, k, l, m, n: integer;
dezMin, dezMax, sumMin, sumMax, pair, odd: integer;
count, fileNum, aux: LongInt;
num: ArrayOfInteger;
setup: TextFile;
begin
     SetLength(num, 6);
     filter := TFilters.Create;
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
     filter.setGlobalParams(dezMin, dezMax, sumMin, sumMax, odd, pair);

     btnGen.Enabled := False;
     progressbar.visible:=true;
     progressBar.Position := 0;

     if DirectoryExists('Jogos\') = False then
        CreateDir('Jogos\');
     AssignFile(myFile, 'Jogos\Jogos(0).txt');
     Rewrite(myFile);
     
     progressBar.Position := 25;
     count := 0;
     fileNum := 1;
     aux := 0;
     try
        progressBar.Position := 50;
        for i := 1 to 20 do
        begin
           for j := i+1 to 30 do
           begin
               for k := j+1 to 40 do
                begin
                     for l := k+1 to 50 do
                     begin
                         for m := l+1 to 59 do
                          begin
                               for n := m+1 to 60 do
                               begin
                                  num[0] := i;
                                  num[1] := j;
                                  num[2] := k;
                                  num[3] := l;
                                  num[4] := m;
                                  num[5] := n;
                                  if NOT filter.fSum(num) then
                                     if NOT filter.fSeq(num) then
                                          if NOT filter.fNL(num) then
                                             if NOT filter.fNP(num) then
                                                 if NOT filter.fNO(num) then
                                                 begin
                                                      if (count = 100000) then
                                                      begin
                                                           CloseFile(myFile);
                                                           AssignFile(myFile, 'Jogos\Jogos('+IntToStr(fileNum)+').txt');
                                                           Rewrite(myFile);
                                                           //append(myFile);
                                                           count := 0;
                                                           Inc(fileNum);
                                                      end;
                                                      WriteLn(myFile, i, ' ', j, ' ', k, ' ', l, ' ', m, ' ', n);
                                                      Inc(count);
                                                      if (aux < 2147483647) then
                                                              Inc(aux);
                                                      if i > 15 then
                                                         progressBar.Position := 75;
                                                      if i > 24 then
                                                         progressBar.Position := 90;
                                                      if ((num[0]=55) and (num[1]=56) and
                                                         (num[2]=57) and (num[3]=58) and
                                                         (num[4]=59) and (num[5]=60)) then
                                                         break;
                                                 end;
                                    {if i > 35 then
                                    begin
                                     mmoLot.clear;
                                     // mmoLot.Lines.Add(IntToStr(i)+' '+IntToStr(j)+' '+IntToStr(k)+' '+
                                     // IntToStr(l)+' '+IntToStr(m)+' '+IntToStr(n));
                                    end;}
                               end;
                          end;
                     end;
                end;
           end;
        end;
        CloseFile(myFile);
        Finalize(num);
        progressBar.Position := 100;
        progressbar.visible := false;
        mmoLot.clear;
        if (aux < 2147483646) then
        begin
           mmoLot.Lines.Add('Foram gerados '+IntToStr(aux)+' resultados');
        end
        else
        begin
           mmoLot.Lines.Add('Mais do que '+IntToStr(aux)+' resultados gerados');
        end;
        btnGen.Enabled := True;
     except
        showmessage('\Erro ao gerar resultado!');
     end;
end;

procedure TformGenerator.checkResultClick(Sender: TObject);
var
generator: TformGenerator;
begin
     generator := TformGenerator.Create(Self);
     try
       generator.Release;
       generator := nil;
       close;
     except
       showmessage('\Erro! Por favor, tente fechar e abrir o programa.')
     end;
end;

procedure TformGenerator.exitClick(Sender: TObject);
begin
     Application.Terminate;
end;


procedure TformGenerator.btn12Click(Sender: TObject);
var
actualGame, axu1: ArrayOfInteger;
a, b, c, d, e, f, g, h, i, j, k, l, m, pToGame: integer;
pToGameAux: boolean;
myFile, tFile, newFile: TextFile;
fileName, tName,nfName: String;
n1, n2, n3, n4, n5, n6, p1, p2, p3, p4, p5, p6: integer;
count, aux, pToNfile, pToMyFile, numGames: LongInt;
begin
      if DirectoryExists('Jogos\') = False then
      begin
           raise Exception.Create('Por favor, gere os jogos de 6!');
      end;
      if DirectoryExists('Jogos\Jogos12\') = False then
         CreateDir('Jogos\Jogos12\');
      progressBar.Visible := True;
      progressBar.Position := 0;
      nfName := 'Jogos\Jogos12\Jogos(0).txt';
      AssignFile(newFile, nfName);
      Rewrite(newFile);
      pToNfile := 1;
      SetLength(actualGame, 6);
      SetLength(axu1, 6);
      numGames := 0;
      count := 0;
      pToMyFile := 0;
      progressBar.Position := 25;
      try
        while True do
        begin
             if pToMyFile = 150 then progressBar.Position := 50;
             if pToMyFile = 250 then progressBar.Position := 75;
             if pToMyFile = 290 then progressBar.Position := 95;
             fileName := 'Jogos\Jogos('+IntToStr(pToMyFile)+').txt';
             if fileexists(fileName) = False then break;
             AssignFile(myFile, fileName);
             Reset(myFile);
             while not Eof(myFile) do
             begin
                  ReadLn(myFile, n1, n2, n3, n4, n5, n6);
                  actualGame := setActGame(n1, n2, n3, n4, n5, n6);
                  aux := pToMyFile;
                  pToGameAux := True;
                  while True do
                  begin
                       tName := 'Jogos\Jogos('+IntToStr(aux)+').txt';
                       if fileexists(tName) = False then break;
                       AssignFile(tFile, tName);
                       Reset(tFile);
                       while not Eof(tFile) do
                       begin
                            if pToGameAux then
                            begin
                                 while pToGame < 6 do
                                 begin
                                      ReadLn(tFile, p1, p2, p3, p4, p5, p6);
                                      pToGame := compGames(actualGame, p1, p2, p3, p4, p5, p6);
                                 end;

                                 pToGameAux := False;
                            end;
                            ReadLn(tFile, p1, p2, p3, p4, p5, p6);
                            pToGame := compGames(actualGame, p1, p2, p3, p4, p5, p6);
                            if  ((pToGame = 0) AND (p1 <> 0) AND (p2 <> 0) AND (p3 <> 0)
                                AND (p4 <> 0) AND (p5 <> 0) AND (p6 <> 0)) then
                            begin
                                 WriteLn(newFile, n1, ' ', n2, ' ', n3, ' ', n4, ' ', n5, ' ', n6,
                                             ' ', p1, ' ', p2, ' ', p3, ' ', p4, ' ', p5, ' ', p6);
                                 Inc(count);
                                 Inc(numGames);
                                 if (count = 100000) then
                                 begin
                                      CloseFile(newFile);
                                      nfName := 'Jogos\Jogos12\Jogos('+IntToStr(pToNfile)+').txt';
                                      AssignFile(newFile, nfName);
                                      Rewrite(newFile);
                                      Inc(pToNfile);
                                      count := 0
                                 end;
                                 break;
                            end;
                       end;
                       CloseFile(tFile);
                       Inc(aux);
                  end;
             end;
             CloseFile(myFile);
             Inc(pToMyFile);
        end;
        CloseFile(newFile);
        progressBar.Position := 100;
        progressBar.Visible := False;
        mmoLot.clear;
        mmoLot.Lines.Add(IntToStr(numGames)+' resultados gerados');
      Except
               showMessage('Erro ao gerar jogos!');
      end;
  (*for a := 1 to 20 then
      for b := a+1 to 30 then
          for c := b+1 to 40 then
              for d := c+1 to 50 then
                  for e := d+1 to 53 then
                      for f := e+1 to 54 then
                          for g := f+1 to 55 then
                          begin

                               for h := g+1 to 56 then
                                   for i := h+1 to 57 then
                                       for j := i+1 to 58 then
                                           for k := j+1 to 59 then
                                               for l := k+1 to 60 then
                                               begin

                                               end;
                          end;*)
end;

procedure TformGenerator.Configuraes1Click(Sender: TObject);
var
setup: TFormSetup;
begin
     try
       setup := TFormSetup.Create(Self);
       setup.ShowModal;
     except
       showmessage('\Erro! Por favor, tente fechar e abrir o programa.')
     end;
end;

end.
