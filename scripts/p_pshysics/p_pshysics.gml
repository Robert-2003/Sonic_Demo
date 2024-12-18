// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function Script1(){
#region LIMITS
if hspd > hspdl {
	hspd = hspdl
}

if hspd < -hspdl {
	hspd = -hspdl
}

if vspd > vspdl {
	vspd = vspdl
}

if vspd < -vspdl {
	vspd = vspdl
}
#endregion

#region HORIZONTAL(X) MOVIMENT
if hspd > 0
{
	for (i=0;i<hspd and !collision_circle(x+16,y,3,obj_wall,true,true);i+=1)
	{
		x+=1
	}
}

if hspd < 0
{
	for (i=0;i>hspd and !collision_circle(x-16,y,3,obj_wall,true,true);i+=1)
	{
		x-=1
	}
}
#endregion

#region VERTICAL(Y) MOVIMENT
if vspd > 0
{
	for (i=0;i<vspd and !collision_circle(x,y+16,3,obj_wall,true,true);i+=1)
	{
		y+=1
	}
}

if vspd < 0
{
	for (i=0;i>vspd and !collision_circle(x,y-16,3,obj_wall,true,true);i+=1)
	{
		y-=1
	}
}
#endregion

#region WALL COLLISION
while (collision_circle(x+16,y,3,obj_wall,true,true))
{
		x-=1
}

while (collision_circle(x-16,y,3,obj_wall,true,true))
{
		x+=1
}

//lanind
if vspd > 0 and !ground and collision_circle(x,y+16,4,obj_wall,true,true)
{
	vspd = 0
	ground = true
}

//leave ground
if !collision_circle(x,y+16,4,obj_wall,true,true) and ground
{
	ground = false
}
#endregion

#region GRAVITY
if !ground
{
	vspd+=grv
	}
#endregion
}