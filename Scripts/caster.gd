class_name Caster
extends Node2D

signal ability_casted

var enemy
export var abilities : Array
export var max_mana : int
onready var _mana = max_mana


func _ready():
	_parse_abilities()


func cast(ability_index : int):
	var ability = _find_ability_by_index(ability_index)
	if not ability:
		return
	
	if ability.mana_cost < _mana and ability.avaible():
		_mana -= ability.mana_cost
		ability.cast(enemy)
		emit_signal("ability_casted")
	else:
		print("Not Sufficient Mana or Ability Is Still In Cooldown")


func restore_mana(amount):
	_mana = min(max_mana, _mana + amount)


func next_turn():
	for ability in abilities:
		ability.next_turn()


func set_enemy(e):
	enemy = e
	if enemy is NodePath:
		enemy = get_node(enemy)


func _parse_abilities():
	for i in range(abilities.size()):
		abilities[i] = get_node(abilities[i])
		if not abilities[i]:
			print("Path to ability was set incorrectly index: ", i, " I'm ", name)


func _find_ability_by_index(ability_index : int) -> Ability:
	for ability in abilities:
		if ability.id == ability_index:
			return ability
	print("Given ability is not aquired yet by ", name)
	return null
