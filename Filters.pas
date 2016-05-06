unit Filters;

interface

uses Classes, SysUtils, Math, Utils;

type
  TFilters = class
  private
         function checkEmptyLines(countL1, countL2, countL3,
                                  countL4, countL5, countL6: integer): boolean;
  protected
    countEmpLineMin: integer;
    countEmpLineMax: integer;
    sumMin: integer;
    sumMax: integer;
    numOdd: integer;
    numPair: integer;
  public
    Constructor Create;
    procedure setGlobalParams(countDezMin, countDezMax, smin, smax, odd, pair: integer);
    function orderNum(numbers: ArrayOfInteger): ArrayOfInteger;
    function isPair(number: integer): Boolean;
    function fSum(numbers: ArrayOfInteger): Boolean;
    function fNL(numbers: ArrayOfInteger): Boolean;
    function fNP(numbers: ArrayOfInteger): Boolean;
    function fNO(numbers: ArrayOfInteger): Boolean;
    function fSeq(numbers: ArrayOfInteger): Boolean;
    function fQQS(numbers: ArrayOfInteger): ArrayOfInteger;
  end;

implementation

Constructor TFilters.Create;
begin
     Inherited Create;
end;

procedure TFilters.setGlobalParams(countDezMin, countDezMax, smin, smax, odd, pair: integer);
begin
     countEmpLineMin := countDezMin;
     countEmpLineMax := countDezMax;
     sumMin := smin;
     sumMax := smax;
     numOdd := odd;
     numPair := pair;
end;

function TFilters.checkEmptyLines(countL1, countL2, countL3,
                                  countL4, countL5, countL6: integer): boolean;
var
count: integer;
begin
     count := 0;
     if countL1 >= 1 then
     begin
          Inc(count);
     end;
     if countL2 >= 1 then
     begin
          Inc(count);
     end;
     if countL3 >= 1 then
     begin
          Inc(count);
     end;
     if countL4 >= 1 then
     begin
          Inc(count);
     end;
     if countL5 >= 1 then
     begin
          Inc(count);
     end;
     if countL6 >= 1 then
     begin
          Inc(count);
     end;
     if ((count < countEmpLineMin) OR (count > countEmpLineMax)) then
     begin
          Result := True;
          Exit;
     end;
     Result := False;
end;

function TFilters.orderNum(numbers: ArrayOfInteger): ArrayOfInteger;
var
i, j, aux: integer;
begin
     for i := 0 to Length(numbers)-1 do
     begin
          for j := i+1 to Length(numbers)-1 do
          begin
               if numbers[i] > numbers[j] then
               begin
                 aux := numbers[i];
                 numbers[i] := numbers[j];
                 numbers[j] := aux;
               end;
          end;
     end;
     Result := numbers;
end;

function TFilters.isPair(number: integer): Boolean;
begin
  if((number mod 2) = 0) then
  begin
    Result := True;
    Exit;
  end;
  Result := False;
end;

{
Code Errors:
0 - Success
fSum - Error in sum,
fNLNPNO:
NL - Error in  number per lines,
NP - Error in number of pairs,
NO - Error in number of odd;
}

function TFilters.fSum(numbers: ArrayOfInteger): Boolean;
var
sum: LongInt;
begin
  sum := SumInt(numbers);
  if ((sum > sumMax) OR (sum < sumMin)) then
  begin
    Result := True;
    Exit;
  end;
  Result := False;
end;

function TFilters.fNP(numbers: ArrayOfInteger): Boolean;
var
i, countPair: integer;
begin
  countPair := 0;
  for i:= Low(numbers) to High(numbers) do
  begin
    if (isPair(numbers[i])) then
    begin
      countPair := countPair+1;
    end;
  end;
  if (countPair >= numPair) then
  begin
    Result := True;
    Exit;
  end;
  Result := False;
end;

function TFilters.fNO(numbers: ArrayOfInteger): Boolean;
var
i, countOdd: integer;
begin
  countOdd := 0;
  for i:= Low(numbers) to High(numbers) do
  begin
    if (NOT isPair(numbers[i])) then
    begin
      countOdd := countOdd+1;
    end;
  end;
  if (countOdd >= numOdd) then
  begin
    Result := True;
    Exit;
  end;
  Result := False;
end;


