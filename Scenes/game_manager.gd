extends Node2D

export(NodePath) var player
export(NodePath) var player_controls
export(NodePath) var enemy
export(NodePath) var enemy_controls

var is_player_turn = true

func _ready():
	player_controls = get_node(player_controls)
	enemy_controls = get_node(enemy_controls)
	player_controls.set_enemy(NodePath("../../" + enemy))
	enemy_controls.set_player(NodePath("../../" + player))


func _process(_delta):
	if player_controls.caster is Node2D and enemy_controls.caster is Node2D:
		connect_turns()
		set_process(false)


func connect_turns():
	player_controls.caster.connect("ability_casted", self, "change_turn")
	enemy_controls.caster.connect("ability_casted", self, "change_turn")


func change_turn():
	is_player_turn = not is_player_turn
	player_controls.set_process_unhandled_input(not player_controls.is_processing_unhandled_input())
	enemy_controls.set_process(not enemy_controls.is_processing())
	
	if is_player_turn:
		player_controls.caster.next_turn()
	else:
		enemy_controls.caster.next_turn()
