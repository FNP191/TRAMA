class_name Arbusto
extends Node2D

@export var espinas: PackedScene
@export var area_2d: Area2D
@export var sprite_2d: Sprite2D

func disparar():
	var target:Jugador = _find_closest_enemy()
	
	if not target:
		return
		
	var instancia_proyectil :Espinas = espinas.instantiate()
	
	var nodo_padre = get_tree().current_scene
	
	nodo_padre.add_child(instancia_proyectil)
	
	instancia_proyectil.global_position = %SpawnPoint.global_position
	
	
	instancia_proyectil.rotation = self.rotation
	print("Disparando espina en: ", instancia_proyectil.global_position)
	
func _find_closest_enemy() -> Jugador:
	var bodies :Array = area_2d.get_overlapping_bodies()
	var distancia_mas_corta: float = INF
	var target:Jugador = null
	
	for body in bodies:
		if body is Jugador:
			var dist = global_position.distance_to(body.global_position)
			if dist < distancia_mas_corta:
				distancia_mas_corta = dist
				target = body
	
	return target
	

func _on_timer_timeout() -> void:
	disparar()
	%Timer.start()
