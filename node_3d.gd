extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Walking/AnimationPlayer.play("walk")
	$Walking2/AnimationPlayer.play("run")
	$Walking3/AnimationPlayer.play("die")
	$Punching/AnimationPlayer.play("punch")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
