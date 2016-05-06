unit Error;

interface
uses Classes, SysUtils;

type
    Errors = class
    private
    protected
    public
	  Constructor Create;
          
	  function inputData(code: integer; const str: string): string;
    end;

implementation

Constructor Errors.Create;
begin
     Inherited Create;
end;

function Errors.inputData(code: integer; const str: string): string;
var
nstr: string;
begin
     FillChar(nstr, SizeOf(nstr), #0);
     {Enter info errors:}
     if (code > 400) then
     begin
       if (code = 401) then
       begin
             nstr := 'ERROR 401: Você tentou inserir um valor invalido';
       end
       else if (code = 402) then
       begin
          nstr := 'ERROR 402: Você tentou inserir um valor invalido' ;
       end
       else if (code = 403) then
       begin
          nstr := 'ERROR 403: Você tentou inserir o mesmo valor mais de uma vez!';
       end
       else if (code = 404) then
       begin
          nstr := 'ERROR 404: Você tentou inserir mais do que 15 valores!'
       end
       else if (code = 405) then
       begin
          nstr := 'ERROR 405: Você tentou inserir menos do que 6 valores!'
       end;
     end
     else
     begin
         nstr := 'none';
	//nstr := 'O jogo '+str+' está de acordo com os filtros!';
     end;
     Result := nstr;
end;
end.
