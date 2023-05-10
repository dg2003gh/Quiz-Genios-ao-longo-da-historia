extends Node2D

@onready var tocarMusica = $tocar_musica
@onready var tempNode = $temporizador

var musicaBootplash = load("res://assets/Audios/Músicas/musica_do_bootsplash.ogg")
var Musica = load("res://assets/Audios/Músicas/musica_principal.ogg")
var somBotao = load("res://assets/Audios/Sons/Som_Botão.ogg")
var somTransicao = load("res://assets/Audios/Sons/Começar.ogg")
var acertou = load("res://assets/Audios/Sons/Resposta_correta.ogg")
var errou = load("res://assets/Audios/Sons/Resposta_errada.ogg")
var cenaAcertou = load("res://assets/Audios/Sons/cena_resposta_correta.ogg")
var cenaErrou = load("res://assets/Audios/Sons/cena_resposta_errada.ogg")
var cenaTempoEsgotado = load("res://assets/Audios/Sons/cena_tempo_esgotado.ogg")
var temp = load("res://assets/Audios/Sons/Temporizador.ogg")

func musica_bootsplash():
		$musica_bootsplash.stream = musicaBootplash
		$musica_bootsplash.play()
		
func tocar_musica():
	tocarMusica.stream = Musica
	if tocarMusica.playing == false:
		tocarMusica.play()
		tocarMusica.volume_db = 0
	
func diminuir_volume():
	$volume_animacao.play("diminuir_volume")		
func aumentar_volume():
	$volume_animacao.play("diminuir_volume")	
#---------------------------======---------------------------	

#SONS
func som_botao():
		$Som_botao.stream = somBotao
		$Som_botao.play()
		await $Som_botao.finished

func cena_resposta_errada_som():
	$Som_cena_errou.stream = cenaErrou
	$Som_cena_errou.play()
	
func errou_som():
	$Som_errou.stream = errou
	$Som_errou.play()

func cena_resposta_correta_som():
	$Som_cena_acertou.stream = cenaAcertou
	$Som_cena_acertou.play()
	
func acertou_som():
	$Som_acertou.stream = acertou
	$Som_acertou.play()

func cena_tempo_esgotado_som():
	$Som_cena_tempo_esgotado.stream = cenaTempoEsgotado
	$Som_cena_tempo_esgotado.play()
	
func temporizador():	
		tempNode.stream = temp
		tempNode.play()
