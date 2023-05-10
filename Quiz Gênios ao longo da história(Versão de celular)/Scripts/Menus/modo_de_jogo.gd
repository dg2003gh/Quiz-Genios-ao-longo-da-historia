extends Control

@onready var modo_txt := $"Caixa de dialogo/modo_atual"
@onready var quadro_txt := $"Caixa de dialogo/Texto_quadro"
@onready var foto_caixa_de_dialogo := $"Caixa de dialogo/genio"


func _ready():
		verificar_modo_txt()
		Globais.alterar_foto(foto_caixa_de_dialogo)
		animacoes()
		
#---------------------------======---------------------------


func verificar_modo_txt():
	modo_txt.bbcode_enabled = true
	var modo 
	if Globais.modo_de_jogo == 4:
		modo = "Pode relaxar"
	elif Globais.modo_de_jogo == 3:
		modo = "Bate e pronto"		
	elif Globais.modo_de_jogo == 2:
		modo = "No final veremos"
	else:
		modo = "Não Erre"
	modo_txt.set_text("[color=#19dc00]Modo atual:[/color] {modo}!".format({"modo": modo}))
	
func animacoes():
		$animacoes.play("animacao_cena")	
		await $animacoes.animation_finished
		$animacoes.play("loop_genio")
		
# MODOS DE JOGO.
		
func _on_Modo1_pressed() -> void:
	Audio.som_botao()
	quadro_txt.set_text("Este modo é bem simples. Se \nvocê errar uma pergunta, perde!\nEntão arrase em todas!")			
	Globais.modo_de_jogo = 1
	verificar_modo_txt()
#---------------------------======---------------------------
	
func _on_Modo2_pressed() -> void:
	Audio.som_botao()
	quadro_txt.set_text("Neste modo você deve responder\nas perguntas e no final saberá\nquantas acertou!")
	Globais.modo_de_jogo = 2
	verificar_modo_txt()
#---------------------------======---------------------------

func _on_Modo3_pressed() -> void:
	Audio.som_botao()
	quadro_txt.set_text("Leia e responda o mais rápido que\npuder, não há tempo a perder!\nLiteralmente...")	
	Globais.modo_de_jogo = 3
	verificar_modo_txt()
#---------------------------======---------------------------

func _on_Modo4_pressed() -> void:
	Audio.som_botao()
	quadro_txt.set_text("Relaxa, toma um cafezinho\nporque neste modo você tem\ntodo o tempo do mundo! ")	
	Globais.modo_de_jogo = 4
	verificar_modo_txt()
#---------------------------======---------------------------

func _on_Continuar_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/selecionar_genio.tscn")



