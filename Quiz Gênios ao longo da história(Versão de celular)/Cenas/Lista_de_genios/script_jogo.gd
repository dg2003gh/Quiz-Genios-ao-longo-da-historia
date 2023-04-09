extends Control

@export var BD: Resource
@export var cor_certo: Color 
@export var cor_errado: Color

@onready var pergunta := $Gui/texto_quadro
@onready var botoes := $Botoes
@onready var nivel_atual := $Gui/nivel_atual
@onready var tempo :=  $Gui/Tempo
@onready var animacao := $animacao_cena
@onready var foto := $Gui/foto_genio

var txt_botoes := []
var indice := 0

#---------------------------======---------------------------

func _ready() -> void:
	
	genio_escolhido()
	
	Globais.cena_anterior = get_tree().current_scene.scene_file_path
	for _botao in botoes.get_children():
		txt_botoes.append(_botao)
	
	#animacoes()
	carregamento_jogo()
#---------------------------======---------------------------
func animacoes():
		animacao.play("animacao_cena")
		await animacao.animation_finished
		animacao.play("loop_genio")
#---------------------------======---------------------------
func genio_escolhido() -> void:
	if Globais.genio == "turing":
		BD = preload("res://Cenas/Lista_de_genios/Alan_Turing/BD_fases_Turing.tres")
		foto.texture = preload("res://recursos/Imagens/Alan Turing(Caixa de Diálogo).png")
	elif Globais.genio == "einstein":
		BD = preload("res://Cenas/Lista_de_genios/Albert_Einstein/BD_fases_Einstein.tres")
		foto.texture = preload("res://recursos/Imagens/Albert Einstein(Caixa de Diálogo).png")
	elif Globais.genio == "darwin":
		BD = preload("res://Cenas/Lista_de_genios/Charles_Darwin/BD_fases_Darwin.tres")
		foto.texture = preload("res://recursos/Imagens/Charles_Darwin(Caixa de Diálogo).png")		
	elif Globais.genio == "galilei":
		BD = preload("res://Cenas/Lista_de_genios/Galileu_Galilei/BD_fases_Galilei.tres")
		foto.texture = preload("res://recursos/Imagens/Galileu_Galilei(Caixa de Diálogo).png")
	elif Globais.genio == "bell":
		BD = preload("res://Cenas/Lista_de_genios/Graham_Bell/BD_fases_Bell.tres")
		foto.texture = preload("res://recursos/Imagens/Graham bell(Caixa de Diálogo).png")
	elif Globais.genio == "newton":
		BD = preload("res://Cenas/Lista_de_genios/Issac_Newton/BD_fases_Newton.tres")
		foto.texture = preload("res://recursos/Imagens/Issac_Newton(Caixa de Diálogo).png")
	elif Globais.genio == "vinci":
		BD = preload("res://Cenas/Lista_de_genios/Leonardo_Davinci/BD_fases_Davinci.tres")
		foto.texture = preload("res://recursos/Imagens/Leonardo_Da_Vinci(Caixa de Diálogo).png")
	elif Globais.genio == "dumont":
		BD = preload("res://Cenas/Lista_de_genios/Santos_Dumont/BD_fases_Dumont.tres")
		foto.texture = preload("res://recursos/Imagens/Santos Dumont(Caixa de Diálogo).png")
	elif Globais.genio == "tesla":
		BD = preload("res://Cenas/Lista_de_genios/Nikola_Tesla/BD_fases_Tesla.tres")
		foto.texture = preload("res://recursos/Imagens/Nikola Tesla(Caixa de Diálogo).png")
	else:
		BD = preload("res://Cenas/Lista_de_genios/Thomas_Edison/BD_fases_Edison.tres")
		foto.texture = preload("res://recursos/Imagens/Thomas Edison(Caixa de Diálogo).png")
		
#---------------------------======---------------------------
func carregamento_jogo() -> void:
	if indice >= BD.questoes.size():
		Transicao.mudar_cena("res://Cenas/Cenas_da_resposta/Certo.tscn") 
	else:		

		var Questoes = BD.questoes
		
		pergunta.set_text(str(Questoes[indice].pergunta))
		
		nivel_atual.bbcode_enabled = true
		nivel_atual.set_text(str("[color=#e8c001]", indice + 1, "ª[/color] Pergunta"))
		
		var opcoes = BD.questoes[indice].opcoes
		randomize()
		opcoes.shuffle()
		
		for i in txt_botoes.size():
				txt_botoes[i].set_text(str(opcoes[i]))
				
				if Globais.modo_de_jogo == 4:
					txt_botoes[i].connect("pressed", Callable(self, "modo4").bind(txt_botoes[i]))
				elif Globais.modo_de_jogo == 3:
					txt_botoes[i].connect("pressed", Callable(self, "modo3").bind(txt_botoes[i])) 
				elif Globais.modo_de_jogo == 2:
					txt_botoes[i].connect("pressed", Callable(self, "modo2").bind(txt_botoes[i]))
				else:
					txt_botoes[i].connect("pressed", Callable(self, "modo1").bind(txt_botoes[i]))
					
