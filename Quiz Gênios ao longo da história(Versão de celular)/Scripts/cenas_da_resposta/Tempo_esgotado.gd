extends Control

@onready var animacao := $animacao

var textos = ["Tic-tac, Tic-tac,\n Tic-tac...", 
			"O tempo acabou!\n Olha, está até saindo\n fumaça da sua caixola!", 
			"O tempo passou\n e você não percebeu?",
			"Minha avó dizia...\no que ela dizia mesmo?\n Faz tanto tempo...",
			"Você vai precisar ler\n um pouco mais\n rápido..."]

func _ready():
	texto()
	#animacoes()
	
#---------------------------======---------------------------
func texto():
	for txt in textos:
		randomize()
		textos.shuffle()
		$Texto.set_text(str(txt))
#---------------------------======---------------------------	
func animacoes():
		Audio.cena_tempo_esgotado_som()
		animacao.play("animacao_botoes")
		await animacao.animation_finished
		animacao.play("animacao_relogio")

#---------------------------======---------------------------			
func _on_Jogar_Novamente_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao(Globais.cena_anterior)

#---------------------------======---------------------------
	
func _on_voltar_pressed():
	Audio.som_botao()
	Audio.tocar_musica()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")

#---------------------------======---------------------------

func _on_voltar_ao_menu_timeout():
	Audio.som_botao()
	Audio.tocar_musica()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
