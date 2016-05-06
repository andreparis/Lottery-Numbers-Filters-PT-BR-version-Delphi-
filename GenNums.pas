unit GenNums;

interface
uses Classes, SysUtils;

type
    TGenNums = class
    private
    protected
    public
          Constructor Create;
          
          function genNums: TStringList;
    end;


implementation
uses Filters, Utils;

Constructor TGenNums.Create;
begin
     Inherited Create;
end;

function TGenNums.genNums: TStringList;
var
filter: TFilters;
i, j, k, l, m, n: integer;
num: ArrayOfInteger;
output: TStringList;
begin
     SetLength(num, 6);
     output := TStringList.Create;
     filter := TFilters.Create;
     for i := 1 to 55 do
         for j := i+1 to 56 do
              for k := j+1 to 57 do
                   for l := k+1 to 58 do
                        for m := l+1 to 59 do
                             for n := m+1 to 60 do
                             begin
                                num[0] := i;
                                num[1] := j;
                                num[2] := k;
                                num[3] := l;
                                num[4] := m;
                                num[5] := n;
                                if NOT filter.fSum(num) then
                                   if NOT filter.fNL(num) then
                                        if NOT filter.fSeq(num) then
                                           if NOT filter.fNP(num) then
                                               if NOT filter.fNO(num) then
                                                  output.Add(IntToStr(i)+' '+IntToStr(j)+' '+IntToStr(k)+
                                                         ' '+IntToStr(l)+' '+IntToStr(m)+' '+IntToStr(n));
                             end;
     Result := output;
     SetLength(num, 0);
     FreeAndNil(output);
end;

end.
