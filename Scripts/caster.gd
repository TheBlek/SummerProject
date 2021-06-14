extends Node2D

export(NodePath) var enemy
export var abilities : Array
export var max_mana : int
onready var _mana = max_mana


func _ready():
	enemy = get_node(enemy)
	
	_parse_abilities()


func cast(ability):
	ability = abilities[ability]
	if not ability:
		return
	
	if ability.mana_cost < _mana and ability.avaible():
		_mana -= ability.mana_cost
		ability.cast(enemy)
	else:
		print("Not Sufficient Mana or Ability Is Still In Cooldown")


func restore_mana(amount):
	_mana = min(max_mana, _mana + amount)


func next_turn():
	for ability in abilities:
		ability.next_turn


func _parse_abilities():
	for i in range(abilities.size()):
		abilities[i] = get_node(abilities[i])
		if not abilities[i]:
			print("Path to ability was set incorrectly index: ", i)
