@tool
extends EditorPlugin

var button: Button

func _enter_tree():
	button = Button.new()
	button.text = "Copy UI Text"
	button.pressed.connect(_on_copy_button_pressed)
	add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, button)

func _exit_tree():
	remove_control_from_container(EditorPlugin.CONTAINER_TOOLBAR, button)
	if button:
		button.queue_free()

func collect_visible_editor_text() -> String:
	var output := []
	var root_control = get_editor_interface().get_base_control()
	_traverse_controls_for_ascii(root_control, output, 0)
	return "\n".join(output)

func _traverse_controls_for_ascii(control: Control, output: Array, depth: int):
	if not control.is_visible_in_tree():
		return

	var text := _get_control_text(control)
	var control_type = control.get_class()
	var prefix = "  ".repeat(depth)
	
	# Root level formatting
	if depth == 0:
		output.append("╔══════════════════════════╗")
		output.append("║       GODOT EDITOR       ║")
		output.append("╚══════════════════════════╝")
	
	# Control content
	if text != "":
		output.append("%s├─ [%s] %s" % [prefix, control_type, text])
	
	# Container formatting
	if control is PanelContainer:
		output.append("%s┌─── %s ──────────────────" % [prefix, control_type])
	elif control is TabContainer:
		output.append("%s├─ [TABS] %s" % [prefix, control.name if control.name else ""])

	# Process children
	for child in control.get_children():
		if child is Control:
			_traverse_controls_for_ascii(child, output, depth + 1)
	
	# Container closing
	if control is PanelContainer:
		output.append("%s└──────────────────────────" % prefix)

func _get_control_text(control: Control) -> String:
	if control is Button:
		return control.text.strip_edges()
	elif control is Label:
		return control.text.strip_edges()
	elif control is LineEdit:
		return control.text.strip_edges()
	elif control is Tree:
		return _get_tree_text(control)
	elif control is CheckBox:
		return control.text.strip_edges()
	# Skip text for container controls
	elif control is PanelContainer or control is TabContainer:
		return ""
	return ""

func _get_tree_text(tree: Tree) -> String:
	var items := []
	var root = tree.get_root()
	if not root:
		return ""
	
	var stack = [root]
	while not stack.is_empty():
		var item = stack.pop_back()
		for i in range(tree.get_columns()):
			var cell_text = item.get_text(i).strip_edges()
			if cell_text:
				items.append(cell_text)
		var child = item.get_first_child()
		while child:
			stack.append(child)
			child = child.get_next()
	return " > ".join(items)

func _on_copy_button_pressed():
	var text = collect_visible_editor_text()
	DisplayServer.clipboard_set(text)
	print("Text copied to clipboard with formatting!")
