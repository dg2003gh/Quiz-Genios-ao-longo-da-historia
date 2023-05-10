extends CanvasLayer

@onready var animacoes: Node = $animacao

func tocarAnimacoes():
	animacoes.play("animacao_inicial")
	await animacoes.animation_finished
	animacoes.play("loop_pausartxt")
	
func _on_voltar_ao_jogo_pressed():
	Audio.som_botao()
	if get_tree().paused == true && self.visible == true: 
		get_tree().paused = false
		self.visible = false
	else:
		print("Falha ao voltar à cena principal de jogo!")
#---------------------------======---------------------------

func _on_saiba_mais_pressed():
	Globais.executar_pdf()

func _on_voltar_pressed():
	Audio.som_botao()
	if get_tree().paused == true:
		get_tree().paused = false
		Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
		Audio.aumentar_volume()

