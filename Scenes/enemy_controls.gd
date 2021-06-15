extends Node2D

export(NodePath) var caster

func _ready():
	caster = get_node(caster)
	set_process(false)


func _process(delta):
	caster.cast(Ability.Abilities.Attack)


func set_player(p):
	caster.set_enemy(p)
