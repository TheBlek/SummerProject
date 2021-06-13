extends Node2D

var max_hp = 100
var _hp = max_hp
var _resistances : Array

func _ready():
	_resistances.resize(DamageType.get_count())
	for res in _resistances:
		res = 0


func take_damage(damage : Damage):
	var amount = damage.amount
	amount *= 1 - _resistances[damage.type] / 100
	_change_hp(-amount)


func heal(amount):
	_change_hp(amount)


func _change_hp(amount):
	_hp += amount
	if (_hp <= 0):
		_die()
	if (_hp > max_hp):
		_hp = max_hp


func _die():
	queue_free()
