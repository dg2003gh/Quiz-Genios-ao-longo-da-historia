extends Control

var musica_bus = AudioServer.get_bus_index("Musica")
var sons_bus = AudioServer.get_bus_index("Sons")

func _ready():
	animacoes()
	
#---------------------------======---------------------------
func animacoes():
	$animacoes.play("animacao_inicial")
#---------------------------======---------------------------
func _on_creditos_pressed():
	Transicao.mudar_cena("res://Cenas/Menus/Creditos.tscn")

func _on_voltar_pressed():
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")

func _on_musica_toggled(button_pressed):
	if button_pressed:
		AudioServer.set_bus_mute(musica_bus, false)
	else: 
		AudioServer.set_bus_mute(musica_bus, true)

func _on_sons_toggled(button_pressed):
	if button_pressed:
		AudioServer.set_bus_mute(sons_bus, false)
	else:
		AudioServer.set_bus_mute(sons_bus, true)
func _on_saiba_mais_pressed():
	Globais.executar_pdf()
