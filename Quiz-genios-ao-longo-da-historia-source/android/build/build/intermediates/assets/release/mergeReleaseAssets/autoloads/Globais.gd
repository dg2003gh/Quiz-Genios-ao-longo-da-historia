extends Node

var genio: String
var cena_anterior: String
var modo_de_jogo: int = 1
var pontos: int = 0
var musica: bool = true
var sons: bool = true
var aceito: bool = false

var config: Object = ConfigFile.new()

const caminho: String = "user://configuracoes_do_usuario.cfg"

func _ready():
	carregar_configuracoes_do_usuario()
	
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

func salvar_configuracoes_do_usuario():
	var err = config.save(caminho)
	
	if err != OK:
		print("ERRO AO SALVAR!!! VERIFIQUE O AUTOLOAD 'Globais.gd'.")
		return
		
	config.set_value("usuarios", "termos_aceitos", aceito)
	config.set_value("usuarios", "musica", musica)
	config.set_value("usuarios", "sons", sons)
	
func carregar_configuracoes_do_usuario():
	var err = config.load(caminho)
	
	if err != OK:
		salvar_configuracoes_do_usuario()
		
	aceito = config.get_value("usuarios", "termos_aceitos")
	musica = config.get_value("usuarios", "musica")
	sons = config.get_value("usuarios", "sons")
