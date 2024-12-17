/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if ev_collision {
	if (sprite_index = spr_sonic_jump)
	{
		instance_destroy(obj_enemy_crabmeat, true)
	}
	else room_restart()	
}