#---------------------------======---------------------------
# NÃO ERRE		
func modo1(_botao) -> void :
	if BD.questoes[indice].correta == _botao.text:
		Audio.acertou_som()
		_botao.modulate = cor_certo
		_botao.disabled = true
	else:
		Audio.errou_som()
		_botao.modulate = cor_errado
		_botao.disabled = true
		if get_tree().change_scene_to_file("res://Cenas/Cenas_da_resposta/Errado.tscn") != OK:
			print("UM ERRO OCORREU AO TENTAR MUDAR PARA A CENA DE ERRADO!!!")
		
	await get_tree().create_timer(0.2).timeout
	for bt in txt_botoes:
		bt.modulate = Color.WHITE
		bt.disconnect("pressed", Callable(self, "modo1"))
	
	_botao.disabled = false
	indice += 1
	carregamento_jogo()
#---------------------------======---------------------------
#NO FINAL VEREMOS	
func modo2(_botao) -> void :
	
	if BD.questoes[indice].correta == _botao.text:
		Audio.acertou_som()
		_botao.modulate = cor_certo
		Globais.pontos += 1
		_botao.disabled = true
	else:
		Audio.errou_som()
		_botao.modulate = cor_errado
		_botao.disabled = true
		
	await get_tree().create_timer(0.2).timeout
	for bt in txt_botoes:
		bt.modulate = Color.WHITE
		bt.disconnect("pressed", Callable(self, "modo2"))
	
	_botao.disabled = false
	indice += 1
	carregamento_jogo()
	
#---------------------------======---------------------------
#BATE E PRONTO!	
func modo3(_botao) -> void :
	if BD.questoes[indice].correta == _botao.text:
		Audio.acertou_som()
		_botao.modulate = cor_certo
		_botao.disabled = true
	else:
		Audio.errou_som()
		_botao.modulate = cor_errado
		_botao.disabled = true
		if get_tree().change_scene_to_file("res://Cenas/Cenas_da_resposta/Errado.tscn") != OK:
			print("UM ERRO OCORREU AO TENTAR MUDAR PARA A CENA DE ERRADO!!!")
		
	await get_tree().create_timer(0.2).timeout
	for bt in txt_botoes:
		bt.modulate = Color.WHITE
		bt.disconnect("pressed", Callable(self, "modo3"))
	
	_botao.disabled = false
	indice += 1
	carregamento_jogo()
	
#---------------------------======---------------------------
#FÁCIL DEMAIS
func modo4(_botao) -> void :
	if BD.questoes[indice].correta == _botao.text:
		Audio.acertou_som()
		_botao.modulate = cor_certo
		_botao.disabled = true
		Globais.pontos += 1
	else:
		Audio.errou_som()
		_botao.disabled = true
		_botao.modulate = cor_errado
			
	await get_tree().create_timer(0.2).timeout
	for bt in txt_botoes:
		bt.modulate = Color.WHITE
		bt.disconnect("pressed", Callable(self, "modo4"))
	
	_botao.disabled = false
	indice += 1
	carregamento_jogo()
#---------------------------======---------------------------

#TEMPORIZADOR
func _on_Timer_timeout():
	tempo.bbcode_enabled = true
	if Globais.modo_de_jogo == 4:
		tempo.set_text(str("Tempo restante: [color=1ccd04]∞"))
		
	elif Globais.modo_de_jogo == 3:
		var segundos = 30
		segundos -= 1
		tempo.set_text(str("Tempo restante: 0:", segundos)) 
		if segundos <= 15:
			tempo.set_text(str("Tempo restante: [color=#e8c001]0:", segundos))
		if segundos < 10:
			Audio.temporizador()
			tempo.set_text(str("Tempo restante: [color=c90000]0:0", segundos))
		if segundos == -1:
			Audio.som_temp.stop()
			if get_tree().change_scene_to_file("res://Cenas/Cenas_da_resposta/tempo_esgotado.tscn") != OK:
				print("ERRO AO MUDAR CENA PARA TEMPO ESGOTADO")	
	elif Globais.modo_de_jogo == 2:
			var segundos = 50
			segundos -= 1
			tempo.set_text(str("Tempo restante: 0:", segundos))
			if segundos <= 30:
				tempo.set_text(str("Tempo restante: [color=#e8c001]0:", segundos))
			if segundos < 10:
				Audio.temporizador()
				tempo.set_text(str("Tempo restante: [color=c90000]0:0", segundos))
			if segundos == -1:
				Audio.som_temp.stop()
				if get_tree().change_scene_to_file("res://Cenas/Cenas_da_resposta/tempo_esgotado.tscn") != OK:
					print("ERRO AO MUDAR CENA PARA TEMPO ESGOTADO") 			
	else:
		var segundos = 60
		segundos -= 1
		tempo.set_text(str("Tempo restante: 0:", segundos))
		if segundos <= 30:
			tempo.set_text(str("Tempo restante: [color=#e8c001]0:", segundos))
		if segundos < 10:	
				Audio.temporizador()
				tempo.set_text(str("Tempo restante: [color=c90000]0:0", segundos))
		if segundos == -1:
			Audio.som_temp.stop()
			if get_tree().change_scene_to_file("res://Cenas/Cenas_da_resposta/tempo_esgotado.tscn") != OK:
				print("ERRO AO MUDAR CENA PARA TEMPO ESGOTADO") 
	


func _on_Pausar_pressed():
	Audio.som_botao()
