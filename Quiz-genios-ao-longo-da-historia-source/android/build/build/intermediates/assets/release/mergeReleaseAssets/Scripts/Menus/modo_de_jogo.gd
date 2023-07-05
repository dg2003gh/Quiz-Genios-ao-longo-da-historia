extends Control

@onready var modo_label: Node= $"Caixa de dialogo/modo_atual"
@onready var quadro_label: Node = $"Caixa de dialogo/quadro/Texto_quadro"
@onready var foto_caixa_de_dialogo: Node = $"Caixa de dialogo/genio"
@onready var animacoes_player: Node = $animacoes

@onready var modo: String 

func _ready() -> void:
		Globais.alterar_foto(foto_caixa_de_dialogo)
		verificar_modo_txt()
		animacoes()
		
#---------------------------======---------------------------

func verificar_modo_txt() -> void:
	modo_label.bbcode_enabled = true
	match Globais.modo_de_jogo:
		4:
			modo = "Pode relaxar"
		3:
			modo = "Bate e pronto"		
		2:
			modo = "No final veremos"
		1, _:
			modo = "Não Erre"
	
	modo_label.set_text("[color=#19dc00]Modo atual:[/color] {modo}!".format({"modo": modo}))
	
func animacoes() -> void:
		animacoes_player.play("animacao_cena")	
		await animacoes_player.animation_finished
		animacoes_player.play("loop_genio")
		
# MODOS DE JOGO.
func _on_Modo1_pressed() -> void:
	quadro_label.set_text("Este modo é bem simples. Se \nvocê errar uma pergunta, perde!\nEntão arrase em todas!")			
	Globais.modo_de_jogo = 1
	verificar_modo_txt()
#---------------------------======---------------------------
	
func _on_Modo2_pressed() -> void:
	quadro_label.set_text("Neste modo você deve responder\nas perguntas e no final saberá\nquantas acertou!")
	Globais.modo_de_jogo = 2
	verificar_modo_txt()
#---------------------------======---------------------------

func _on_Modo3_pressed() -> void:
	quadro_label.set_text("Leia e responda o mais rápido que\npuder, não há tempo a perder!\nLiteralmente...")	
	Globais.modo_de_jogo = 3
	verificar_modo_txt()
#---------------------------======---------------------------

func _on_Modo4_pressed() -> void:
	quadro_label.set_text("Relaxa, toma um cafezinho\nporque neste modo você tem\ntodo o tempo do mundo! ")	
	Globais.modo_de_jogo = 4
	verificar_modo_txt()
#---------------------------======---------------------------

func _on_Continuar_pressed() -> void:
	Globais.pontos = 0
	Transicao.mudar_cena("res://Cenas/Menus/selecionar_genio.tscn")



