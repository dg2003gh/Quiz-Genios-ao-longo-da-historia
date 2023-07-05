extends Control

@onready var texto_label: Node = $Texto
@onready var animacao: Node = $animacao

var textos: Array[String] = ["Tic-tac, Tic-tac,\n Tic-tac...", 
			"O tempo acabou!\n Olha, está até saindo\n fumaça da sua caixola!", 
			"O tempo passou\n e você não percebeu?",
			"Minha avó dizia...\no que ela dizia mesmo?\n Faz tanto tempo...",
			"Você vai precisar ler\n um pouco mais\n rápido..."]

func _ready():
	texto()
	animacoes()
	
#---------------------------======---------------------------
func texto():
	for txt in textos:
		randomize()
		textos.shuffle()
		texto_label.set_text(str(txt))
#---------------------------======---------------------------	
func animacoes():
		Audio.tocar_sons("res://assets/Audios/Sons/cena_tempo_esgotado.ogg")
		animacao.play("animacao_inicial")
		await animacao.animation_finished
		animacao.play("loop_relogio")

#---------------------------======---------------------------			
func _on_Jogar_Novamente_pressed():
	Transicao.jogar_transicao(Globais.cena_anterior, true)
	
#---------------------------======---------------------------
	
func _on_voltar_pressed():
	Audio.animar_audio()
	Audio.player_sons.stop()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")

#---------------------------======---------------------------

func _on_voltar_ao_menu_timeout():
	_on_voltar_pressed()
