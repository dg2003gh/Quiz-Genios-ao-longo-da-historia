extends Control

@onready var animacoes_player: Node = $animacoes 
@onready var musica_botao: Node = $Panel_do_audio/musica
@onready var sons_botao: Node = $Panel_do_audio/sons

func _ready():	
	verificar_state_toggleButtons()
	animacoes()
	
#---------------------------======---------------------------
func animacoes():
	animacoes_player.play("animacao_inicial")
#---------------------------======---------------------------
func _on_politicas_pressed():
		Transicao.mudar_cena("res://Cenas/Menus/politicas.tscn")

func _on_creditos_pressed():
	Transicao.mudar_cena("res://Cenas/Menus/Creditos.tscn")

func _on_musica_toggled(button_pressed):
	if button_pressed: 
		Globais.musica = true
	else:	
		Globais.musica = false
	Audio.mutar_audios()
	Globais.salvar_configuracoes_do_usuario()
	
func _on_sons_toggled(button_pressed):
	if button_pressed: 
		Globais.sons = true
	else:	
		Globais.sons = false
	Audio.mutar_audios()		
	Globais.salvar_configuracoes_do_usuario()

func _on_saiba_mais_pressed():
	Globais.executar_pdf()
	
func _on_voltar_pressed():
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")

func verificar_state_toggleButtons():
	musica_botao.button_pressed = Globais.musica
	sons_botao.button_pressed = Globais.sons
	
