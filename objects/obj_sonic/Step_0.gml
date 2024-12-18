/// @description Movimentação e etapa
// Você pode escrever seu código neste editor

#region CONTROLES
key_right = keyboard_check(vk_right) //DIREITA
key_left = keyboard_check(vk_left) //ESQUERDA
key_up = keyboard_check(vk_up) //CIMA
key_down = keyboard_check(vk_down) //BAIXO
key_jump = keyboard_check(vk_space)
#endregion

#region MOVIMETAÇÃO
var move  = key_right - key_left

hspd = move * spd

vspd = vspd + grv

//COLISÃO HORIZONTAL
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

//JUMP
if place_meeting(x,y+1,obj_wall) and key_jump
{
	vspd-=8
}
#endregion

#region FRAMES
//TROCA DE LADO
if (hspd != 0) image_xscale = sign(hspd)

//JUMP
if key_jump
{
	sprite_index = spr_sonic_jump
}

else if (hspd!= 0) and place_meeting(x,y+1,obj_wall)
{
	sprite_index = spr_sonic_walk
}

if hspd = 0
{
	if place_meeting(x,y+1,obj_wall)
	{
		sprite_index = spr_sonic_idle
	}
}

if hspd != 0
{
	if place_meeting(x,y+1,obj_wall)
	{
		sprite_index = spr_sonic_walk
	}
}
#endregion