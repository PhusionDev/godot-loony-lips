extends Control

var player_words = []

var template = [
	{
		"prompts": ["a name", "a noun", "an adverb", "an adjective"],
		"story": "Once upon a time someone called %s ate a %s flavored sandwich which made him feel all %s inside. It was a %s day."
	},
	{
		"prompts": ["a name", "another name", "an adjective", "a place"],
		"story": "%s was hanging out with %s when all of a sudden a %s rabbit appeared out from %s"
	}
	]
var current_story = {}

onready var DisplayText = $VBoxContainer/DisplayText
onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var GameButtonLabel = $VBoxContainer/HBoxContainer/TextureButton/Label

func _ready():
	set_current_story()
	GameButtonLabel.get_font("font").size = 40
	DisplayText.text = "Welcome to Loony Lips! We're going to tell a story and have a wonderful time! "
	PlayerText.grab_focus()
	check_player_words_length()

func set_current_story():
	randomize()
	var stories = $StoryBook.get_child_count()
	var selected_story = randi() % stories
	current_story.prompts = $StoryBook.get_child(selected_story).prompts
	current_story.story = $StoryBook.get_child(selected_story).story
	#current_story = template[randi() % template.size()]
	
func _on_PlayerText_text_entered(new_text):
	add_to_player_words()

func _on_TextureButton_pressed():
	if is_story_done():
		# reload scene
		get_tree().reload_current_scene()
	else:
		add_to_player_words()

func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()

func is_story_done():
	return player_words.size() == current_story.prompts.size()

func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()

func tell_story():
	DisplayText.text = current_story.story % player_words

func prompt_player():
	DisplayText.text += "May I have " + current_story.prompts[player_words.size()] + " please?"

func end_game():
	PlayerText.queue_free()
	change_button_text()
	tell_story()

func change_button_text():
	GameButtonLabel.get_font("font").size = 20
	GameButtonLabel.text = "new"
