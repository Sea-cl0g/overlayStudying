extends Control

#----------------------------------------------------------------------------------------------------
@onready var r_slider = $VBoxContainer/HBoxContainer/Hslider_r
@onready var g_slider = $VBoxContainer/HBoxContainer2/Hslider_g
@onready var b_slider = $VBoxContainer/HBoxContainer3/Hslider_b
@onready var a_slider = $VBoxContainer/HBoxContainer4/HSlider_a

@onready var r_lineedit = $VBoxContainer/HBoxContainer/LineEdit_r
@onready var g_lineedit = $VBoxContainer/HBoxContainer2/LineEdit_g
@onready var b_lineedit = $VBoxContainer/HBoxContainer3/LineEdit_b
@onready var a_lineedit = $VBoxContainer/HBoxContainer4/LineEdit_a

@onready var preview = $VBoxContainer/Panel
@onready var sheet = $"../ColorRect"

var sheet_col: Color = Color(255, 0, 0, 125)

#----------------------------------------------------------------------------------------------------
func _ready():
	r_slider.value = sheet_col.r
	g_slider.value = sheet_col.g
	g_slider.value = sheet_col.b
	a_slider.value = sheet_col.a
	
	r_lineedit.text = str(sheet_col.r)
	g_lineedit.text = str(sheet_col.g)
	b_lineedit.text = str(sheet_col.b)
	a_lineedit.text = str(sheet_col.a)
	
	set_col(sheet_col.r, sheet_col.g, sheet_col.b, sheet_col.a)

#----------------------------------------------------------------------------------------------------
# R
func _on_hslider_r_value_changed(value):
	sheet_col.r = r_slider.value
	r_lineedit.text = str(sheet_col.r)
	set_col(sheet_col.r, sheet_col.g, sheet_col.b, sheet_col.a)

func _on_line_edit_r_text_changed(new_text):
	sheet_col.r = r_lineedit.text.to_int()
	r_slider.value = sheet_col.r
	r_lineedit.caret_column = r_lineedit.text.length()
	set_col(sheet_col.r, sheet_col.g, sheet_col.b, sheet_col.a)

# G
func _on_hslider_g_value_changed(value):
	sheet_col.g = g_slider.value
	g_lineedit.text = str(sheet_col.g)
	set_col(sheet_col.r, sheet_col.g, sheet_col.b, sheet_col.a)

func _on_line_edit_g_text_changed(new_text):
	sheet_col.g = g_lineedit.text.to_int()
	g_slider.value = sheet_col.g
	g_lineedit.caret_column = g_lineedit.text.length()
	set_col(sheet_col.r, sheet_col.g, sheet_col.b, sheet_col.a)

# B
func _on_hslider_b_value_changed(value):
	sheet_col.b = b_slider.value
	b_lineedit.text = str(sheet_col.b)
	set_col(sheet_col.r, sheet_col.g, sheet_col.b, sheet_col.a)

func _on_line_edit_b_text_changed(new_text):
	sheet_col.b = b_lineedit.text.to_int()
	b_slider.value = sheet_col.b
	b_lineedit.caret_column = b_lineedit.text.length()
	set_col(sheet_col.r, sheet_col.g, sheet_col.b, sheet_col.a)

# A
func _on_h_slider_a_value_changed(value):
	sheet_col.a = a_slider.value
	a_lineedit.text = str(sheet_col.a)
	set_col(sheet_col.r, sheet_col.g, sheet_col.b, sheet_col.a)

func _on_line_edit_a_text_changed(new_text):
	sheet_col.a = a_lineedit.text.to_int()
	a_slider.value = sheet_col.a
	a_lineedit.caret_column = a_lineedit.text.length()
	set_col(sheet_col.r, sheet_col.g, sheet_col.b, sheet_col.a)

func set_col(r: float, g: float, b: float, a: float):
	print_debug(sheet_col)
	r = r / 255
	g = g / 255
	b = b / 255
	a = a / 255
	preview.color = Color(r, g, b, a)
	sheet.color = Color(r, g, b, a)
