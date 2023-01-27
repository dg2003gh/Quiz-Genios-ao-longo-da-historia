extends Control

onready var animacao := $"Botoes/Animacao_botoes"
onready var modo_txt := $"Caixa de diálogo/modo_atual"
onready var quadro_txt := $"Caixa de diálogo/texto_quadro"
onready var foto_caixa_de_dialogo = $"Caixa de diálogo/Gênio"


var Genio1 = preload("res://recursos/Imagens/Albert Einstein(Caixa de Diálogo).png")
var Genio2 = preload("res://recursos/Imagens/Alan Turing(Caixa de Diálogo).png") 
var Genio3 = preload("res://recursos/Imagens/Santos Dumont(Caixa de Diálogo).png")
var Genio4 = preload("res://recursos/Imagens/Charles_Darwin(Caixa de Diálogo).png") 
var Genio5 = preload("res://recursos/Imagens/Galileu_Galilei(Caixa de Diálogo).png") 
var Genio6 = preload("res://recursos/Imagens/Graham bell(Caixa de Diálogo).png") 
var Genio7 = preload("res://recursos/Imagens/Issac_Newton(Caixa de Diálogo).png") 
var Genio8 = preload("res://recursos/Imagens/Nikola Tesla(Caixa de Diálogo).png") 
var Genio9 = preload("res://recursos/Imagens/Leonardo_Da_Vinci(Caixa de Diálogo).png") 
var Genio10 = preload("res://recursos/Imagens/Thomas Edison(Caixa de Diálogo).png") 

func _ready() -> void:
		verificar_modo_txt()
		alterar_foto()
		animacoes()
		
#---------------------------======---------------------------
func alterar_foto():
	var Genios_fotos = [Genio1, Genio2, Genio3, Genio4, Genio5, Genio6, Genio7, Genio8, Genio9, Genio10]
	for foto in Genios_fotos:
		randomize()
		Genios_fotos.shuffle()
		foto_caixa_de_dialogo.texture = foto

func verificar_modo_txt():
	if Globais.modo_de_jogo == 4:
		modo_txt.set_text(str("Modo atual: Pode relaxar!"))
	elif Globais.modo_de_jogo == 3:
		modo_txt.set_text(str("Modo atual: Bate e pronto!"))		
	elif Globais.modo_de_jogo == 2:
		modo_txt.set_text(str("Modo atual: No final veremos!"))
	else:
		modo_txt.set_text(str("Modo atual: Não Erre!"))

func animacoes():
		animacao.play("Animacao_texto_botoes")	
			
# MODOS DE JOGO.
		
func _on_Modo_1_pressed() -> void:
	Audio.som_botao()
	quadro_txt.set_text("Este modo é bem simples. Se você errar uma pergunta, perde! Então arrase em todas!")			
	Globais.modo_de_jogo = 1
	verificar_modo_txt()
#---------------------------======---------------------------
	
func _on_Modo_2_pressed() -> void:
	Audio.som_botao()
	quadro_txt.set_text("Neste modo você deve responder as perguntas e no final saberá quantas acertou!")
	Globais.modo_de_jogo = 2
	verificar_modo_txt()
#---------------------------======---------------------------

func _on_Modo_3_pressed() -> void:
	Audio.som_botao()
	quadro_txt.set_text("Leia e responda o mais rápido que puder, não há tempo a perder! Literalmente...")	
	Globais.modo_de_jogo = 3
	verificar_modo_txt()
#---------------------------======---------------------------

func _on_Modo_4_pressed() -> void:
	Audio.som_botao()
	quadro_txt.set_text("Relaxa, toma um cafezinho porque neste modo você tem todo o tempo do mundo! ")	
	Globais.modo_de_jogo = 4
	verificar_modo_txt()
#---------------------------======---------------------------

func _on_continuar_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/selecionar_genio.tscn")
