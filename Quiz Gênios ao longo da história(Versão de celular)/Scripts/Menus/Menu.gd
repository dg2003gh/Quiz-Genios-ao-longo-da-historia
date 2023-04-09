extends Control

func _ready() -> void:
	animacoes()
	pass	
#---------------------------======---------------------------

func animacoes():
		$animacoes.play("animacao_inicial")
		await $animacoes.animation_finished
		$animacoes.play("loop_genios")
		
#---------------------------======---------------------------

func _on_comecar_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/modo_de_jogo.tscn")

#---------------------------======---------------------------
	
func _on_configs_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/Configs.tscn")

#---------------------------======---------------------------

func _on_saiba_mais_pressed():
	pass # Replace with function body.
	
#---------------------------======---------------------------
func _on_sair_pressed():
	get_tree().quit()




