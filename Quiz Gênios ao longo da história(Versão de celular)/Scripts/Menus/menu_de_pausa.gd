extends CanvasLayer
	
onready var animacao := $animacao
	
func _process(_delta):
	if Input.is_action_pressed("pausar") && self.visible == false:
		$"som_botão".play()
		animacao.play("animacao_botoes")
		get_tree().paused = true 
		self.visible = true
	else: 
		return
				
#---------------------------======---------------------------

func _on_voltar_ao_jogo_pressed():
	Audio.som_botao()
	if get_tree().paused == true && self.visible == true: 
	   get_tree().paused = false
	   self.visible = false
	else:
		return
#---------------------------======---------------------------

func _on_voltar_menu_pressed():
	Audio.som_botao()
	if get_tree().paused == true:
		get_tree().paused = false
		Transicao.mudar_cena("res://Cenas/Menus/Menu.tscn")
		Audio.tocar_musica()
	else:
		return
