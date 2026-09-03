class_name MenuPrincipal
extends Node

signal nueva_partida_seleccionado()

@export var boton_nueva_partida: Button
@export var boton_salir: Button


func _ready() -> void:
	boton_nueva_partida.pressed.connect(_al_presionar_nueva_partida)
	boton_salir.pressed.connect(_al_presionar_salir)

#boton de partida nueva
func _al_presionar_nueva_partida():
	print("partida nueva")
	nueva_partida_seleccionado.emit() # hay que poner codigo para empezar el juego con la señal

# coso para salir
func _al_presionar_salir(): 
	print("boton salir")
	get_tree().quit()
