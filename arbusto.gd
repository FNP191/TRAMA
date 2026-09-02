extends Node2D

@export var sprite_2d: Sprite2D

# Recibe una señal cuando un jugador entra.
func _on_area_2d_body_entered(body: Node2D) -> void:
	# Si lo que lo toca es un Jugador lo mata
	if body is Jugador:
		# Llama a la funcion daño, que la deberia de tener el Jugador :)
		body.daño()
	
