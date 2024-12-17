/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var move  = hspd

hspd = move * spd

vspd = vspd + grv

if (hspd != 0) image_xscale = sign(hspd)

if place_meeting(x+hspd, y, obj_wall)
{
	while(!place_meeting(x+sign(hspd), y, obj_wall))
	{
		x = x + sign(hspd)	
	}
	
	hspd = 0
}

x = x + hspd

//COLISÃO VERTICAL
if place_meeting(x, y+vspd, obj_wall)
{
	while(!place_meeting(x, y+sign(vspd), obj_wall))
	{
		y = y + sign(vspd)	
	}
	
	vspd = 0
}

y = y + vspd