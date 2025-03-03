# TextSnagger for Godot 4

Capture visible Godot editor UI text as formatted ASCII - perfect for sharing context with AI or humans!

## Features
- One-click copy of visible editor text
- Hierarchical ASCII formatting
- Supports common controls (Buttons, Labels, Trees, etc)
- Godot 4.3+ compatible

## Installation
1. Copy the `addons/textsnagger` folder to your Godot project
2. Enable the plugin in `Project > Project Settings > Plugins`

## Usage
1. Look for the "Copy UI Text" button in the Godot toolbar
2. Click it - text is copied to clipboard
3. Paste anywhere (Ctrl+V)

## Example Output
[Toolbar] 2D | 3D | Script | AssetLib | Copy UI Text
[Scene Tree] Player > CollisionShape3D > MeshInstance3D
[FileSystem] res://addons/textsnagger/TextSnagger.gd

## Contributing
Report issues or PRs at [github.com/Innomen/godot-textsnagger](https://github.com/Innomen/godot-textsnagger)
