delete $*
sph1 = sphere radius:25 pos:[-40, 40, 0]
sph2 = sphere radius:25 pos:[0, 0, 0]
sph3 = sphere radius:25 pos:[40, -40, 0]
std1 = standard diffuse:red showInViewport:true
std2 = standard diffuse:yellow showInViewport:true
std3 = standard diffuse:green showInViewport:true
sph1.Material = std1
sph2.Material = std2
sph3.Material = std3
animationRange = interval 0f 100f
fn mkFltX expr ob = (
	fltX = float_expression()
	fltX.SetExpression expr
	fltX.Update()
	ob.SelfIllumAmount.Controller = fltX
)

fn mkPoint_scr expr ob = (
	point_scr = point3_script()
	point_scr.SetExpression expr
	point_scr.Update()
	ob.diffuse.controller = point_scr

)
mkFltX "if(F < 30,1, if (F < 70 ,0, 0))" std1
mkFltX "if(F < 30,0, if (F < 70 ,1, 0))" std2
mkFltX "if(F < 30,0, if (F < 70 ,0, 1))" std3
mkPoint_scr "if F<30 then [1, 0, 0] else if F<70 then [0, 0, 0] else [0, 0, 0]" std1
mkPoint_scr "if F<30 then [0, 0, 0] else if F<70 then [1, 1, 0] else [0, 0, 0]" std2
mkPoint_scr "if F<30 then [0, 0, 0] else if F<70 then [0, 0, 0] else [0, 1, 0]" std3

PlayAnimation()






