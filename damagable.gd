extends Node2D

var max_hp = 100
var _hp = max_hp

func take_damage(amount):
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

