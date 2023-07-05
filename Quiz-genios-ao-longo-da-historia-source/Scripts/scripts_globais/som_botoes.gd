extends Node

func _ready():
	self.connect("pressed", Callable(self, "_tocar_som_botoes")) # não consegui achar um lugar que me diga como usar a namestring de uma função de um autoload. :( se achar, é só mandar pull. 
	
func _tocar_som_botoes():
	Audio._tocar_som_botoes()
	
