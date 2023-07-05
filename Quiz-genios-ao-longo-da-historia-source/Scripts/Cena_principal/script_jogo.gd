extends Control

@export var BD: Resource

@onready var pergunta: Node = $Gui/quadro/texto_quadro
@onready var alternativas: Node = $Gui/alternativas
@onready var nivel_atual: Node = $Gui/nivel_atual
@onready var animacao: Node = $animacao
@onready var foto: Node = $Gui/foto_genio
@onready var menu_pausa: Node = $menu_de_pausa

var indice: int = 0

var correta: String 

var questoes: Array[Resource]
var opcoes: Array[String]
var txt_alternativas: Array[Node]

#---------------------------======---------------------------

func _ready() -> void:
	genio_escolhido()
	id_cena()
	animacoes()
	carregamento_jogo()

#---------------------------======---------------------------
func animacoes() -> void:
		animacao.play("animacao_inicial")
		await animacao.animation_finished
		animacao.play("loop_genio")

#---------------------------======---------------------------
func id_cena() -> void:
	Globais.cena_anterior = get_tree().current_scene.scene_file_path
	for alternativa in alternativas.get_children():
		txt_alternativas.append(alternativa)

#---------------------------======---------------------------
func genio_escolhido() -> void:
	match Globais.genio:
		"turing":  
			BD = preload("res://bd/Alan_Turing/BD_fases_Turing.tres")
			foto.texture = preload("res://assets/Imagens/Alan Turing(Caixa de Diálogo).png")
		"einstein":
			BD = preload("res://bd/Albert_Einstein/BD_fases_Einstein.tres")
			foto.texture = preload("res://assets/Imagens/Albert Einstein(Caixa de Diálogo).png")
		"darwin":
			BD = preload("res://bd/Charles_Darwin/BD_fases_Darwin.tres")
			foto.texture = preload("res://assets/Imagens/Charles_Darwin(Caixa de Diálogo).png")		
		"galilei":
			BD = preload("res://bd/Galileu_Galilei/BD_fases_Galilei.tres")
			foto.texture = preload("res://assets/Imagens/Galileu_Galilei(Caixa de Diálogo).png")
		"bell":
			BD = preload("res://bd/Graham_Bell/BD_fases_Bell.tres")
			foto.texture = preload("res://assets/Imagens/Graham bell(Caixa de Diálogo).png")
		"newton":
			BD = preload("res://bd/Isaac_Newton/BD_fases_Newton.tres")
			foto.texture = preload("res://assets/Imagens/Issac_Newton(Caixa de Diálogo).png")
		"vinci":
			BD = preload("res://bd/Leonardo_Davinci/BD_fases_Davinci.tres")
			foto.texture = preload("res://assets/Imagens/Leonardo_Da_Vinci(Caixa de Diálogo).png")
		"dumont":
			BD = preload("res://bd/Santos_Dumont/BD_fases_Dumont.tres")
			foto.texture = preload("res://assets/Imagens/Santos Dumont(Caixa de Diálogo).png")
		"tesla":
			BD = preload("res://bd/Nikola_Tesla/BD_fases_Tesla.tres")
			foto.texture = preload("res://assets/Imagens/Nikola Tesla(Caixa de Diálogo).png")
		"edison", _:
			BD = preload("res://bd/Thomas_Edison/BD_fases_Edison.tres")
			foto.texture = preload("res://assets/Imagens/Thomas Edison(Caixa de Diálogo).png")
			
#---------------------------======---------------------------
func carregamento_jogo() -> void:
	if indice >= BD.questoes.size():
		Transicao.mudar_cena("res://Cenas/Cenas_da_resposta/Certo.tscn") 
		Audio.player_temporizador.stop()
	else:		
		questoes = BD.questoes
		opcoes = BD.questoes[indice].opcoes
		
		pergunta.set_text(str(questoes[indice].pergunta))
		
		nivel_atual.bbcode_enabled = true
		nivel_atual.set_text(str("[color=#19dc00]", indice + 1, "[/color]ª Pergunta"))
		
		randomize()
		opcoes.shuffle()
		
		for txt_alternativa in txt_alternativas.size():
				txt_alternativas[txt_alternativa].set_text(str(opcoes[txt_alternativa]).to_upper())
				txt_alternativas[txt_alternativa].connect("pressed", Callable(self, "modo").bind(txt_alternativas[txt_alternativa]))
		
#---------------------------======---------------------------		
func modo(_botao) -> void:
	correta = BD.questoes[indice].correta.to_upper()
	if correta == _botao.text:
		if Globais.modo_de_jogo == 2 or Globais.modo_de_jogo == 4:
			Globais.pontos += 1
		_botao.modulate = Color.GREEN
		_botao.disabled = true
		Audio.tocar_sons("res://assets/Audios/Sons/Resposta_correta.ogg")
	else:
		if Globais.modo_de_jogo == 1 or Globais.modo_de_jogo == 3:
			get_tree().change_scene_to_file("res://Cenas/Cenas_da_resposta/Errado.tscn")
			Globais.pontos = 0
			Audio.player_temporizador.stop()
		_botao.disabled = true
		_botao.modulate = Color.RED
		Audio.tocar_sons("res://assets/Audios/Sons/Resposta_errada.ogg")
	await get_tree().create_timer(0.2).timeout
	for bt in txt_alternativas:
		bt.disconnect("pressed", Callable(self, "modo"))
		bt.modulate = Color.WHITE
	_botao.disabled = false
	
	indice += 1
	carregamento_jogo()
#---------------------------======---------------------------

func _on_pausar_pressed() -> void:
	Globais.pontos = 0
	get_tree().paused = not get_tree().paused
	menu_pausa.tocarAnimacoes()
	menu_pausa.visible = !menu_pausa.visible
