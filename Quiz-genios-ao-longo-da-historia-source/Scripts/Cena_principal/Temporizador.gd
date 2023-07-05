extends RichTextLabel

var segundos: int

func _ready():
	verificar_modo()
		
func _physics_process(_delta):
	self.bbcode_enabled = true
	
	if Globais.modo_de_jogo == 4:
		self.set_text(str("[color=#19dc00] Tempo restante[/color]: [color=1ccd04]∞"))
	else: 			
		self.set_text(str("[color=#19dc00] Tempo restante[/color]:  0:", segundos)) 
		if segundos <= 15:
			self.set_text(str("[color=#19dc00] Tempo restante[/color]:  [color=#e8c001]0:", segundos))
		if segundos < 10:
			self.set_text(str("[color=#19dc00] Tempo restante[/color]:  [color=c90000]0:0", segundos))
		if segundos == -1:
			if get_tree().change_scene_to_file("res://Cenas/Cenas_da_resposta/tempo_esgotado.tscn") != OK:
				print("ERRO AO MUDAR CENA PARA TEMPO ESGOTADO")	

func _on_timer_timeout():
	await get_tree().create_timer(1.0).timeout
	segundos -= 1
	
func tocar_temporizador():
	Audio.player_temporizador.stream = preload("res://assets/Audios/Sons/Temporizador.ogg")
	while segundos > 0:
		await get_tree().create_timer(0.93).timeout
		if !get_tree().paused:
			Audio.player_temporizador.playing = !Audio.player_temporizador.playing

func verificar_modo():
	match Globais.modo_de_jogo:
		2:
			segundos = 50
		3:
			segundos = 30
		4:
			segundos = 0
		_:
			segundos = 60
	if Globais.modo_de_jogo == 4:
		return
	else:
		tocar_temporizador()
