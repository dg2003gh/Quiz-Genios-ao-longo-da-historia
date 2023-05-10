extends CanvasLayer

@onready var animacao: Node = $cor/animacao

func mudar_cena(target: String) -> void:
	animacao.play("transicao_mudar_cena")
	await animacao.animation_finished
	animacao.play_backwards("transicao_mudar_cena")
	if get_tree().change_scene_to_file(target) != OK:
		print("UM ERRO OCORREU AO TENTAR MUDAR A CENA(TRANSIÇÃO)!!!")
	
func jogar_transicao(target: String) -> void:
	Audio.diminuir_volume()
	Audio.tocarMusica.stop()
	animacao.play("transicao_contagem_regressiva")
	await  get_tree().create_timer(3.4).timeout
	if get_tree().change_scene_to_file(target) != OK:
		print("UM ERRO OCORREU AO TENTAR MUDAR A CENA(TRANSIÇÃO)!!!")
