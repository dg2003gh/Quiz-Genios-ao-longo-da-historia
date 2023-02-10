extends Control


onready var musicabus := AudioServer.get_bus_index("Musica")
onready var sonsbus := AudioServer.get_bus_index("Sons")

onready var efeitos_txt := $"Botões/VBoxContainer/desativar_efeitos/txt_desativar_efeitos"
onready var animacao_botoes := $animacao_botoes



func _ready():
	animacoes()
	
#---------------------------======---------------------------
func animacoes():
		animacao_botoes.play("animacao_botoes")	

#---------------------------======---------------------------

func _on_Musica_pressed():
	Audio.som_botao()
	AudioServer.set_bus_mute(musicabus, not AudioServer.is_bus_mute(musicabus))
	
func _on_Sons_pressed():
	Audio.som_botao()
	AudioServer.set_bus_mute(sonsbus, not AudioServer.is_bus_mute(sonsbus))
#---------------------------======---------------------------
		
func _on_creditos_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Creditos.tscn")

func _on_voltar_ao_menu_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")

