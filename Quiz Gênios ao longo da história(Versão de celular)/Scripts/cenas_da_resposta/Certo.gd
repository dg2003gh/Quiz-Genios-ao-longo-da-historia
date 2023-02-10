extends Node

onready var pontuacao_txt := $Pontuacao
onready var animacao := $animacao
onready var txt := $Texto



var textos = [
	"Parabéns, você respondeu \n todas as perguntas corretamente! \n  Que inteligência!",
	"Nossa!\nVocê não é um 10, é um 1000! ",
	"Carambolas!\n  Como você consegue ser tão\n  inteligente?\nLeu nosso conteúdo sobre ele, não é?",
	"Legal,\n  você respondeu tão rápido!",
	"Clica, clica, clica. \n Você sabe todas! "	
]

func _ready():
	animacoes()
	if Globais.modo_de_jogo == 2 or  4:
		texto2()
		pontuacao()
	else:
		texto()
func animacoes():
		Audio.cena_resposta_correta_som()
		animacao.play("animacao_botoes")
		yield(animacao,"animation_finished" )
		animacao.play("animacao_simbolo_certo")
		
#---------------------------======---------------------------

func texto():
		for texto in textos:
			randomize()
			textos.shuffle()
			$Texto.set_text(str(texto))

#---------------------------======---------------------------
func texto2():
	if Globais.pontos <= 4:
		txt.set_text(str("É... parece que você precisa dar",
						 "\n uma clicadinha no botão saiba mais!")) 
	if Globais.pontos >= 5:
		 txt.set_text(str("É isso aí, você foi demais!",
							"\nPorém, se você quiser acertar 10/10,\n terá que se esforçar um pouco mais!")) 
	if Globais.pontos == 10:
		txt.set_text(str("Nossa, que demais! \n",
		"Você foi excelente. \n Será que leu nosso conteúdo?"))
		
#---------------------------======---------------------------		
func pontuacao():
	if Globais.modo_de_jogo == 2 or 4:
		pontuacao_txt.show()
		pontuacao_txt.set_text(str("Parabéns, sua pontuação foi ", Globais.pontos, "/10!!!")) 
		Globais.pontos = 0
	else:
		pontuacao_txt.hide()

#---------------------------======---------------------------

func _on_Jogar_Novamente_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/modo_de_jogo.tscn")
	
#---------------------------======---------------------------

func _on_voltar_menu_pressed():
	Audio.som_botao()
	Audio.tocar_musica()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
	
#---------------------------======---------------------------

func _on_voltar_ao_menu_timeout():
	Audio.tocar_musica()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
