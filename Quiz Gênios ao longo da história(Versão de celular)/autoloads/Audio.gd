extends Node2D

onready var player = $tocar_musica
onready var som_botao_player = $Som_botao
onready var som_errou = $Som_errou
onready var som_acertou = $Som_acertou
onready var som_temp = $temporizador


var Musica = load("res://recursos/Audios/Músicas/musica_principal.ogg")
var sombotao = load("res://recursos/Audios/Sons/Som_Botão.ogg")
var somtransicao = load("res://recursos/Audios/Sons/Começar.ogg")
var errou = load("res://recursos/Audios/Sons/Errou.ogg")
var acertou = load("res://recursos/Audios/Sons/Resposta_correta.ogg")
var temp = load("res://recursos/Audios/Sons/Temporizador.ogg")

#MÚSICA
func tocar_musica():
	
	player.stream = Musica
	if player.playing == false:
		player.play()
		player.volume_db = 0
	
func diminuir_volume():
	$Diminuir_volume_animacao.play("diminuir_volume")		
	
#---------------------------======---------------------------	

#SONS
func som_botao():
		som_botao_player.stream = sombotao
		som_botao_player.play()
		yield(som_botao_player, "finished")

func errou_som():
	som_errou.stream = errou
	som_errou.play()

func acertou_som():
	som_acertou.stream = acertou
	som_acertou.play()

func temporizador():	
		som_temp.stream = temp
		som_temp.play()
