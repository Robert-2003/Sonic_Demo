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

if (hspd != 0) image_xscale = sign(hspd)

//COLISÃO HORIZONTAL
if place_meeting(x+hspd, y, oSolo_Alto_Flor)
{
	while(!place_meeting(x+sign(hspd), y, oSolo_Alto_Flor))
	{
		x = x + sign(hspd)	
	}
	
	hspd = 0
}

x = x + hspd

//COLISÃO VERTICAL
if place_meeting(x, y+vspd, oSolo_Alto_Flor)
{
	while(!place_meeting(x, y+sign(vspd), oSolo_Alto_Flor))
	{
		y = y + sign(vspd)	
	}
	
	vspd = 0
}

y = y + vspd

//PULO
if place_meeting(x,y+1,oSolo_Alto_Flor) and key_jump
{
	vspd -= 8
}
#endregion

