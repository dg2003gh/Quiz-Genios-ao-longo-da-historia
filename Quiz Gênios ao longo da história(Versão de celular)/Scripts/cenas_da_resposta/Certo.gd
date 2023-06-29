extends Node

@onready var pontuacao_label: Node = $Pontuacao
@onready var animacao: Node = $animacao
@onready var texto_label: Node = $Texto

var textos: Array[String] = [
	"Parabéns, você respondeu \n todas as perguntas corretamente! \n  Que inteligência!",
	"Nossa!\nVocê não é um 10, é um 1000! ",
	"Carambolas!\n  Como você consegue ser tão\n  inteligente?\nLeu nosso conteúdo sobre\n ele, não é?",
	"Legal,\n  você respondeu tão rápido!",
	"Clica, clica, clica. \n Você sabe todas! "	
]

func _ready():
	animacoes()
	if Globais.modo_de_jogo == 2 or Globais.modo_de_jogo == 4:
		textos_modos_com_pontuacao()
		pontuacao()
	else:
		texto()
		
func animacoes():
		Audio.tocar_sons("res://assets/Audios/Sons/cena_resposta_correta.ogg")
		animacao.play("animacao_inicial")
		await animacao.animation_finished
		animacao.play("loop_simbolo")
		
#---------------------------======---------------------------

func texto():
		for txt in textos:
			randomize()
			textos.shuffle()
			texto_label.set_text(str(txt))

#---------------------------======---------------------------
func textos_modos_com_pontuacao():
	if Globais.pontos <= 4:
		texto_label.set_text(str("É... parece que você \nprecisa dar ",
		"uma clicadinha no\n botão \"SAIBA MAIS!\"")) 
	if Globais.pontos >= 5:
		texto_label.set_text(str("É isso aí, foi demais!",
		"\nPorém, se você quiser acertar 10/10,\n terá que se esforçar um pouco mais!")) 
	if Globais.pontos == 10:
		texto_label.set_text(str("Nossa, que demais! \n",
		"Você foi excelente. \n Será que leu nosso \nconteúdo: em \"SAIBA MAIS\"?"))
		
#---------------------------======---------------------------		
func pontuacao():
	if Globais.modo_de_jogo == 2 or Globais.modo_de_jogo == 4:
		pontuacao_label.show()
		pontuacao_label.set_text(str("Parabéns, sua pontuação foi ", Globais.pontos, "/10!!!")) 
		if Globais.pontos <= 4:
			pontuacao_label.set_text(str("Sua pontuação foi ", Globais.pontos, "/10!!!")) 
		Globais.pontos = 0
	else:
		pontuacao_label.hide()

#---------------------------======---------------------------

func _on_Jogar_Novamente_pressed():
	Globais.pontos = 0
	Transicao.jogar_transicao(Globais.cena_anterior, true)
	
#---------------------------======---------------------------

func _on_voltar_pressed():
	Audio.animar_audio()
	Globais.pontos = 0
	Audio.player_sons.stop()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
	
#---------------------------======---------------------------

func _on_voltar_ao_menu_timeout():
	_on_voltar_pressed()

