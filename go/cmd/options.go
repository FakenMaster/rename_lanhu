package main

import (
	"github.com/go-flutter-desktop/go-flutter"
	file_picker "github.com/FakenMaster/flutter_file_picker/go"
	"github.com/go-flutter-desktop/plugins/shared_preferences"
)

var options = []flutter.Option{
	flutter.WindowInitialDimensions(800, 1280),
	flutter.AddPlugin(&file_picker.FilePickerPlugin{}),
	flutter.AddPlugin(&shared_preferences.SharedPreferencesPlugin{
		VendorName:      "faken",
		ApplicationName: "rename_lanhu",
	}),
}
