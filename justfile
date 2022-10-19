build:
    jsonnet -- ./jsonnet/windows_shortcuts.jsonnet > ./json/windows_shortcuts.json

install: build
    cp ./json/windows_shortcuts.json ~/.config/karabiner/assets/complex_modifications/

