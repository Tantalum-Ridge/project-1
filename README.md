# 📜 Lisapo ya Mwinda — Game Design Document

<p align="center">
  <img src="icon.svg" width="128" height="128" alt="Lisapo ya Mwinda Icon">
  <br>
  <strong>"La Légende de la Lumière" — Lingala</strong>
</p>

---

## 1. 🌟 Vision du Jeu

| Élément | Détail |
| :--- | :--- |
| **Titre** | Lisapo ya Mwinda |
| **Genre** | Action-Aventure / RPG léger |
| **Vue** | Top-down 2D Pixel Art |
| **Moteur** | Godot Engine 4.x |
| **Plateforme** | PC (Windows / Mac) |
| **Inspirations** | *The Legend of Zelda: Link's Awakening, Crosscode, Undertale* |

**Pitch :**
> Un jeune garçon de 14 ans se réveille dans un monde fantastique plongé dans l'obscurité. Il doit retrouver les 5 fragments du Mwinda — la lumière magique ancestrale — pour sauver le royaume d'Endarya.

---

## 2. 📖 Histoire

### Le Monde — Endarya
Endarya est un monde fantastique autrefois baigné par une lumière magique appelée le **Mwinda**. Cette lumière protégeait les habitants, faisait pousser les récoltes et tenait les créatures des ténèbres à l'écart.

Un jour, le Mwinda s'est brisé en **5 fragments** dispersés aux quatre coins du monde. Depuis, l'obscurité gagne du terrain et les créatures des ténèbres envahissent Endarya.

### Le Héros
- **Âge** : 14-16 ans
- **Style de combat** : Mixte (corps à corps + magie)
- **Origine** : Jeune garçon ordinaire d'un petit village, l'un des rares à ne pas avoir peur de l'obscurité.
- **Appel** : Il entend la voix du Mwinda dans ses rêves qui lui demande de partir.

### Objectif Principal
Retrouver les **5 fragments du Mwinda**, vaincre les gardiens corrompus qui les détiennent, et restaurer la lumière dans Endarya.

---

## 3. 🕹️ Gameplay

### Boucle Principale
`Explorer la carte` ➔ `Entrer dans un donjon` ➔ `Trouver l'objet clé` ➔ `Vaincre le boss` ➔ `Obtenir un fragment` ➔ `Débloquer de nouvelles zones`

### Actions du Joueur
*   ⚔️ **Attaque corps à corps** (épée)
*   ✨ **Attaque magique** (sorts de lumière)
*   🛡️ **Esquive / défense**
*   🗣️ **Dialogue** avec les PNJ
*   🔍 **Interaction** (pousser des blocs, allumer des torches...)
*   🎒 **Gestion d'inventaire**

### Objets Clés (Progression)
| Donjon | Objet obtenu | Utilité |
| :--- | :--- | :--- |
| **Donjon 1** | Lanterne du Mwinda | Éclairer les zones sombres |
| **Donjon 2** | Arc de Lumière | Attaque à distance |
| **Donjon 3** | Gants de Pierre | Pousser de gros blocs |
| **Donjon 4** | Cape du Vent | Esquive améliorée |
| **Donjon 5** | Épée de l'Aube | Arme finale |

---

## 4. 🗺️ Structure du Monde

| Zone | Type | Contenu |
| :--- | :--- | :--- |
| **Village de départ** | Hub | Tutoriel, PNJ, quêtes secondaires |
| **Forêt d'Umba** | Zone 1 | Donjon 1 — Lanterne du Mwinda |
| **Désert de Kora** | Zone 2 | Donjon 2 — Arc de Lumière |
| **Mines de Fer** | Zone 3 | Donjon 3 — Gants de Pierre |
| **Pics du Ciel** | Zone 4 | Donjon 4 — Cape du Vent |
| **Temple de l'Aube** | Zone 5 | Donjon 5 — Boss Final |

---

## 5. 🛠️ Spécifications Techniques

### Stack Technologique
*   **Moteur** : [Godot Engine 4.x](https://godotengine.org/) (Version 4.7 Mobile)
*   **Langage** : GDScript
*   **Art** : Pixel art (Aseprite) - Résolution native 320x180 (upscalée à 640x360)
*   **Physique** : Jolt Physics (Intégré)
*   **Versioning** : Git / GitHub

### Architecture du Projet
*   `assets/` : Sprites, sons, polices et tilesets.
*   `scripts/` : Logique de jeu organisée par domaines (`ui`, `entities`, `autoload`).
*   `resources/` : Données de jeu (items, dialogues, stats).

### État Actuel du Développement
*   ✅ Structure de base du projet initialisée.
*   ✅ Menu Principal fonctionnel avec effet **Parallax Background** fluide.
*   ✅ Gestion du filtrage des textures (Nearest) pour un rendu Pixel Art parfait.
*   ✅ Architecture des dossiers mise en place.

---

## 6. 🚀 Roadmap & Progrès

- [x] Menu principal + parallax background
- [ ] Personnage jouable + mouvements (Top-down)
- [ ] Système de combat (mêlée + magie)
- [ ] Zone 1 — Village de départ
- [ ] Donjon 1 — Forêt d'Umba
- [ ] Système de dialogue PNJ
- [ ] HUD (vie, mana, inventaire)
- [ ] 4 donjons restants
- [ ] Boss final
- [ ] Polish + sons + musiques

---

## 7. 🎨 Direction Artistique & Audio

*   **Visuel** : Style 16x16 / 32x32 Pixel Art. Palette colorée dans les zones sûres, contrastée et sombre dans les donjons pour souligner l'importance de la lumière.
*   **Audio** : Mélange de Chiptune nostalgique et d'instruments acoustiques pour renforcer l'aspect fantastique.

---

## 🎮 Installation

1.  Téléchargez [Godot Engine 4.x](https://godotengine.org/).
2.  Clonez ce dépôt.
3.  Importez le fichier `project.godot` dans l'éditeur.
4.  Appuyez sur `F5` pour lancer le jeu !