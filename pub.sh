#!/bin/bash
echo "✨ Running code generation..."
flutter packages pub run build_runner build --delete-conflicting-outputs
echo "✅ Done!"