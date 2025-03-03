# TextCapture for Godot 4

**Capture Godot editor text directly - no screenshots or OCR needed.**

## Why TextCapture?
- 🚫 **No image processing** - Gets text directly from UI controls
- 📋 **Perfect for AI/LLM context** - Share exact editor state with ChatGPT/Gemini
- ⚡ **Faster than OCR** - No GPU/ML required
- 🎮 **Ideal for dev support** - Show UI hierarchy when asking for help

## Features
- One-click copy of visible editor text
- Hierarchical ASCII formatting
- Supports 20+ control types (Buttons, Trees, Editors, etc.)
- Godot 4.3+ compatible

## Installation
1. Copy the `addons/TextCapture` folder to your project
2. Enable in `Project > Project Settings > Plugins`

## Usage
1. Click the 📋 button in Godot\'s toolbar
2. Paste anywhere (Ctrl+V) to share:
```text

[3D Viewport] Forward+ | Player (RigidBody3D)

├─ CollisionShape3D (Sphere)

└─ MeshInstance3D (Sphere.mesh)

[Output] Text copied to clipboard!

```
## Contributing

Report issues or submit PRs at:

[https://github.com/Innomen/TextCapture](https://github.com/Innomen/TextCapture)

