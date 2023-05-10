extends Control


func _ready():
	$Animacao_txt.play("txt")
	
func _on_Sair_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/Configs.tscn")
