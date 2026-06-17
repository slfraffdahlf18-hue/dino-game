extends Control


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://mainmenu.tscn")

func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://ControlUIMenu.tscn")

func _on_instagram_button_pressed() -> void:
	OS.shell_open("https://www.instagram.com/dfrythartz?igsh=NXVhc2VqZXNzMW42")
