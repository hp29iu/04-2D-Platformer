extends KinematicBody2D

export var score = 20
var speed = 0.5
export var damage = 10
var direction = -1
var velocity = Vector2()

func _ready():
	if direction < 0:
		$AnimatedSprite.flip_h = true
	if direction > 0:
		$AnimatedSprite.flip_h = false
		
func _physics_process(delta):
	velocity.x += direction * speed
	move_and_slide(velocity, Vector2.UP)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Platform" or collision.collider.name == "Ground" or collision.collider.name == "Enemy":
			velocity.x = 0
			direction *= -1
			$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		if collision.collider.name == "Player":
			collision.collider.do_damage(damage)

func _on_top_checker2_body_entered(body):
	speed = 0
	velocity = Vector2.ZERO
	$AnimatedSprite.play("ZombieDie")
	if body.name == "Player":
		Global.increase_score(score)
