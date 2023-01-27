extends Control

onready var musicabus := AudioServer.get_bus_index("Musica")
onready var sonsbus := AudioServer.get_bus_index("Sons")

onready var efeitos_txt := $"Botões/VBoxContainer/desativar_efeitos/txt_desativar_efeitos"
onready var animacao_botoes := $animacao_botoes



func _ready():
	animacoes()
	verificar()
	
#---------------------------======---------------------------
func animacoes():
		animacao_botoes.play("animacao_botoes")	

#---------------------------======---------------------------
# EU SEI... ISSO QUE VEM A SEGUIR TÁ FEIO :(
func verificar():
	if Globais.musica == 1:
		$BordaAudio/Musica2.show()
		$BordaAudio/Musica.hide()
	else:
		$BordaAudio/Musica.show()
		$BordaAudio/Musica2.hide()
	if Globais.sons == 1:
		$BordaAudio/Sons2.show()
		$BordaAudio/Sons.hide()	
	else:
		$BordaAudio/Sons.show()
		$BordaAudio/Sons2.hide()

func _on_Musica_pressed():
	Audio.som_botao()
	AudioServer.set_bus_mute(musicabus, not AudioServer.is_bus_mute(musicabus))
	if Globais.musica == 0:
		Globais.musica = 1
	else:
		Globais.musica = 0
	
func _on_Sons_pressed():
	Audio.som_botao()
	AudioServer.set_bus_mute(sonsbus, not AudioServer.is_bus_mute(sonsbus))
	if Globais.sons == 0:	
		Globais.sons = 1
	else:
		Globais.sons = 0	
#---------------------------======---------------------------
		
func _on_creditos_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Creditos.tscn")

func _on_voltar_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")

