extends Node

#----------------------------------------------------------------------------------------------------
@onready var background = $ColorRect
@onready var colButton = $Button
@onready var colEditor = $ColorEditor

const button_space_left = 10
const button_space_bottom = 50

var default_window_size: Vector2i

var editor_mode: bool = false

#----------------------------------------------------------------------------------------------------
func _ready():
	get_tree().get_root().size_changed.connect(Callable(self, "_on_screen_resized"))
	default_window_size = DisplayServer.window_get_size()
	colEditor.visible = false

#----------------------------------------------------------------------------------------------------
# colorEditorを開く
func _on_button_pressed():
	open_and_close_colEditor()

func _unhandled_input(event):
	if Input.is_action_pressed("OPEN_AND_CLOSE_COLOREDITOR"):
		open_and_close_colEditor()

func open_and_close_colEditor():
	colEditor.visible = !colEditor.visible
	
#----------------------------------------------------------------------------------------------------
# 画面の大きさが変更されたときの処理
func _on_screen_resized():
	var new_window_size = DisplayServer.window_get_size()
	background.size = new_window_size
	
	var editor_scale: float = min(new_window_size.x * 100 / default_window_size.x, new_window_size.y * 100 / default_window_size.y) / 100.0
	colEditor.scale = Vector2(editor_scale, editor_scale)
	var offset_x = colEditor.size.x * editor_scale * -1 / 2
	var offset_y = colEditor.size.y * editor_scale * -1 / 2
	colEditor.offset_left = offset_x
	colEditor.offset_top = offset_y
	colEditor.offset_right = offset_x
	colEditor.offset_bottom = offset_y
	
	colButton.position.x = button_space_left
	colButton.position.y = new_window_size.y - button_space_bottom
	colButton.size = Vector2i(400, 400)
