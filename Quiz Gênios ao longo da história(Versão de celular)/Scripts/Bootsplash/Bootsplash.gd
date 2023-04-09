extends Control

func _ready():
	trocarBBcode()	
	Audio.musica_bootsplash()
	$bootsplash_animacao.play("bootsplash")
	await $bootsplash_animacao.animation_finished
	if get_tree().change_scene_to_file("res://Cenas/Menus/Menu.tscn") != OK:
		print("ERRO ao mudar para o menu principal pela tela de boot!!!")
	Audio.tocar_musica()

func trocarBBcode():
	var texto = $Fundo/Godot/texto_godot
	var bbcodes = ["wave", "rainbow", "tornado", "shake",
					"color=#ec0808","color=#f7f10f", "color=#00b8f3","color=#38bc38",
					"color=#e58013","color=#d12a7f","color=#58abb7","color=#57b6a3",
					"color=#477389","color=#4d2ad1"]
	
	texto.bbcode_enabled = true
	for bbcode in bbcodes: 
		randomize()
		bbcodes.shuffle()
		texto.set_text("[{bbcode}]Feito na Godot Game Engine".format({"bbcode": bbcode}))
