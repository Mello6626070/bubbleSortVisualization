extends Control
var num_array: Array[int]
var steps_array: Array[Array]
var sortee = load("res://sortee.tscn")
var can_update: bool = true

@onready var sorteedisplay: HBoxContainer = $PanelContainer/VBoxContainer/MarginContainer/HBoxContainer/MarginContainer/sorteedisplay
@onready var arrayinput: LineEdit = $PanelContainer/VBoxContainer/BottomPanel/HBoxContainer/arrayinput
@onready var steps_list: TextEdit = $PanelContainer/VBoxContainer/MarginContainer/HBoxContainer/ScrollContainer/StepsList



func sort():
	var line = 0
	var n = num_array.size()
	var temp: int
	var swapped: bool 
	for i in range(0, n):
		swapped = false
		for j in range(0, n-i-1):
			if num_array[j] > num_array[j+1]:
				await get_tree().create_timer(1).timeout
				remove()
				update_screen(j)
				steps_list.insert_line_at(line, str(num_array))
				line+=1
				temp = num_array[j]
				num_array[j] = num_array[j+1]
				num_array[j+1] = temp
				swapped = true
		if swapped == false:
			break
	remove()
	update_screen(-1)
	steps_list.insert_line_at(line, str(num_array))

func remove():
	for child in sorteedisplay.get_children():
		child.queue_free()
	await get_tree().create_timer(0.1).timeout

func update_screen(i: int):
	for j in range(0, num_array.size()):
		var s = sortee.instantiate()
		s.value = num_array[j]
		if j == i:
			s.color = Color.GREEN
		if j == i+1:
			s.color = Color.GREEN
		if i == -1:
			s.color = Color.GREEN
		sorteedisplay.add_child(s)


func _on_sort_button_pressed() -> void:
	if steps_list.text != null:
		steps_list.clear()
	get_input()
	sort()


func get_input():
	var emptyarray: Array[int] = []
	num_array = emptyarray
	var text = arrayinput.text
	var text_array = text.split(",")
	for num in text_array:
		num_array.push_back(int(num))


func _on_exit_button_pressed() -> void:
	get_tree().quit()
