extends Control

@onready var animacoes_player: Node = $Animacao

func _ready():
	animacoes_player.play("animacao_inicial")
	
func _on_Sair_pressed():
	Transicao.mudar_cena("res://Cenas/Menus/Configs.tscn")
