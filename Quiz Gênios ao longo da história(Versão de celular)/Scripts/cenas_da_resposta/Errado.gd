extends Control

@onready var texto_label: Node = $Texto
@onready var animacao: Node = $animacao

var textos: Array[String] = ["Você errou, mas \n tudo bem, \né só tentar outra vez! ",
			"Isso acontece, \nfica traquilo, é só \ntentar mais uma vez!", 
			"Tentando, tentando,\n tentando...", "Não desista, \n você consegue!\n É só tentar de novo!",
			"É assim mesmo.\n Talvez você tenha que \nvoltar no almanaque!",
			"Tranquilo,\n volta no almanaque e\n depois tenta de novo." ]

func _ready():
	animacoes()
	texto()
#---------------------------======---------------------------	

func animacoes():
		Audio.tocar_sons("res://assets/Audios/Sons/cena_resposta_errada.ogg")
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

