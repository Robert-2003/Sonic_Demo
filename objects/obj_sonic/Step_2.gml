/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//checando se estou coledindo no chão/parede
var _col = instance_place(x + hspd,y,oSolo_Alto_Flor);

//Código da colisão
while (_col)
{
	if (hspd > 0)	
	{
		x = _col.bbox_left + (x - bbox_right);
	}
	
	if (hspd < 0)
	{
		x = _col.bbox_right + (x - bbox_left); 
	}
	
	hspd = 0;
}

x += hspd;

//agora para vertical
var _col = instance_place(x,y + vspd,oSolo_Alto_Flor);

if (_col)
{
	if (vspd > 0)
	{
		y = _col.bbox_top + (y - bbox_bottom);
	}
	if (vspd < 0)
	{
		y = _col.bbox_bottom + (y - bbox_top);
	}
}

y += vspd;
