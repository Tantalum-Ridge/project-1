extends Control

@onready var parallax_background: ParallaxBackground = $ParallaxBackground
@onready var parallax_layer: ParallaxLayer = $ParallaxBackground/ParallaxLayer

@onready var parallax_layer_2: ParallaxLayer = $ParallaxBackground/ParallaxLayer2
@onready var parallax_layer_3: ParallaxLayer = $ParallaxBackground/ParallaxLayer3
@onready var parallax_layer_4: ParallaxLayer = $ParallaxBackground/ParallaxLayer4

@onready var menu_options_container: VBoxContainer = $menuOption/VBoxContainer

var current_selection: int = 0
var default_color: Color = Color(1.0, 1.0, 0.627451, 1.0)
var hover_color: Color = Color(1.0, 1.0, 1.0, 1.0)

# Chargement de la police et du curseur
var menu_font = preload("res://assets/fonts/retganon.ttf")
var custom_cursor = preload("res://assets/sprites/ui/Sans titre.png")

func _ready() -> void:
	# Redimensionner l'image du curseur (48 pixels de haut pour être bien visible)
	var cursor_img = custom_cursor.get_image()
	var aspect = float(cursor_img.get_width()) / float(cursor_img.get_height())
	var target_height = 48
	var target_width = int(target_height * aspect)
	
	cursor_img.resize(target_width, target_height, Image.INTERPOLATE_BILINEAR)
	var scaled_cursor = ImageTexture.create_from_image(cursor_img)
	
	# Changer le curseur de la souris avec la nouvelle taille
	Input.set_custom_mouse_cursor(scaled_cursor)
	
	var options = menu_options_container.get_children()
	for i in range(options.size()):
		var label = options[i]
		label.mouse_filter = Control.MOUSE_FILTER_STOP
		label.mouse_entered.connect(_on_label_mouse_entered.bind(i))
		
		# Application de la police custom
		label.add_theme_font_override("font", menu_font)
		
		# Ajout d'une ombre pour mieux lire sur les backgrounds
		label.add_theme_color_override("font_shadow_color", Color(0, 0, 0, 0.8))
		label.add_theme_constant_override("shadow_offset_x", 2)
		label.add_theme_constant_override("shadow_offset_y", 2)
		
		# Fixer le pivot au centre gauche pour que le zoom se fasse vers la droite
		label.pivot_offset = Vector2(0, 16) 
	
	if options.size() > 0:
		set_selection(0)

func _on_label_mouse_entered(index: int) -> void:
	set_selection(index)

func _input(event: InputEvent) -> void:
	var options = menu_options_container.get_children()
	if options.size() == 0:
		return
		
	if event.is_action_pressed("ui_down"):
		set_selection((current_selection + 1) % options.size())
	elif event.is_action_pressed("ui_up"):
		set_selection((current_selection - 1 + options.size()) % options.size())

func set_selection(index: int) -> void:
	current_selection = index
	var options = menu_options_container.get_children()
	for i in range(options.size()):
		var label = options[i]
		if i == current_selection:
			label.add_theme_color_override("font_color", hover_color)
			# Animation de zoom pour l'option sélectionnée
			var tween = create_tween()
			tween.tween_property(label, "scale", Vector2(1.2, 1.2), 0.15).set_trans(Tween.TRANS_SINE)
		else:
			label.add_theme_color_override("font_color", default_color)
			# Retour à la normale
			var tween = create_tween()
			tween.tween_property(label, "scale", Vector2(1.0, 1.0), 0.15).set_trans(Tween.TRANS_SINE)

func _process(delta: float) -> void:
	parallax_background.scroll_offset -= Vector2(20.0 , 0.0) * delta
	parallax_layer.motion_scale = Vector2(0.3, 0.0)
	parallax_layer_2.motion_scale = Vector2(0.2, 0.0)
	parallax_layer_3.motion_scale = Vector2(0.4, 0.0)
	parallax_layer_4.motion_scale = Vector2(0.3, 0.0)
