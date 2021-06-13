class_name Ability
extends Node2D

var damages : Array
var mana_cost : float
var cooldown : int
var turns_until_use : int

func cast(enemy):
	if enemy.has_method("take_damage"):
		for damage in damages:
			enemy.take_damage(damage)
			turns_until_use = cooldown


func avaible():
	if turns_until_use == 0:
		return true
	return false


func next_turn():
	turns_until_use = max(turns_until_use - 1, 0)
