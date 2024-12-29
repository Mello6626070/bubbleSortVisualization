extends MarginContainer
@onready var progress_bar: ProgressBar = $VBoxContainer/ProgressBar
@onready var sorteevalue: Label = $VBoxContainer/sorteevalue

@export var value: int
var color: Color = Color.WHITE

func _ready() -> void:
	progress_bar.value = value
	progress_bar.self_modulate = color
	sorteevalue.text = str(value)
