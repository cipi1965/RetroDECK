extends Control

func _ready():
	var children = findElements(self, "Control")
	for n: Control in children: #iterate the children to grab focus on mouse hov
		if (n.focus_mode == FOCUS_ALL):
			n.mouse_entered.connect(_on_control_mouse_entered.bind(n))

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func findElements(node: Node, className: String, result: Array = []) -> Array:
	if node.is_class(className):
		result.push_back(node)
	for child in node.get_children():
		result = findElements(child, className, result)
	return result

func _on_control_mouse_entered(control: Node):
	control.grab_focus()


func _on_quickresume_advanced_pressed():
	var popup = load("res://components/popup.tscn").instantiate() as Control
	popup.set_content("res://popup_content_test.tscn")
	$Background.add_child(popup)