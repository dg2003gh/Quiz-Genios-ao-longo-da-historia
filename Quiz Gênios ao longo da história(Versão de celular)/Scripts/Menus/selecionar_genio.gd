extends Control

onready var animacao := $animacao
onready var foto_caixa_de_dialogo = $"Caixa de diálogo/genio"

var Genio1 = preload("res://recursos/Imagens/Albert Einstein(Caixa de Diálogo).png")
var Genio2 = preload("res://recursos/Imagens/Alan Turing(Caixa de Diálogo).png") 
var Genio3 = preload("res://recursos/Imagens/Santos Dumont(Caixa de Diálogo).png")
var Genio4 = preload("res://recursos/Imagens/Charles_Darwin(Caixa de Diálogo).png") 
var Genio5 = preload("res://recursos/Imagens/Galileu_Galilei(Caixa de Diálogo).png") 
var Genio6 = preload("res://recursos/Imagens/Graham bell(Caixa de Diálogo).png") 
var Genio7 = preload("res://recursos/Imagens/Issac_Newton(Caixa de Diálogo).png") 
var Genio8 = preload("res://recursos/Imagens/Nikola Tesla(Caixa de Diálogo).png") 
var Genio9 = preload("res://recursos/Imagens/Leonardo_Da_Vinci(Caixa de Diálogo).png") 
var Genio10 = preload("res://recursos/Imagens/Thomas Edison(Caixa de Diálogo).png") 

func _ready():
	
	alterar_foto()	
	animacoes()	
#---------------------------======---------------------------
		
func alterar_foto():
	var Genios_fotos = [Genio1, Genio2, Genio3, Genio4, Genio5, Genio6, Genio7, Genio8, Genio9, Genio10]
	for foto in Genios_fotos:
		randomize()
		Genios_fotos.shuffle()
		foto_caixa_de_dialogo.texture = foto
		
			
#---------------------------======---------------------------			
func animacoes():
		animacao.play("animacao_botoes_texto")
	
#---------------------------======---------------------------

#LISTA DE GÊNIOS

func _on_turing_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Lista_de_genios/Alan_Turing/Cena_Turing.tscn")
	
func _on_einstein_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Lista_de_genios/Albert_Einstein/Cena_Einstein.tscn")

func _on_darwin_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Lista_de_genios/Charles_Darwin/Cena_Darwin.tscn")

func _on_galileu_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Lista_de_genios/Galileu_Galilei/Cena_Galilei.tscn")
			
func _on_bell_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Lista_de_genios/Graham_Bell/Cena_Bell.tscn") 

func _on_newton_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Lista_de_genios/Issac_Newton/Cena_Newton.tscn")

func _on_vinci_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Lista_de_genios/Leonardo_Davinci/Cena_Davinci.tscn")
	
func _on_dumont_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Lista_de_genios/Santos_Dumont/Cena_Dumont.tscn") 
	
func _on_tesla_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Lista_de_genios/Nikola_Tesla/Cena_Tesla.tscn")
	
func _on_edison_pressed():
	Audio.som_botao()
	Transicao.jogar_transicao("res://Cenas/Lista_de_genios/Thomas_Edison/Cena_Edison.tscn")
	
#---------------------------======---------------------------

func _on_voltar_pressed():
	Audio.som_botao()
	Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
	
