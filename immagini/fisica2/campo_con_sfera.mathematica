campo = 1;
f = -EE (r - a^3/r^2) Cos[t]
ff = Simplify[f /. {r -> Sqrt[xx^2 + yy^2 + zz^2],Cos[t] -> zz/Sqrt[xx^2 +yy^2 + zz^2]}]
ffv = {-D[ff, xx], -D[ff, yy], -D[ff, zz]};
fff = Simplify[ff /. {a -> 1, EE -> campo, yy -> 0}]
fffv = Simplify[ffv /. {a -> 1, EE -> campo, yy -> 0}]
fffv3 = Simplify[ffv /. {a -> 1, EE -> campo}]
streamp =   StreamPlot[Reverse[Delete[fffv, 2]], {zz, -4, 4}, {xx, -3, 3},   StreamStyle -> GrayLevel[.2], StreamPoints -> Fine,   RegionFunction -> Function[{x, y, z}, (x^2 + y^2 >= 1) ],    AspectRatio -> Automatic];
contourp =   ContourPlot[fff, {zz, -4, 4}, {xx, -3, 3}, BoundaryStyle -> Red, RegionFunction -> Function[{x, y, z}, x^2 + y^2 >= 1], ClippingStyle -> Pink, ColorFunction -> "Temperature", Contours -> 80, PerformanceGoal -> "Quality", AspectRatio -> Automatic ];
carica = ParametricPlot[{Cos[u], Sin[u]}, {u, 0, 2 Pi}, ColorFunction -> "Temperature", PlotStyle -> Thick, PerformanceGoal -> "Quality" ];
finale = Show[{contourp, streamp,carica}];
Export["fisica2/campo_con_sfera.pdf", finale];
Export["fisica2/campo_con_sfera.eps", finale];
Exit[];
