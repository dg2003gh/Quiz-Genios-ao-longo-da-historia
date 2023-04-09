extends Control

func _ready():
	animacoes()
	pass
	
#---------------------------======---------------------------
func animacoes():
	$animacoes.play("animacao_inicial")
	
#---------------------------======---------------------------
		
func _on_creditos_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Creditos.tscn")

func _on_voltar_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")

func _on_avalie_nos_pressed():
	OS.shell_open("https://youtube.com.br")


func _on_sons_toggled(button_pressed):
	pass
