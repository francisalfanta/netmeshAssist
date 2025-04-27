class DeviceModel {
  final String brand;
  final String model;
  final String name;
  final List<String> possibleModels; // New column

  const DeviceModel({
    required this.brand,
    required this.model,
    required this.name,
    required this.possibleModels,
  });


  // Override the toString method for better representation of the object
  @override
  String toString() {
    return 'DeviceModel(brand: $brand, model: $model, name: $name, possibleModels: $possibleModels)';
  }
}

Map<String, List<String>> ocrMapping = {
  '0': ['O'],
  '1': ['l', 'I'],
  '5': ['S'],
  'S': ['5'],
  '2': ['Z'],
  'O': ['0'],
  'l': ['I'],
  'E': ['3'],
  'B': ['8'],
  'A': ['4'],
  'G': ['6'],
};

List<String> applyOcrErrors(String model) {
  List<String> possibleModels = [model];

  for (var entry in ocrMapping.entries) {
    for (var replacement in entry.value) {
      possibleModels.add(model.replaceAll(entry.key, replacement));
    }
  }

  return possibleModels;
}

List<DeviceModel> generateDeviceModelsWithPossibleModels(List<DeviceModel> devices) {
  // Process each device model to apply OCR errors and generate possible models
  return devices.map((device) {
    // Get possible models with OCR errors
    List<String> possibleModels = applyOcrErrors(device.model);

    // Remove duplicates by converting to a Set and then back to a List
    possibleModels = possibleModels.toSet().toList();

    return DeviceModel(
      brand: device.brand,
      model: device.model,
      name: device.name,
      possibleModels: possibleModels,
    );
  }).toList();
}


