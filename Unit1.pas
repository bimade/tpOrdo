unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  vector = array [1..50] of integer;
  matrice = array [1..50,1..50] of integer;

  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button2: TButton;
    StringGrid2: TStringGrid;
    Edit3: TEdit;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;
  OrdoMatrice : matrice;
  DureePi: vector;
  BorneSup : integer;
  maxp:integer;
  NombrTaches,NombreMachines,sommePiM :integer;



implementation

{$R *.dfm}


//************************** le max de trois valeur ***********************///
function max(val1:integer;val2:integer;val3:integer):integer;
var l:integer;
begin
      L:=val1;
     if l<val2 then l:=val2;
     if l<val3 then l:=val3;
     max:=l;
end;
//***************************************************************************//

//***************************** le max des Hj *****************************//
function maxH(val:matrice):integer;
var i,g:integer;
begin
    g:=0  ;
      for I := 1 to NombreMachines do
      if g<val[i,NombrTaches+1] then
        g:= val[i,NombrTaches+1];

    maxH:=g;
end;
//***************************************************************************//

//**************** LPT récupérer la tache LPT *********************///
procedure LPT(var vec:vector;var t:integer);
var
  i,tache: Integer;
begin
  tache:=1;
  for i := 1 to NombrTaches do
  if vec[tache]<vec[i] then tache:=i;

  t:=tache;
end;


//********************** la machine est prete ***************************//
function MachinePrete(LaMatrice:matrice):integer;
var
  I,google: Integer;
begin
  google:=1;
  for I := 1 to NombreMachines  do
     if  LaMatrice[google,NombrTaches+1]>LaMatrice[i,NombrTaches+1] then
        google:=i;

    MachinePrete:=google;
end;

//*************************************************************************//

//*********************** insertion dans la matriche **********************//

Procedure InstInMat(var LaMatrice:matrice;M,toto:integer;dur:integer);
var
  I: Integer;
begin
 for I := 1 to NombrTaches do //on cherche de la place dans le parking
     if LaMatrice[M,i]=0 then // s'il y a : alors !! je sais pas
      begin
      LaMatrice[M,i]:=toto; // créno magnifique !!
      LaMatrice[M,NombrTaches+1]:=LaMatrice[M,NombrTaches+1]+dur;// on ajoute la durée
      Break;// un break a l'ancienne
      end;
end;

//******************************** copier une matrice ************************//
procedure Copier(k:matrice;var e:matrice);
var
  I: Integer;
  j: Integer;
begin
    for I := 1 to NombrTaches do
        for j := 1 to NombrTaches+1 do
              e[i,j]:=k[i,j];
end;




//********************************** big char****************************************///
procedure evaluer(mat:matrice;T:vector;var BS:integer;var tache:integer;var Reali:boolean;var Mat2:matrice);
var laTache,machine,SQ:integer;
   PContinue:boolean;

begin

  BS:= max(MaxH(Mat),maxp,sommePiM);
  PContinue:=True;
    while PContinue do // feu vert
        begin
        LPT(T,laTache);// la tache la plus longue
            if t[Latache]<>0 then  // tu grandiras un jour et tu comprendras !!
              begin
                machine:=MachinePrete(mat); // la machine ?

                SQ:=Mat[Machine,NombrTaches+1]+T[laTache];// en plus !!

                    if SQ<=BS then // dans la vie y a des limites a respecter
                       begin
                         InstInMat(Mat,Machine,LaTache,T[laTache]);
                         T[laTache]:=0; // c'est bon !!
                       end
                       else
                            begin
                               Reali:=false; // y a un hors la loi
                               tache:=laTache; // le voila
                               PContinue:=false; // fin de l'histoire
                            end;


              end
                  else  // si tous les Pi=0 qui veut dire "plus de travail"
                      begin
                        reali:=true;
                        Copier(mat,mat2);
                         PContinue:=false;
                      end;
      end;
end;

//******************************** le Se **************************************//
procedure SE(M:matrice; TT: vector);
var IDtache,B: integer ;
  bal:boolean;
  I: Integer;
  trvM:matrice;
  temps:integer;
  lasolution:matrice;
begin
evaluer(M,TT,B,IDtache,bal,LaSolution);
      if B<BorneSup then
         begin
           if bal then  // si réalisable
              begin
                BorneSup:=b; // l'optimum local
                Copier(Lasolution,OrdoMatrice);
              end
              else
                  begin
                    temps:=TT[IDtache];
                    TT[IDtache]:=0; // tc/idtache
                    for I := 1 to NombreMachines do
                        begin
                        copier(M,trvM);
                        InstInMat(trvM,i,IDtache,temps);
                        SE(trvM,TT);
                        end;
                  end;
         end;

end;



procedure TForm1.Button1Click(Sender: TObject);
var i,j:integer;
TheMatrix:matrice;
begin
//********** ordo matrice a 0**********///

  for I :=  1 to NombreMachines  do
     for j := 1 to NombrTaches +1 do OrdoMatrice[i,j]:=0;


 ///************ vecteur des Pi **************************///
for i := 1 to NombrTaches do DureePi[i]:=StrToInt(StringGrid1.Cells[i,1]);


///************** calculer du max des Pi et la somme des Pi/m**************
maxp:=dureePi[1];
sommePiM:=DureePi[1];
for i := 2 to NombrTaches do
begin
  if maxp<DureePi[i] then maxp:=DureePi[i];
  sommePiM:=sommePiM+DureePi[i];
end;
BorneSup:=sommePiM; // y=+infini
if    sommePiM mod NombreMachines <> 0 then
sommePiM:= (sommePiM div NombreMachines)+1
else
   sommePiM:=sommePiM div NombreMachines;



//***************** lancer l'ordo ***************//
SE(OrdoMatrice,DureePi);

//*************** afficher les résultats **************//

StringGrid2.ColCount:=NombrTaches+1;
StringGrid2.RowCount:=NombreMachines+1;
for I := 1 to NombrTaches do
    for j := 1 to NombreMachines do
      begin
        StringGrid2.Cells[i,j]:=IntToStr(OrdoMatrice[j,i]);
      end;
   Edit3.Text:=IntToStr(BorneSup);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
NombrTaches:=strtoint(Edit1.text);
NombreMachines:=strtoint(Edit2.Text);
StringGrid1.colCount:=NombrTaches+1;
StringGrid1.rowCount:=2;

end;

end.



