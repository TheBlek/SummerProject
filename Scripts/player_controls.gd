extends Node2D

export(NodePath) var caster

func _ready():
	caster = get_node(caster)


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and not event.echo:
				if event.scancode == KEY_1:
					caster.cast(Ability.Abilities.FireT2)
				if event.scancode == KEY_2:
					caster.cast(Ability.Abilities.ColdT2)
				if event.scancode == KEY_3:
					caster.cast(Ability.Abilities.LightningT2)
				if event.scancode == KEY_4:
					caster.cast(Ability.Abilities.FireT1)
				if event.scancode == KEY_5:
					caster.cast(Ability.Abilities.ColdT1)
				if event.scancode == KEY_6:
					caster.cast(Ability.Abilities.LightningT1)
				if event.scancode == KEY_7:
					caster.cast(Ability.Abilities.PhysicalT1)
				if event.scancode == KEY_8:
					caster.cast(Ability.Abilities.ChaosT1)


func set_enemy(e):
	caster.set_enemy(e)
