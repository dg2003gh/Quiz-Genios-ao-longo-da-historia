extends Control

@export var BD: Resource

@onready var pergunta: Node = $Gui/texto_quadro
@onready var alternativas: Node = $Gui/alternativas
@onready var nivel_atual: Node = $Gui/nivel_atual
@onready var animacao: Node = $animacao
@onready var foto: Node = $Gui/foto_genio

var txt_alternativas: Array = []
var indice: int = 0

#---------------------------======---------------------------

func _ready() -> void:
	genio_escolhido()
	
	Globais.cena_anterior = get_tree().current_scene.scene_file_path
	for alternativa in alternativas.get_children():
		txt_alternativas.append(alternativa)
	
	animacoes()
	carregamento_jogo()
#---------------------------======---------------------------
func animacoes():
		animacao.play("animacao_inicial")
		await animacao.animation_finished
		animacao.play("loop_genio")
#---------------------------======---------------------------
func genio_escolhido() -> void:
	if Globais.genio == "turing":
		BD = preload("res://bd/Alan_Turing/BD_fases_Turing.tres")
		foto.texture = preload("res://assets/Imagens/Alan Turing(Caixa de Diálogo).png")
	elif Globais.genio == "einstein":
		BD = preload("res://bd/Albert_Einstein/BD_fases_Einstein.tres")
		foto.texture = preload("res://assets/Imagens/Albert Einstein(Caixa de Diálogo).png")
	elif Globais.genio == "darwin":
		BD = preload("res://bd/Charles_Darwin/BD_fases_Darwin.tres")
		foto.texture = preload("res://assets/Imagens/Charles_Darwin(Caixa de Diálogo).png")		
	elif Globais.genio == "galilei":
		BD = preload("res://bd/Galileu_Galilei/BD_fases_Galilei.tres")
		foto.texture = preload("res://assets/Imagens/Galileu_Galilei(Caixa de Diálogo).png")
	elif Globais.genio == "bell":
		BD = preload("res://bd/Graham_Bell/BD_fases_Bell.tres")
		foto.texture = preload("res://assets/Imagens/Graham bell(Caixa de Diálogo).png")
	elif Globais.genio == "newton":
		BD = preload("res://bd/Issac_Newton/BD_fases_Newton.tres")
		foto.texture = preload("res://assets/Imagens/Issac_Newton(Caixa de Diálogo).png")
	elif Globais.genio == "vinci":
		BD = preload("res://bd/Leonardo_Davinci/BD_fases_Davinci.tres")
		foto.texture = preload("res://assets/Imagens/Leonardo_Da_Vinci(Caixa de Diálogo).png")
	elif Globais.genio == "dumont":
		BD = preload("res://bd/Santos_Dumont/BD_fases_Dumont.tres")
		foto.texture = preload("res://assets/Imagens/Santos Dumont(Caixa de Diálogo).png")
	elif Globais.genio == "tesla":
		BD = preload("res://bd/Nikola_Tesla/BD_fases_Tesla.tres")
		foto.texture = preload("res://assets/Imagens/Nikola Tesla(Caixa de Diálogo).png")
	else:
		BD = preload("res://bd/Thomas_Edison/BD_fases_Edison.tres")
		foto.texture = preload("res://assets/Imagens/Thomas Edison(Caixa de Diálogo).png")
		
#---------------------------======---------------------------
func carregamento_jogo() -> void:
	if indice >= BD.questoes.size():
		Transicao.mudar_cena("res://Cenas/Cenas_da_resposta/Certo.tscn") 
	else:		

		var Questoes = BD.questoes
		
		pergunta.set_text(str(Questoes[indice].pergunta))
		
		nivel_atual.bbcode_enabled = true
		nivel_atual.set_text(str("[color=#19dc00]", indice + 1, "[/color]ª Pergunta"))
		
		var opcoes = BD.questoes[indice].opcoes
		randomize()
		opcoes.shuffle()
		
		for txt_alternativa in txt_alternativas.size():
				txt_alternativas[txt_alternativa].set_text(str(opcoes[txt_alternativa]).to_upper())
				txt_alternativas[txt_alternativa].connect("pressed", Callable(self, "modo").bind(txt_alternativas[txt_alternativa]))
		
#---------------------------======---------------------------		
func modo(_botao) -> void :
	var correta = BD.questoes[indice].correta.to_upper()
	if correta == _botao.text:
		Audio.acertou_som()
		if Globais.modo_de_jogo == 2 or Globais.modo_de_jogo == 4:
			Globais.pontos += 1
		_botao.modulate = Color.GREEN
		_botao.disabled = true
	else:
		Audio.errou_som()	
		if Globais.modo_de_jogo == 1 or Globais.modo_de_jogo == 3:
			get_tree().change_scene_to_file("res://Cenas/Cenas_da_resposta/Errado.tscn")
			Globais.pontos = 0
		_botao.disabled = true
		_botao.modulate = Color.RED
	await get_tree().create_timer(0.2).timeout
	for bt in txt_alternativas:
		bt.disconnect("pressed", Callable(self, "modo"))
		bt.modulate = Color.WHITE
	_botao.disabled = false
	indice += 1
	carregamento_jogo()
#---------------------------======---------------------------

func _on_pausar_pressed():
	Audio.som_botao()
	if $menu_de_pausa.visible == false:
		get_tree().paused = not get_tree().paused
		$menu_de_pausa.tocarAnimacoes()
		$menu_de_pausa.visible = true
