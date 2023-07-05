extends Control

@onready var animacao_player: Node = $Animacao

func _ready():
	animacao()

func animacao():
	animacao_player.play("animacao_inicial")
	
func _on_politicas_pressed():
	OS.shell_open("https://dg2003gh.github.io/Quiz-Genios-ao-longo-da-historia/")

func _on_aceitar_e_continuar_pressed():
	Globais.aceito = true
	Globais.salvar_configuracoes_do_usuario()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")

func _on_sair_pressed():
	Globais.aceito = false
	Globais.salvar_configuracoes_do_usuario()
	get_tree().quit()
