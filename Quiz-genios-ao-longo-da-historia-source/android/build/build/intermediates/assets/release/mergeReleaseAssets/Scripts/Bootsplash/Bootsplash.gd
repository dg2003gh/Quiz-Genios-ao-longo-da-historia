extends Control

@onready var animacao: Node = $bootsplash_animacao 
@onready var texto_godot: Node = $Fundo/Godot/texto_godot

var musica_bootsplash: String = "res://assets/Audios/Músicas/musica_do_bootsplash.ogg"
var musica_principal: String = "res://assets/Audios/Músicas/musica_principal.ogg"

func _ready():
	trocarBBcode()	
	Audio.tocar_musica(musica_bootsplash)
	animacao.play("bootsplash")
	await animacao.animation_finished
	Audio.tocar_musica(musica_principal)
	if Globais.aceito: 
		get_tree().change_scene_to_file("res://Cenas/Menus/Menu.tscn")
	else:
		get_tree().change_scene_to_file("res://Cenas/Menus/politicas.tscn")
	

func trocarBBcode():
	var bbcodes: Array[String] = ["wave", "rainbow", "tornado", "shake",
					"color=#ec0808","color=#f7f10f", "color=#00b8f3","color=#38bc38",
					"color=#e58013","color=#d12a7f","color=#58abb7","color=#57b6a3",
					"color=#477389","color=#4d2ad1"]
	
	texto_godot.bbcode_enabled = true
	for bbcode in bbcodes: 
		randomize()
		bbcodes.shuffle()
		texto_godot.set_text("[{bbcode}]Feito na Godot Game Engine".format({"bbcode": bbcode}))
