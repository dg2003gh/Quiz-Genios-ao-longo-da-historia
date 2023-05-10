extends RichTextLabel
	
var segundos = 61 

func _ready():
	if (Globais.modo_de_jogo == 2):
		segundos = 51
	if (Globais.modo_de_jogo == 3):
		segundos = 31
			
func _physics_process(_delta):
	self.bbcode_enabled = true
	if Globais.modo_de_jogo == 4:
		self.set_text(str("[color=#19dc00] Tempo restante[/color]: [color=1ccd04]∞"))
	else: 
		self.set_text(str("[color=#19dc00] Tempo restante[/color]:  0:", segundos)) 
		if segundos <= 15:
			self.set_text(str("[color=#19dc00] Tempo restante[/color]:  [color=#e8c001]0:", segundos))
		if segundos < 10:
			Audio.temporizador()
			self.set_text(str("[color=#19dc00] Tempo restante[/color]:  [color=c90000]0:0", segundos))
		if segundos == -1:
			Audio.tempNode.stop()
			if get_tree().change_scene_to_file("res://Cenas/Cenas_da_resposta/tempo_esgotado.tscn") != OK:
				print("ERRO AO MUDAR CENA PARA TEMPO ESGOTADO")	
				

func _on_timer_timeout():
	segundos -= 1
	
