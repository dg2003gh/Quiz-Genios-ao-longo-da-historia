extends Control

onready var animacao_genios := $animacao/AnimationPlayer
onready var animacao_botoes := $"Botôes/Animacao_botoes"

func _ready():
	animacoes()
	
#---------------------------======---------------------------

func animacoes():
		animacao_genios.play("Genios")
		animacao_botoes.play("Animacao_texto_botoes")
		yield(animacao_genios,"animation_finished")
		animacao_genios.play("Genios2")
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

