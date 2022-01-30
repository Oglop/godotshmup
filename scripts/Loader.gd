extends Node

onready var _playerRedBullet = preload("res://scenes/Player/PlayerRedBullet.tscn")
onready var _playerGreenBullet = preload("res://scenes/Player/PlayerGreenBullet.tscn")
onready var _enemyBulletSmall = preload("res://scenes/Enemy/EnemySmallBullet.tscn" )

func getScene(object: int): 
	if object == Data.OBJECTS.PLAYER_RED_BULLET:
		return _playerRedBullet.instance()
	elif object == Data.OBJECTS.PLAYER_GREEN_BULLET:
		return _playerGreenBullet.instance()
	elif object == Data.OBJECTS.ENEMY_BULLET_SMALL:
		return _enemyBulletSmall.instance()
