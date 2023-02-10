extends CanvasLayer

func mudar_cena(target: String) -> void:
	$cor/AnimationPlayer.play("transicao_in")
	yield($cor/AnimationPlayer,"animation_finished")
	$cor/AnimationPlayer.play("transicao_out")
	if get_tree().change_scene(target) != OK:
		print("UM ERRO OCORREU AO TENTAR MUDAR A CENA(TRANSIÇÃO)!!!")
	
func jogar_transicao(target: String) -> void:
	Audio.diminuir_volume()
	$cor/AnimationPlayer.play("123transicao")
	yield($cor/AnimationPlayer,"animation_finished")
	Audio.tocarMusica.stop()
	if get_tree().change_scene(target) != OK:
		print("UM ERRO OCORREU AO TENTAR MUDAR A CENA(TRANSIÇÃO)!!!")
	$cor/AnimationPlayer.play("transicao_out_jogar")
	
