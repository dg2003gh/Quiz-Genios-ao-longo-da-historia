extends Control

@onready var foto_caixa_de_dialogo: Node = $"Caixa de dialogo/genio"
@onready var animacoes_player: Node = $animacoes
@onready var grupo_botoes = get_tree().get_nodes_in_group("botoes_selecionar")

func _ready():
	for botao in grupo_botoes:
		botao.connect("pressed", Callable(self, "entrar_cena_principal").bind(botao))
	Globais.alterar_foto(foto_caixa_de_dialogo)
	animacoes()	
	
#---------------------------======---------------------------			

func animacoes():
		animacoes_player.play("animacao_inicial")
		await animacoes_player.animation_finished
		animacoes_player.play("loop_genio")
#---------------------------======---------------------------

func entrar_cena_principal(botao):
	Transicao.jogar_transicao("res://Cenas/Cena_principal.tscn", false)
	Audio._tocar_som_botoes()
	Globais.genio = str(botao.name)
	
#---------------------------======---------------------------

func _on_voltar_pressed():
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
	
