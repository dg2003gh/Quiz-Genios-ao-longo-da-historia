extends CanvasLayer

@onready var animacao: Node = $cor/animacao

func mudar_cena(cena: String) -> void:
	animacao.play("transicao_mudar_cena")
	Audio.tocar_sons("res://assets/Audios/Sons/transicao.ogg")
	await animacao.animation_finished
	animacao.play_backwards("transicao_mudar_cena")
	if get_tree().change_scene_to_file(cena) != OK:
		print("UM ERRO OCORREU AO TENTAR MUDAR A CENA(TRANSIÇÃO)!!!")
	
func jogar_transicao(cena: String, isTentar: bool) -> void:
	if !isTentar:
		Audio.animar_audio()
	animacao.play("transicao_contagem_regressiva")
	Audio.tocar_sons("res://assets/Audios/Sons/transicao_jogar.ogg")
	await  get_tree().create_timer(3.4).timeout
	if get_tree().change_scene_to_file(cena) != OK:
		print("UM ERRO OCORREU AO TENTAR MUDAR A CENA(TRANSIÇÃO)!!!")
