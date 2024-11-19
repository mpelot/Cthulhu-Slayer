extends Area2D

@onready var cthulhu_chess: CthulhuChessPiece = $".."

func _on_body_entered(body):
	if(body is Cthulhu):
		return
	if(body is Player):
		var damage : Damagable = Damagable.new(20, cthulhu_chess)
		body.receive_damage(damage)
	elif(body is Entity):
		var damage : Damagable = Damagable.new(2000, cthulhu_chess)
		body.receive_damage(damage)
