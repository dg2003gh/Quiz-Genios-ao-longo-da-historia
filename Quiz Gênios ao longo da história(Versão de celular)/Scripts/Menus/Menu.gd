extends Control

@onready var animacoes: Node = $animacoes

func _ready() -> void:
	tocarAnimacoes()
		
#---------------------------======---------------------------

func tocarAnimacoes():
		animacoes.play("animacao_inicial")
		await get_tree().create_timer(1.3).timeout
		animacoes.play("loop_genios")
		
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
	Globais.executar_pdf()
	
#---------------------------======---------------------------
func _on_sair_pressed():
	get_tree().quit()




