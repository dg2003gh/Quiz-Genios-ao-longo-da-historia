extends Node2D

@onready var player_musica: Node = $player_musica
@onready var player_sons: Node = $player_sons
@onready var player_botao: Node = $player_botao
@onready var player_temporizador: Node = $player_temporizador
@onready var animacao_audio: Node = $animacao_audio

var musica_bus = AudioServer.get_bus_index("Musica")
var sons_bus = AudioServer.get_bus_index("Sons")

var som_botao: String 

func _ready():
	mutar_audios()

func tocar_musica(musica: String):
	player_musica.stream = load(musica)
	player_musica.playing = !player_musica.playing
	
func tocar_sons(som: String):
	player_sons.stream = load(som)
	player_sons.playing = !player_sons.playing
	
func _tocar_som_botoes(isToggle: bool = false):
	if  isToggle:
		som_botao = "res://assets/Audios/Sons/som_botão_toggle.ogg"	
	else:
		som_botao = "res://assets/Audios/Sons/Som_Botão.ogg"
	player_botao.stream = load(som_botao)
	player_botao.playing = !player_botao.playing

func animar_audio():
	if player_musica.volume_db >= 0:
		animacao_audio.play("animacao_audio")
		await animacao_audio.animation_finished
		player_musica.stop()
	elif  player_musica.volume_db < 0:
		player_musica.playing = !player_musica.playing
		animacao_audio.play_backwards("animacao_audio")
		
func mutar_audios():
	AudioServer.set_bus_mute(musica_bus, !Globais.musica)
	AudioServer.set_bus_mute(sons_bus, !Globais.sons)		

	
