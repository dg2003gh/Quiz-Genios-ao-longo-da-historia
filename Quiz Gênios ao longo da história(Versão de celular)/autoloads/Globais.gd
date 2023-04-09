extends Node

var genio: String
var cena_anterior: String
var modo_de_jogo: int = 4
var pontos: int 

func alterar_foto(foto_caixa_de_dialogo):
	var genios_fotos : Array = [ preload("res://recursos/Imagens/Albert Einstein(Caixa de Diálogo).png"),
								preload("res://recursos/Imagens/Alan Turing(Caixa de Diálogo).png"),
								preload("res://recursos/Imagens/Santos Dumont(Caixa de Diálogo).png"),
								preload("res://recursos/Imagens/Charles_Darwin(Caixa de Diálogo).png"), 
								preload("res://recursos/Imagens/Galileu_Galilei(Caixa de Diálogo).png"), 
								preload("res://recursos/Imagens/Graham bell(Caixa de Diálogo).png"), 
								preload("res://recursos/Imagens/Issac_Newton(Caixa de Diálogo).png"), 
								preload("res://recursos/Imagens/Nikola Tesla(Caixa de Diálogo).png"), 
								preload("res://recursos/Imagens/Leonardo_Da_Vinci(Caixa de Diálogo).png"), 
								preload("res://recursos/Imagens/Thomas Edison(Caixa de Diálogo).png") 
								] 
	
	for foto in genios_fotos:
		randomize()
		genios_fotos.shuffle()
		foto_caixa_de_dialogo.texture = foto
