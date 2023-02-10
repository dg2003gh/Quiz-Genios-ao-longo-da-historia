extends Control

func _ready():
	Audio.musica_bootsplash()
	$bootsplash_animacao.play("bootsplash")
	yield($bootsplash_animacao, "animation_finished")
	if get_tree().change_scene("res://Cenas/Menus/Menu.tscn") != OK:
		print("ERRO ao mudar para o menu principal pela tela de boot!!!")
	Audio.tocar_musica()
