extends Node2D

var max_hp = 100
var _hp = max_hp
onready var _resistances : Array

func _ready():
	_resistances.resize(DamageType.get_count())
	for i in range(_resistances.size()):
		_resistances[i] = 20
	print("Prepared damagable at " + name)


func take_damage(damage : Damage):
	var amount = damage.amount * (1 - float(_resistances[damage.type]) / 100)
	_change_hp(-amount)


func heal(amount):
	_change_hp(amount)


func _change_hp(amount):
	var last_hp = _hp
	_hp += amount
	_hp = max(_hp, 0)
	_hp = min(_hp, max_hp)
	print(name, " hp changed from ", last_hp, " to ", _hp)
	if (_hp == 0):
		_die()


func _die():
	print(name, " now is dead")
	queue_free()
