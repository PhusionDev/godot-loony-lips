extends Control


func _ready():
	var prompts = ["Yann", "banana", "tingly", "glorious"]
	var story = "Once upon a time someone called %s ate a %s flavored sandwich which made him feel all %s inside. It was a %s day."
	#print(story % prompts)
	#get_node("Label").text = "This is some text"
	$DisplayText.text = story % prompts
