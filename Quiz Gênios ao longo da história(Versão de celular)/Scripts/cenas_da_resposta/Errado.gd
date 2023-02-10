extends Control

onready var animacao := $animacao

var textos = ["Você errou, mas \n tudo bem, \né só tentar outra vez! ",
			"Isso acontece, \nfica traquilo, é só \ntentar mais uma vez!", 
			"Tentando, tentando,\n tentando...", "Não desista, \n você consegue!\n É só tentar de novo!",
			"É assim mesmo.\n Talvez você tenha que \nvoltar no almanaque!",
			"Tranquilo,\n volta no almanaque e\n depois tenta de novo." ]

func _ready():
	animacoes()
	texto()
#---------------------------======---------------------------	

func animacoes():
		Audio.cena_resposta_errada_som()
		animacao.play("animacao_botoes")
		yield(animacao, "animation_finished")
		animacao.play("animacao_simbolo")
			
#---------------------------======---------------------------	
				
func texto():
	for txt in textos:
		randomize()
		textos.shuffle()
		$Texto.set_text(str(txt))
						
#---------------------------======---------------------------
	
func _on_tentar_novamente_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao(Globais.cena_anterior)
#---------------------------======---------------------------	

func _on_voltar_menu_pressed():
	Audio.som_botao()
	Audio.tocar_musica()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
#---------------------------======---------------------------

func _on_voltar_ao_menu_timeout():
	Audio.tocar_musica()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")


