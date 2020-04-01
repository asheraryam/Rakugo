tool
extends HBoxContainer

func _ready() -> void:
	$Button.icon = get_icon("Theme", "EditorIcons")
	$Button.connect("pressed", $Button/FileDialog, "popup_centered")
	$Button/FileDialog.connect("confirmed", self, "_on_fd")
	# load_setting()

	$Reload.icon = get_icon("Reload", "EditorIcons")
	$Reload.connect("pressed", self, "_on_reload")


func _on_reload() -> void:
	$Button.text = ProjectSettings.get_setting(
		"application/rakugo/theme")


func load_setting(use_cfg:bool, cfg:ConfigFile) -> void:
	if use_cfg:
		$Button.text = cfg.get_value("application", "rakugo/theme")
		return
	
	$Button.text = ProjectSettings.get_setting(
		"application/rakugo/theme")


func save_setting(use_cfg:bool, cfg:ConfigFile) -> void:
	if use_cfg:
		cfg.set_value("application", "rakugo/theme", $Button.text)
		return
	
	ProjectSettings.set_setting(
		"application/rakugo/theme", $Button.text)
	

func _on_fd():
	$Button.text = $Button/FileDialog.current_path