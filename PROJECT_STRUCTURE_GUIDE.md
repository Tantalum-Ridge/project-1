# 🏗️ Guide de Réplication de Structure de Projet (Godot 4)

Ce document est destiné à être fourni à une IA pour qu'elle puisse appliquer la structure professionnelle de ce projet à un autre projet Godot.

---

## 📂 Hiérarchie des Dossiers

L'objectif est de séparer strictement les fichiers de données (`.tscn`, `.res`), les scripts (`.gd`) et les ressources brutes (`.png`, `.wav`).

```text
/
├── assets/                 # Ressources brutes (non-Godot natives importées)
│   ├── audio/              # Musiques (.ogg) et SFX (.wav)
│   ├── fonts/              # Polices de caractères (.ttf, .otf)
│   ├── sprites/            # Images, textures, feuilles de sprites (.png)
│   └── tilesets/           # Données de tilesets brutes
│
├── config/                 # Fichiers de configuration statiques (JSON, CFG)
│
├── resources/              # Fichiers de données Godot (Scènes et Ressources)
│   └── scenes/             # Toutes les scènes (.tscn)
│       ├── characters/     # Joueur, ennemis, NPCs
│       ├── levels/         # Maps, donjons, zones
│       ├── objects/        # Objets interactifs, items au sol
│       ├── tiles/          # Scènes de tilesets / TileMaps
│       └── ui/             # Menus, HUD, inventaire
│
├── scripts/                # Toute la logique GDScript (.gd)
│   ├── autoload/           # Singletons (ex: GameState.gd, AudioPlayer.gd)
│   ├── components/         # Scripts réutilisables (HealthComponent, Hitbox, etc.)
│   ├── entities/           # Logique spécifique aux entités (Joueur, IA Ennemis)
│   └── ui/                 # Contrôleurs d'interface utilisateur
│
├── project.godot           # Paramètres du projet
└── icon.svg                # Icône du projet
```

---

## 📏 Conventions de Nommage

Pour assurer la cohérence, l'IA doit suivre ces règles :

1.  **Fichiers & Dossiers** : `snake_case` (ex: `main_menu.tscn`, `player_controller.gd`).
2.  **Classes (class_name)** : `PascalCase` (ex: `class_name PlayerController`).
3.  **Variables & Fonctions** : `snake_case` (ex: `var health_points`, `func take_damage()`).
4.  **Signaux** : `snake_case` se terminant par une action passée (ex: `signal health_changed`).
5.  **Constantes** : `SCREAMING_SNAKE_CASE` (ex: `const MAX_SPEED = 300.0`).

---

## ⚙️ Paramètres de Projet Critiques (Pixel Art)

Si le projet est en Pixel Art, l'IA doit configurer :
- **Rendering > Textures > Canvas Textures > Default Texture Filter** : `Nearest`
- **Display > Window > Stretch > Mode** : `canvas_items`
- **Display > Window > Stretch > Aspect** : `keep`

---

## 🛠️ Instructions pour l'IA Réceptrice

"Applique cette structure au nouveau projet. Déplace les fichiers existants dans les dossiers correspondants selon leur type (scripts dans `scripts/`, scènes dans `resources/scenes/`, etc.). Si tu crées de nouveaux fichiers, respecte strictement les conventions de nommage définies ci-dessus."
