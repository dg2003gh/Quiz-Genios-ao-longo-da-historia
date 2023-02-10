extends Control

func _ready():
	animacoes()
	
#---------------------------======---------------------------

func animacoes():
		$animacoes.play("animacao_inicial")
		yield($animacoes,"animation_finished")
		$animacoes.play("animacao_genios_loop")
		
#---------------------------======---------------------------

func _on_comecar_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/modo_de_jogo.tscn")

#---------------------------======---------------------------
	
func _on_configs_botao_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/Configs.tscn")

#---------------------------======---------------------------
	
func _on_sair_pressed():
	get_tree().quit()