function TFilters.fSeq(numbers: ArrayOfInteger): Boolean;
var
i, j: integer;
begin
     numbers := orderNum(numbers);
     for i := 0 to Length(numbers)-3 do
     begin
         if ((numbers[i]+1) = numbers[i+1]) then
         begin
              if ((numbers[i+1]+1) = numbers[i+2]) then
              begin
                   Result := True;
                   Exit;
              end;
         end
     end;
     Result := False;
end;

function TFilters.fNL(numbers: ArrayOfInteger): Boolean;
var
i, countL1, countL2, countL3,
  countL4, countL5, countL6: integer;
begin
  countL1 := 0;
  countL2 := 0;
  countL3 := 0;
  countL4 := 0;
  countL5 := 0;
  countL6 := 0;
  for i:= Low(numbers) to High(numbers) do
  begin
    if ((numbers[i] >= 1) AND (numbers[i] <= 10)) then
    begin
      Inc(countL1);
    end;
    if ((numbers[i] >= 11) AND (numbers[i] <= 20)) then
    begin
      Inc(countL2);
    end;
    if ((numbers[i] >= 21) AND (numbers[i] <= 30)) then
    begin
      Inc(countL3);
    end;
    if ((numbers[i] >= 31) AND (numbers[i] <= 40)) then
    begin
      Inc(countL4);
    end;
    if ((numbers[i] >= 41) AND (numbers[i] <= 50)) then
    begin
      Inc(countL5);
    end;
    if ((numbers[i] >= 51) AND (numbers[i] <= 60)) then
    begin
      Inc(countL6);
    end;
  end;
  if checkEmptyLines(countL1, countL2, countL3,
                     countL4, countL5, countL6) then
  begin
       Result := True;
       Exit;
  end;
  Result := False;
end;
function TFilters.fQQS(numbers: ArrayOfInteger): ArrayOfInteger;
var
myFile: TextFile;
fileName: String;
count, i, aux, n1, n2, n3, n4, n5, n6: integer;
nums, aux1: ArrayOfInteger;
begin
  fileName := 'Jogos\Jogos(0).txt';
  AssignFile(myFile, fileName);
  SetLength(nums, 8);
  SetLength(aux1, 6);
  Reset(myFile);
  nums[0] := 0;
  count := 0;
  while True do
  begin
       while not Eof(myFile) do
       begin
            aux := 0;
            ReadLn(myFile, n1, n2, n3, n4, n5, n6);
            for i := 0 to Length(numbers)-1 do
            begin
                 if numbers[i] = n1 then
                 begin
                      Inc(aux);
                      aux1[0] := numbers[i];
                 end
                 else if numbers[i] = n2 then
                 begin
                      Inc(aux);
                      aux1[1] := numbers[i];
                 end
                 else if numbers[i] = n3 then
                 begin
                      Inc(aux);
                      aux1[2] := numbers[i];
                 end
                 else if numbers[i] = n4 then
                 begin
                      Inc(aux);
                      aux1[3] := numbers[i];
                 end
                 else if numbers[i] = n5 then
                 begin
                      Inc(aux);
                      aux1[4] := numbers[i];
                 end
                 else if numbers[i] = n6 then
                 begin
                      Inc(aux);
                      aux1[5] := numbers[i];
                 end;
            end;
            if aux > nums[0] then
            begin
                 nums[0] := aux;
                 nums[1] := count;
                 if aux1[0] <> 0 then nums[2] := aux1[0];
                 if aux1[1] <> 0 then nums[3] := aux1[1];
                 if aux1[2] <> 0 then nums[4] := aux1[2];
                 if aux1[3] <> 0 then nums[5] := aux1[3];
                 if aux1[4] <> 0 then nums[6] := aux1[4];
                 if aux1[5] <> 0 then nums[7] := aux1[5];
                 SetLength(aux1, 6);
                 if nums[0] = 6 then
                 begin
                      Result := nums;
                      Exit;
                 end;
            end;
       end;
       CloseFile(myFile);
       Inc(count);
       fileName := 'Jogos\Jogos('+IntToStr(count)+').txt';
       AssignFile(myFile, fileName);
       if (fileexists(fileName)) then
       begin Reset(myFile) end
       else begin break end;
  end;
  Result := nums;
  Finalize(nums);
  Finalize(aux1);
end;

end.
