extends Node

var genio: String
var cena_anterior: String
var modo_de_jogo: int = 1
var pontos: int = 0

func alterar_foto(foto_caixa_de_dialogo: Sprite2D):
	var genios_fotos : Array[CompressedTexture2D] = [ preload("res://assets/Imagens/Albert Einstein(Caixa de Diálogo).png"),
								preload("res://assets/Imagens/Alan Turing(Caixa de Diálogo).png"),
								preload("res://assets/Imagens/Santos Dumont(Caixa de Diálogo).png"),
								preload("res://assets/Imagens/Charles_Darwin(Caixa de Diálogo).png"), 
								preload("res://assets/Imagens/Galileu_Galilei(Caixa de Diálogo).png"), 
								preload("res://assets/Imagens/Graham bell(Caixa de Diálogo).png"), 
								preload("res://assets/Imagens/Issac_Newton(Caixa de Diálogo).png"), 
								preload("res://assets/Imagens/Nikola Tesla(Caixa de Diálogo).png"), 
								preload("res://assets/Imagens/Leonardo_Da_Vinci(Caixa de Diálogo).png"), 
								preload("res://assets/Imagens/Thomas Edison(Caixa de Diálogo).png") 
								] 
	
	for foto in genios_fotos:
		randomize()
		genios_fotos.shuffle()
		foto_caixa_de_dialogo.texture = foto

func executar_pdf():
	var source: String = "res://pdf/almanaque.pdf"
	var destino: String = ProjectSettings.globalize_path("user://almanaque.pdf")
	var dir: DirAccess = DirAccess.open("user://")
	
	if(!dir.file_exists(destino)):
		dir.copy(source, destino)
	else:
		print(destino, " Já existe!")
	OS.shell_open(destino)

		
