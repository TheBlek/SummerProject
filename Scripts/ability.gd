class_name Ability
extends Resource

enum Abilities{
	FireT2,
	ColdT2,
	LightningT2,
	FireT1,
	ColdT1,
	LightningT1,
	PhysicalT1,
	ChaosT1,
	Attack,
}

export(Abilities) var id
export(Array, Resource) var damages 
export var mana_cost : float
export var cooldown : int
export var critical_strike_chance : int
export var critical_strike_multiplier : float

var _turns_until_use : int

func cast(enemy):
	if not enemy.has_method("take_damage"):
		return
	
	print("Casting ", id)
	randomize()
	var multi = 100.0
	if rand_range(0, 100) < critical_strike_chance:
		multi = critical_strike_multiplier
		print("Critical strike!")
	
	multi /= 100
	for damage in damages:
		damage.amount *= multi
		enemy.take_damage(damage)
		_turns_until_use = cooldown


func avaible() -> bool:
	if _turns_until_use == 0:
		return true
	return false


func next_turn():
	_turns_until_use = max(_turns_until_use - 1, 0)
