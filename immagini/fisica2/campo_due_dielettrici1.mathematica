distanza = 2;
Print["This may take a while..."]
q1=(e1-e2) q/(e1+e2);
q2=2 e2 q/(e1+e2);
V[rho_,z_]:=If[z>=0,1/e1 (q/Sqrt[rho^2+(z-d)^2]+q1/Sqrt[rho^2+(z+d)^2]),q2/e2 1/Sqrt[rho^2+(z-d)^2]]
V[x_,y_,z_]:=V[Sqrt[x^2+y^2],z]
Campo[x_,y_,z_]:=-{D[V[a,b,c],a],D[V[a,b,c],b],D[V[a,b,c],c]}/.{a->x,b->y,c->z};
carica[x_,y_]:=(e1-1) Limit[Campo[x,y,z],z->0,Direction->-1][[3]]-(e2-1) Limit[Campo[x,y,z],z->0,Direction->1][[3]]
caricaP[x_] := carica[x,0]/.{q->1,e1->1,e2->5,d->distanza}
min=First[Minimize[{caricaP[x],-5<=x<=-1 || 1<=x<=5},x]];
max=First[Maximize[{caricaP[x],-5<=x<=-1 || 1<=x<=5},x]];
Print["Start first graph (1/3)"]
caricaPlot=ParametricPlot[{0,x},{x,-5,5},ColorFunction->Function[{x,y,u},Blend[{White,Black},Rescale[caricaP[u],{min,max}]]],ColorFunctionScaling->False,PlotStyle->Thick,AxesLabel->{"z","x"}];
xxx = {2,3,4};
VPlotP =Simplify[ V[x,y,z],Assumptions->z>0]/.{q->1,e1->1,e2->5,d->distanza,y->0};
VPlotM =Simplify[ V[x,y,z],Assumptions->z<0]/.{q->1,e1->1,e2->5,d->distanza,y->0};
CampoPlotP = Simplify[ Campo[x,y,z],Assumptions->z>0]/.{q->1,e1->1,e2->5,d->distanza,y->0};
CampoPlotM = Simplify[ Campo[x,y,z],Assumptions->z<0]/.{q->1,e1->1,e2->5,d->distanza,y->0};
CampoDPlotP = Simplify[ e1 Campo[x,y,z],Assumptions->z>0]/.{q->1,e1->1,e2->5,d->distanza,y->0};
CampoDPlotM = Simplify[ e2 Campo[x,y,z],Assumptions->z<0]/.{q->1,e1->1,e2->5,d->distanza,y->0};
CampiPlotXP=Table[ Simplify[ Campo[x,y,z][[1]],Assumptions->z>0]/.{q->1,e1->1,e2->5,d->distanza,y->0,x->xx},{xx,xxx}];
CampiPlotXM=Table[Simplify[ Campo[x,y,z][[1]],Assumptions->z<0]/.{q->1,e1->1,e2->5,d->distanza,y->0,x->xx},{xx,xxx}];

CampiPlotZP=Table[ Simplify[ Campo[x,y,z][[3]],Assumptions->z>0]/.{q->1,e1->1,e2->5,d->distanza,y->0,x->xx},{xx,xxx}];
CampiPlotZM=Table[Simplify[ Campo[x,y,z][[3]],Assumptions->z<0]/.{q->1,e1->1,e2->5,d->distanza,y->0,x->xx},{xx,xxx}];

