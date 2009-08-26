distanza = 8;
raggio = 2;
f = q/Sqrt[x^2 + d^2 - 2 d x Cos[t]] -  a q/(d Sqrt[x^2 + a^4/d^2 - 2 x a^2/d Cos[t]])
ff = Simplify[  f /. {x -> Sqrt[xx^2 + yy^2 + zz^2],     Cos[t] -> zz/Sqrt[xx^2 + yy^2 + zz^2]}]
ffv = {-D[ff, xx], -D[ff, yy], -D[ff, zz]};
fff = Simplify[ff /. {yy -> 0, q -> 1, a -> raggio, d -> distanza}]
fffv = Simplify[ffv /. {yy -> 0, q -> 1, a -> raggio, d -> distanza}]
fffv3 = Simplify[ffv /. {q -> 1, a -> raggio, d -> distanza}]
streamp = StreamPlot[Delete[fffv, 2], {xx, -12, 12}, {zz, -10, 14},   StreamStyle -> GrayLevel[.4], StreamPoints -> Fine,   RegionFunction -> Function[{x, y, z}, (x^2 + y^2 >= 4) ]];
contourp =   ContourPlot[fff, {xx, -12, 12}, {zz, -10, 14},    BoundaryStyle -> Red,   RegionFunction -> Function[{x, y, z}, x^2 + y^2 >= 4],   ClippingStyle -> Pink,   ColorFunction -> Function[x, Blend[{White, Black}, x]],   Contours -> 50,   PerformanceGoal -> "Quality"   ];
punto = Graphics[Point[{0, raggio^2/distanza}]];
finale = Show[{contourp, streamp,punto}];
Export["fisica2/sfera_neutra.pdf", finale];
Export["fisica2/sfera_neutra.eps", finale];

Exit[]
