extends CanvasLayer

@onready var animacoes: Node = $animacao

func tocarAnimacoes():
	animacoes.play("animacao_inicial")
	await animacoes.animation_finished
	animacoes.play("loop_pausartxt")
	
func _on_voltar_ao_jogo_pressed():
	get_tree().paused = not get_tree().paused
	self.visible = !self.visible
#---------------------------======---------------------------

func _on_saiba_mais_pressed():
	Globais.executar_pdf()
	
func _on_voltar_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
		Audio.animar_audio()
