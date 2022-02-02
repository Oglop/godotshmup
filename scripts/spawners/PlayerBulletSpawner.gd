extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	Events.connect("eFireRedWeapon", self, "_on_redBulletFire")
	Events.connect("eFireGreenWeapon", self, "_on_greenBulletFire")
	Events.connect("eFireRedSingleWeapon", self, "_on_redSingleBulletFire")

func _on_greenBulletFire():
	print_debug("fire green bullet")
	
	
func _on_redBulletFire():
	print_debug("fire red bullet")
	
func _on_redSingleBulletFire():
	print_debug("fire red signle")
