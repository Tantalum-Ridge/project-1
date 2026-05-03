extends CharacterBody2D

# --- Constantes ---
const SPEED = 400.0

# --- États du personnage ---
enum State { IDLE, RUN, ATTACK }

# --- Variables d'état ---
var current_state: State = State.IDLE
var look_direction: Vector2 = Vector2.DOWN # Direction par défaut

# --- Nœuds ---
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	# Connexion du signal pour détecter la fin des animations (utile pour l'attaque)
	animated_sprite.animation_finished.connect(_on_animation_finished)

func _physics_process(delta: float) -> void:
	# L'arbre de décision principal (State Machine)
	match current_state:
		State.IDLE:
			idle_state(delta)
		State.RUN:
			run_state(delta)
		State.ATTACK:
			attack_state(delta)

# --- Logique des États ---

func idle_state(_delta: float) -> void:
	var input = get_input_direction()
	
	if input != Vector2.ZERO:
		transition_to(State.RUN)
		return
		
	if Input.is_action_just_pressed("attack"):
		transition_to(State.ATTACK)
		return
	
	velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	play_directional_anim("idle")
	move_and_slide()

func run_state(_delta: float) -> void:
	var input = get_input_direction()
	
	if input == Vector2.ZERO:
		transition_to(State.IDLE)
		return
		
	if Input.is_action_just_pressed("attack"):
		transition_to(State.ATTACK)
		return
	
	# Mise à jour de la direction de regard
	look_direction = input
	velocity = input * SPEED
	play_directional_anim("run")
	move_and_slide()

func attack_state(_delta: float) -> void:
	velocity = Vector2.ZERO # Immobilise le perso pendant l'attaque
	play_directional_anim("attack1")

# --- Fonctions Utilitaires ---

func transition_to(new_state: State) -> void:
	current_state = new_state

func get_input_direction() -> Vector2:
	var dir = Input.get_vector("left", "right", "up", "down")
	return dir.normalized()

func play_directional_anim(anim_name: String) -> void:
	var dir_str = get_direction_string(look_direction)
	animated_sprite.play(anim_name + "_" + dir_str)

func get_direction_string(dir: Vector2) -> String:
	# Logique pour choisir la direction la plus proche (Haut, Bas, Gauche, Droite)
	if abs(dir.x) > abs(dir.y):
		return "left" if dir.x < 0 else "right"
	else:
		return "up" if dir.y < 0 else "down"

func _on_animation_finished() -> void:
	# Quand l'attaque est finie, on repasse en Idle
	if current_state == State.ATTACK:
		transition_to(State.IDLE)
