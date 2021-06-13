class_name DamageType

const FIRE = 0
const COLD = 1
const LIGHTNING = 2
const PHYSICAL = 3
const CHAOS = 4

enum DamageTypes {
	FIRE,
	COLD,
	LIGHTNING,
	PHYSICAL,
	CHAOS,
}

static func get_count():
	var count = 0
	for type in DamageTypes:
		count += 1
	return count
