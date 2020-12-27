extends Control


func _ready():
	var prompts = ["Yann", "banana", "tingly", "glorious"]
	var story = "Once upon a time someone called %s ate a %s flavored sandwich which made him feel all %s inside. It was a %s day."
	$VBoxContainer/DisplayText.text = story % prompts


func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)


func update_DisplayText(new_text):
	$VBoxContainer/DisplayText.text = new_text
	$VBoxContainer/PlayerText.clear()
