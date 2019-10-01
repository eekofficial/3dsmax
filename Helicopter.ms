delete $*
sph = sphere radius:40 pos:[0, 0, 0]
viewport.SetShowEdgeFaces true
convertToPoly sph
ep = edit_Poly()
addModifier sph ep
select sph

ep.ignoreBackfacing = on

subobjectlevel = 4
ep.SetSelection #Face #{}
ep.Select #Face #{52}
ep.SetOperation #ExtrudeFace
ep.ExtrudeFaceHeight = 70
ep.Commit()

subobjectlevel = 2
ep.SetSelection #Edge #{}
ep.Select #Edge #{245}
PolyToolsSelect.Ring()   
ep.SetOperation #ConnectEdges
ep.connectEdgeSlide = 76
ep.Commit()

subobjectlevel = 4
ep.SetSelection #Face #{}
ep.Select #Face #{133}
ep.SetOperation #ExtrudeFace
ep.ExtrudeFaceHeight = 20
ep.Commit()

subobjectlevel = 2
ep.SetSelection #Edge #{}
ep.Select #Edge #{263}
PolyToolsSelect.Ring()   
ep.SetOperation #ConnectEdges
ep.connectEdgeSlide = 50
ep.Commit()

subobjectlevel = 4
ep.SetSelection #Face #{}
ep.Select #Face #{144}
ep.SetOperation #ExtrudeFace
ep.ExtrudeFaceHeight = 18
ep.Commit()

subobjectlevel = 4
ep.SetSelection #Face #{}
ep.Select #Face #{142}
ep.SetOperation #ExtrudeFace
ep.ExtrudeFaceHeight = 18
ep.Commit()

subobjectlevel = 2
ep.SetSelection #Edge #{}
for i = 1 to 31 by 2 do ep.Select #Edge #{i} 
ep.SetOperation #ConnectEdges
ep.connectEdgeSlide = -41
ep.Commit()

subobjectlevel = 4
ep.SetSelection #Face #{}
ep.Select #Face #{1..16}
ep.SetOperation #ExtrudeFace
ep.ExtrudeFaceHeight = 17
ep.Commit()

bx = box length:80 width:7 height:5 pos:[100, 100, 0]
bx.pos = [0, 0, 56.401]
convertToPoly bx
ep1 = edit_Poly()
addModifier bx ep1
select bx

subobjectlevel = 2
ep1.SetSelection #Edge #{}
ep1.Select #Edge #{6}
PolyToolsSelect.Ring()   
ep1.SetOperation #ConnectEdges
ep1.connectEdgeSlide = -9
ep1.Commit()

subobjectlevel = 2
ep1.SetSelection #Edge #{}
ep1.Select #Edge #{8}
PolyToolsSelect.Ring()   
ep1.SetOperation #ConnectEdges
ep1.connectEdgeSlide = 70
ep1.Commit()

subobjectlevel = 4
ep1.SetSelection #Face #{}
ep1.Select #Face #{11}
ep1.SetOperation #ExtrudeFace
ep1.ExtrudeFaceHeight = 35
ep1.Commit()

subobjectlevel = 4
ep1.SetSelection #Face #{}
ep1.Select #Face #{9}
ep1.SetOperation #ExtrudeFace
ep1.ExtrudeFaceHeight = 35
ep1.Commit()

bx.Parent = sph

crcl = circle radius:120 pos:[0, 0, 0]

pc = path_Constraint()
pc.Path = crcl
pc.Follow = true
sph.Pos.Controller = pc
animationRange = interval 0f 100f



cl = cylinder radius:20 height:6 pos:[0,0,0]
bm = bomb strength:0.05 gravity:-0.1 detonation:35 minFragmentSize:1 maxFragmentSize:10 spin:15 pos:cl.Pos chaos:5; 

bx1 = box length:20 width:7 height:5 pos:sph.Pos

animate on
(	at time 0 (bx1.Pos = sph.Pos)
	at time 50 (bx1.Pos = cl.Pos; bindSpaceWarp cl bm)
	at time 100 (bx1.Pos.x = -200)
	)
playAnimation()