CampoPlotZP1 = Simplify[ Campo[x,y,z][[3]],Assumptions->z>0]/.{q->1,e1->1,e2->5,d->distanza,y->0,x->1};
CampoPlotZM1 = Simplify[ Campo[x,y,z][[3]],Assumptions->z<0]/.{q->1,e1->1,e2->5,d->distanza,y->0,x->1};



  
VPlot = If[z>0,VPlotP,VPlotM];
CampoPlot = If[z>0,Reverse[Delete[CampoPlotP,2]],Reverse[Delete[CampoPlotM,2]]];
CampoDPlot= If[z>0,Reverse[Delete[CampoDPlotP,2]],Reverse[Delete[CampoDPlotM,2]]];
CampiXPlot = If[z>0,#[[1]],#[[2]]]&/@ Transpose[{CampiPlotXP,CampiPlotXM}];
CampiZPlot = If[z>0,#[[1]],#[[2]]]&/@ Transpose[{CampiPlotZP,CampiPlotZM}];


Print ["Start first graph (2/3)"]
contourP=ContourPlot[VPlot,{z,-5,5},{x,-5,5},Contours->10,ColorFunction->"Temperature",PlotPoints->50,BoundaryStyle->Red,RegionFunction->Function[{x,z},(x-2)^2+z^2>2],AxesLabel->{"z","x"}];


Print ["Start first graph (3/3)"]
streamP=StreamPlot[CampoPlot,{z,-5,5},{x,-5,5},StreamStyle->GrayLevel[.2],StreamPoints->Fine,RegionFunction->Function[{x,z},(x-2)^2+z^2>2],AxesLabel->{"z","x"}];

Print ["Plotting first graph"]
finale=Show[{contourP,streamP,caricaPlot}];

Print ["Saving first graph"]
Export["campo_due_dielettrici1.pdf",finale];
Export["campo_due_dielettrici1.eps",finale];



plotrange = {-0.07,0.07};
Print["Start 2nd plot 2D/3D"]
plotEz3D=Plot3D[CampoPlot[[2]],{z,-5,5},{x,-5,5},AxesLabel->{"z","x"},PerformanceGoal->"Quality",PlotPoints->100,MaxRecursion->3,PlotRange->plotrange,ColorFunction->"Temperature",BoundaryStyle->Black,MeshFunctions->Table[#2&,{Length[xxx]}]~Join~{#3&}~Join~{#1&},Mesh->({#}&/@xxx)~Join~{6}~Join~{{0.}},MeshStyle->({Dashed,#}&/@(ColorData[1,"ColorList"][[1;;Length[xxx]]]))~Join~{Thick}~Join~{{Thick,Red}}];
plotEz2D=DensityPlot[CampoPlot[[2]],{z,-5,5},{x,-5,5},AxesLabel->{"z","x"},PerformanceGoal->"Quality",PlotPoints->100,MaxRecursion->3,PlotRange->plotrange,ColorFunction->"Temperature",BoundaryStyle->Black,MeshFunctions->Table[#2&,{Length[xxx]}]~Join~{#1&},Mesh->({#}&/@xxx)~Join~{{0.}},MeshStyle->({Dashed,#}&/@(ColorData[1,"ColorList"][[1;;Length[xxx]]]))~Join~{{Thick,Red}}];
Print["Start 3th plot 2D/3D"]
plotEx3D=Plot3D[CampoPlot[[1]],{z,-5,5},{x,-5,5},AxesLabel->{"z","x"},PerformanceGoal->"Quality",PlotPoints->100,MaxRecursion->3,PlotRange->plotrange,ColorFunction->"Temperature",BoundaryStyle->Black,MeshFunctions->Table[#2&,{Length[xxx]}]~Join~{#3&}~Join~{#1&},Mesh->({#}&/@xxx)~Join~{6}~Join~{{0.}},MeshStyle->({Dashed,#}&/@(ColorData[1,"ColorList"][[1;;Length[xxx]]]))~Join~{Thick}~Join~{{Thick,Red}}];
plotEx2D=DensityPlot[CampoPlot[[1]],{z,-5,5},{x,-5,5},AxesLabel->{"z","x"},PerformanceGoal->"Quality",PlotPoints->100,MaxRecursion->3,PlotRange->plotrange,ColorFunction->"Temperature",BoundaryStyle->Black,MeshFunctions->Table[#2&,{Length[xxx]}]~Join~{#1&},Mesh->({#}&/@xxx)~Join~{{0.}},MeshStyle->({Dashed,#}&/@(ColorData[1,"ColorList"][[1;;Length[xxx]]]))~Join~{{Thick,Red}}];


Print["Plotting 2nd, 3th plot"]  
finale2=GraphicsRow[{plotEz3D,plotEz2D},ImageSize->1600];
finale3=GraphicsRow[{plotEx3D,plotEx2D},ImageSize->1600];


Print["Saving 2nd, 3th plot (png)"]
Export["campo_due_dielettrici2.png",finale2];
Export["campo_due_dielettrici3.png",finale3];


Print["Plotting final 4th, 5th plot"]  
finale4 = Plot[CampiXPlot, {z, -5, 5}, PlotRange -> plotrange, AxesLabel -> {"z", ""}, Ticks -> {Automatic, None}];
finale5 =   Plot[CampiZPlot, {z, -5, 5}, PlotRange -> plotrange, AxesLabel -> {"z", ""}, Ticks -> {Automatic, None}];

Print["Saving final"]  
Export["campo_due_dielettrici4.pdf",finale4];
Export["campo_due_dielettrici4.eps",finale4];
Export["campo_due_dielettrici5.pdf",finale5];
Export["campo_due_dielettrici5.eps",finale5];

Exit[]
