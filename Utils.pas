unit Utils;

interface
uses Classes, SysUtils;

type
    ArrayOfInteger = array of integer;
    TUtils = class
    private
    protected
    public
          Constructor Create;

          function isNumeric(p:pAnsiChar):boolean;
          function repeatNum(list: ArrayOfInteger): boolean;
          function isLastNum(str: string; pos: integer; plist: integer): boolean;
          function strInput(const str: String): ArrayOfInteger;
          function findNextStr(str: string; pos: integer): integer;
    end;

implementation

const
 NULL    = #0;            //Blank char
 TNumbs  = ['0'..'9'];    //Set of numerical chars

Constructor TUtils.Create;
begin
     Inherited Create;
end;


function TUtils.findNextStr(str: string; pos: integer): integer;
var
i: integer;
begin
     i := pos;
     while ((str[i] = ' ') OR (i = Length(str)-1)) do
     begin
          Inc(i);
     end;
     Result := i; 
end;

function TUtils.isLastNum(str: string; pos: integer; plist: integer): boolean;
var
i: integer;
begin
     for  i := pos to Length(str)-1 do
     begin
          if (str[i] <> ' ') then
          begin
               Result := False;
               Exit;
          end;
     end;
     Result := True;
     Exit;
end;

function TUtils.repeatNum(list: ArrayOfInteger): Boolean;
var
i, j, aux: integer;
begin
     aux := 0;
     for i := 0 to Length(list)-1 do
     begin
          for j := i to Length(list)-1 do
          begin
               if ((i <> j) AND (list[i] <> 0)) then
               begin
                    if (list[i] = list[j]) then
                    begin
                         aux := 1;
                         break;
                    end;       
               end;
               
          end;
          if aux = 1 then
          begin
               Result := True;
               Exit;
          end;
     end;
     Result := False;
end;

function TUtils.isNumeric(p:pAnsiChar):boolean;
begin
     result:=false;
     if p=nil then 
        exit;        //Check input
     if p^='-' then 
        inc(p);                   //Ignore minus
     if p^=NULL then 
        exit;                    //Deny empty input
     while p^<>NULL do                        //Loop chars
           if p^ in TNumbs then 
                inc(p) 
           else 
                exit;  //Check if numerical char
     result:=true
end;

function TUtils.strInput(const str: String): ArrayOfInteger;
{
Errors codes:
401: Error values less than 1 or biggest than 60
}
var
list: ArrayOfInteger;
mystr: string;
i, count, plist, num: integer;
begin
     FillChar(mystr, SizeOf(mystr), #0);
     plist := 0;
     SetLength(list, 15);
     for i := 1 to Length(str) do
     begin
         if ((str[i] <> ' ') AND ( (str[i-1] = ' ') OR (i = 1))) then
         begin
            if (plist > 15) then
            begin
                 SetLength(list, 1);
                 list[0] :=404;
                 break;
            end;
            mystr := '';
            count := i;
            while ((str[count] <> ' ') AND (count <= Length(str))) do
            begin
              mystr := mystr + str[count];
              Inc(count);
            end;
            if (isNumeric(pAnsiChar(mystr)) = False) then
            begin
                 SetLength(list, 1);
                 list[0] :=402;
                 break;
            end;
            num := StrToInt(mystr);
            if ((num >= 61) OR (num <= 0)) then
            begin
              SetLength(list, 1);
              list[0] :=401;
              break;
            end;
            list[plist] := num;
            Inc(plist);
          end;
     end;
     if (list[0] <= 400)then
     begin
          if ((i >= Length(list)-1) AND (plist <= 5)) then
          begin
               SetLength(list, 1);
               list[0] :=405;
          end
          else if repeatNum(list) then
          begin
               SetLength(list, 1);
               list[0] :=403;
          end;
     end;
     Result := list;
     Finalize(list);
end;
end.

