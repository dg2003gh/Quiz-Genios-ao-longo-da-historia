extends CanvasLayer

func mudar_cena(target: String) -> void:
	$cor/animacao.play("transicao_in")
	yield($cor/animacao,"animation_finished")
	$cor/animacao.play("transicao_out")
	if get_tree().change_scene(target) != OK:
		print("UM ERRO OCORREU AO TENTAR MUDAR A CENA(TRANSIÇÃO)!!!")
	
func jogar_transicao(target: String) -> void:
	Audio.diminuir_volume()
	$cor/animacao.play("123transicao")
	yield($cor/animacao,"animation_finished")
	if get_tree().change_scene(target) != OK:
		print("UM ERRO OCORREU AO TENTAR MUDAR A CENA(TRANSIÇÃO)!!!")
	$cor/animacao.play("transicao_out_jogar")
	
