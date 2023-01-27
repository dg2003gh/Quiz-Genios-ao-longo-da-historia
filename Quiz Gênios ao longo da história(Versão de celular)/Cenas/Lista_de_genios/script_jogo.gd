extends Control

export(Resource) var BD
export(Color) var cor_certo 
export(Color) var cor_errado
export(Color) var temporizador_quase_acabando
export(Color) var temporizador_acabou
export(Color) var infinito

onready var pergunta := $Gui/texto_quadro
onready var botoes := $Gui/Botoes
onready var nivel_atual := $Gui/nivel_atual
onready var tempo :=  $Gui/Tempo
onready var animacao := $Gui/animacao_cena

var txt_botoes := []
var segundos1 = 61
var segundos2= 51
var segundos3 = 31
var indice := 0
#---------------------------======---------------------------

func _ready() -> void:
	
	Globais.cena_anterior = get_tree().current_scene.filename
	for _botao in botoes.get_children():
		txt_botoes.append(_botao)
	
	animacoes()
	carregamento_jogo()
#---------------------------======---------------------------
func animacoes():
		animacao.play("animacao_cena")
#---------------------------======---------------------------
		
func carregamento_jogo() -> void:
	if indice >= BD.questoes.size():
		Transicao.mudar_cena("res://Cenas/Cenas_da_resposta/Certo.tscn") 
	else:		

		var Questoes = BD.questoes
		
		pergunta.set_text(str(Questoes[indice].pergunta))
		nivel_atual.set_text(str(indice + 1, "ª Pergunta"))
		
		var opcoes = BD.questoes[indice].opcoes
		randomize()
		opcoes.shuffle()
		
		for i in txt_botoes.size():
				txt_botoes[i].set_text(str(opcoes[i]))
				
				if Globais.modo_de_jogo == 4:
					txt_botoes[i].connect("pressed", self, "modo4", [txt_botoes[i]])
				elif Globais.modo_de_jogo == 3:
					txt_botoes[i].connect("pressed", self, "modo3", [txt_botoes[i]]) 
				elif Globais.modo_de_jogo == 2:
					txt_botoes[i].connect("pressed", self, "modo2", [txt_botoes[i]])
				else:
					txt_botoes[i].connect("pressed", self, "modo1", [txt_botoes[i]])
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
		if get_tree().change_scene("res://Cenas/Cenas_da_resposta/Errado.tscn") != OK:
			print("UM ERRO OCORREU AO TENTAR MUDAR PARA A CENA DE ERRADO!!!")
		
	yield(get_tree().create_timer(0.2), "timeout")
	for bt in txt_botoes:
		bt.modulate = Color.white
		bt.disconnect("pressed", self, "modo1")
	
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
		
	yield(get_tree().create_timer(0.2), "timeout")
	for bt in txt_botoes:
		bt.modulate = Color.white
		bt.disconnect("pressed", self, "modo2")
	
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
		if get_tree().change_scene("res://Cenas/Cenas_da_resposta/Errado.tscn") != OK:
			print("UM ERRO OCORREU AO TENTAR MUDAR PARA A CENA DE ERRADO!!!")
		
	yield(get_tree().create_timer(0.2), "timeout")
	for bt in txt_botoes:
		bt.modulate = Color.white
		bt.disconnect("pressed", self, "modo3")
	
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
	else:
		Audio.errou_som()
		_botao.disabled = true
		_botao.modulate = cor_errado
		if get_tree().change_scene("res://Cenas/Cenas_da_resposta/Errado.tscn") != OK:
			print("UM ERRO OCORREU AO TENTAR MUDAR PARA A CENA DE ERRADO!!!")
			
	yield(get_tree().create_timer(0.2), "timeout")
	for bt in txt_botoes:
		bt.modulate = Color.white
		bt.disconnect("pressed", self, "modo4")
	
	_botao.disabled = false
	indice += 1
	carregamento_jogo()
#---------------------------======---------------------------

#TEMPORIZADOR
func _on_Timer_timeout():
	
	if Globais.modo_de_jogo == 4:
		tempo.set_text(str("Tempo restante: ∞"))
		tempo.modulate = infinito
		
	elif Globais.modo_de_jogo == 3:
		segundos3 -= 1
		tempo.set_text(str("Tempo restante: 0:", segundos3)) 
		if segundos3 <= 15:
			tempo.modulate = temporizador_quase_acabando
		if segundos3 < 10:
			Audio.temporizador()
			tempo.set_text(str("Tempo restante: 0:0", segundos3))
			tempo.modulate = temporizador_acabou
		if segundos3 == -1:
			Audio.som_temp.stop()
			if get_tree().change_scene("res://Cenas/Cenas_da_resposta/tempo_esgotado.tscn") != OK:
				print("ERRO AO MUDAR CENA PARA TEMPO ESGOTADO")	
	elif Globais.modo_de_jogo == 2:
			segundos2 -= 1
			tempo.set_text(str("Tempo restante: 0:", segundos2))
			if segundos2 <= 30:
				tempo.modulate = temporizador_quase_acabando
			if segundos2 < 10:
				Audio.temporizador()
				tempo.set_text(str("Tempo restante: 0:0", segundos2))
				tempo.modulate = temporizador_acabou
			if segundos2 == -1:
				Audio.som_temp.stop()
				if get_tree().change_scene("res://Cenas/Cenas_da_resposta/tempo_esgotado.tscn") != OK:
					print("ERRO AO MUDAR CENA PARA TEMPO ESGOTADO") 			
	else:
		segundos1 -= 1
		tempo.set_text(str("Tempo restante: 0:", segundos1))
		if segundos1 <= 30:
			tempo.modulate = temporizador_quase_acabando
		if segundos1 < 10:	
				Audio.temporizador()
				tempo.set_text(str("Tempo restante: 0:0", segundos1))
				tempo.modulate = temporizador_acabou
		if segundos1 == -1:
			Audio.som_temp.stop()
			if get_tree().change_scene("res://Cenas/Cenas_da_resposta/tempo_esgotado.tscn") != OK:
				print("ERRO AO MUDAR CENA PARA TEMPO ESGOTADO") 
	
