extends Control

@onready var label: Label = $Label
@onready var timer: Timer = $Timer

var message: Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().get_nodes_in_group("message").size() > 0:
		message = get_tree().get_first_node_in_group("message")
		var prefix: String = "[outgoing] "
		if message.incoming:
			prefix = "[incoming] "
		label.text = prefix + message.text
		message.queue_free()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("next") and label.visible:
		label.hide()
		var messages: Array[Node] = get_tree().get_nodes_in_group("message")
		if messages.size() > 0:
			message = get_tree().get_first_node_in_group("message")
			var prefix: String = "[outgoing] "
			if message.incoming:
				prefix = "[incoming] "
			label.text = prefix + message.text
			if message.delay_time > 0:
				timer.start(message.delay_time)
			else:
				label.show()
			message.queue_free()

func _on_timer_timeout() -> void:
	label.show()
