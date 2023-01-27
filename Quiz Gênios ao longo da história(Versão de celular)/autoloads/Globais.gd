extends Node

var salvar = Salvar.new()
var cena_anterior: String
var pontos: int 
var modo_de_jogo: int
var musica: int = salvar.musica 
var sons: int = salvar.sons

func _ready():
	salvar.musica = musica
	salvar.sons = sons
	
	ResourceSaver.save("user://dados.tres", salvar)
	
