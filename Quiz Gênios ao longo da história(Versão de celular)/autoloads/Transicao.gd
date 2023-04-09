extends CanvasLayer

func mudar_cena(target: String) -> void:
	$cor/animacao.play("transicao_in")
	await $cor/animacao.animation_finished
	$cor/animacao.play("transicao_out")
	if get_tree().change_scene_to_file(target) != OK:
		print("UM ERRO OCORREU AO TENTAR MUDAR A CENA(TRANSIÇÃO)!!!")
	
func jogar_transicao(target: String) -> void:
	Audio.diminuir_volume()
	$cor/animacao.play("transicao_contagem_regressiva")
	await $cor/animacao.animation_finished
	if get_tree().change_scene_to_file(target) != OK:
		print("UM ERRO OCORREU AO TENTAR MUDAR A CENA(TRANSIÇÃO)!!!")
	$cor/animacao.play("transicao_out_jogar")
	
