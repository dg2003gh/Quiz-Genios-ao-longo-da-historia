extends Control

@onready var foto_caixa_de_dialogo = $"Caixa de dialogo/genio"

func _ready():
	
	Globais.alterar_foto(foto_caixa_de_dialogo)
	animacoes()	
#---------------------------======---------------------------			
func animacoes():
		$animacoes.play("animacao_inicial")
		await $animacoes.animation_finished
		$animacoes.play("loop_genio")
#---------------------------======---------------------------

#LISTA DE GÊNIOS

func _on_turing_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn")
	Globais.genio = "turing"
func _on_einstein_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn")
	Globais.genio = "einstein"
func _on_darwin_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn")
	Globais.genio = "darwin"
func _on_galilei_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn")
	Globais.genio = "galilei"	
func _on_bell_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn")
	Globais.genio = "bell"
func _on_newton_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn")
	Globais.genio = "newton"
func _on_vinci_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn")
	Globais.genio = "vinci"
func _on_dumont_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn")
	Globais.genio = "dumont"
func _on_tesla_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn")
	Globais.genio = "tesla"
func _on_edison_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn")
	Globais.genio = "edison"
#---------------------------======---------------------------

func _on_voltar_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
	
