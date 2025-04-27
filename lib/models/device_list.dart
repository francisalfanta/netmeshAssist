import 'device_model.dart';

const List<DeviceModel> deviceLists = [
  DeviceModel(
    brand: 'Samsung',
    model: 'SM-G973F',
    name: 'Galaxy S10',
    possibleModels: ['SM-G973F'], // No confusing characters
  ),
  DeviceModel(
    brand: 'Samsung',
    model: 'SM-A536E',
    name: 'Galaxy A53 5G',
    possibleModels: ['SM-A536E','SM-A5S6E', '5M-A536E'], // S<->5
  ),
  DeviceModel(
    brand: 'Samsung',
    model: 'SM-N986B',
    name: 'Galaxy Note20 Ultra',
    possibleModels: ['SM-N986B',], // No confusing characters
  ),
  DeviceModel(
    brand: 'Apple',
    model: 'iPhone13,4',
    name: 'iPhone 12 Pro Max',
    possibleModels: ['iPhone13,4','iPh0ne13,4', 'iPhonel3,4'], // 0<->O, 1<->l
  ),
  DeviceModel(
    brand: 'Apple',
    model: 'iPhone15,3',
    name: 'iPhone 14 Pro Max',
    possibleModels: ['iPhone15,3', 'iPhone1S,3', 'iPh0ne15,3'], // 5<->S, 0<->O
  ),
  DeviceModel(
    brand: 'Xiaomi',
    model: 'M2101K9AG',
    name: 'Redmi Note 10 Pro',
    possibleModels: [ 'M2101K9AG','M2lOlK9AG', 'MZlOlK9AG'], // 1<->l, 2<->Z
  ),
  DeviceModel(
    brand: 'OnePlus',
    model: 'LE2123',
    name: 'OnePlus 9 Pro',
    possibleModels: ['LE2123','LE2l23'], // 1<->l
  ),
  DeviceModel(
    brand: 'Google',
    model: 'GD1YQ',
    name: 'Pixel 5',
    possibleModels: ['GD1YQ','GDIYQ', 'GDlYQ'], // 1<->l
  ),
  DeviceModel(
    brand: 'Huawei',
    model: 'LYA-L29',
    name: 'Mate 20 Pro',
    possibleModels: [ 'LYA-L29','LYA-LZ9'], // 2<->Z
  ),
  DeviceModel(
    brand: 'Oppo',
    model: 'CPH2207',
    name: 'Reno5 5G',
    possibleModels: [ 'CPH2207','CPH22O7'], // 0<->O
  ),
  // 2015
  DeviceModel(brand: 'Samsung', model: 'SM-G920F', name: 'Galaxy S6',
    possibleModels: [
      '5M-6920F',
      '5M-G92OF',
      'SM-69ZOF',
      'SM-6920F',
      'SM-G9Z0F',
      '5M-69Z0F',
      '5M-G9Z0F',
      '5M-692OF',
      'SM-G9ZOF',
      '5M-69ZOF',
      'SM-G92OF',
      'SM-69Z0F',
      '5M-G9ZOF',
      'SM-G920F',
      '5M-G920F',
      'SM-692OF'
    ],
  ),
  DeviceModel(brand: 'Samsung', model: 'SM-G925F', name: 'Galaxy S6 Edge',
    possibleModels: [
      'SM-G925F',
      'SM-69ZSF',
      'SM-6925F',
      '5M-G9Z5F',
      'SM-G9ZSF',
      '5M-69Z5F',
      '5M-G92SF',
      '5M-6925F',
      'SM-69Z5F',
      'SM-G9Z5F',
      '5M-692SF',
      '5M-G925F',
      'SM-G92SF',
      '5M-G9ZSF',
      'SM-692SF',
      '5M-69ZSF'
    ],
  ),
  DeviceModel(brand: 'Apple', model: 'iPhone8,1', name: 'iPhone 6s',
    possibleModels: ['iPhone8,1',],
  ),
  DeviceModel(brand: 'Apple', model: 'iPhone8,2', name: 'iPhone 6s Plus',
    possibleModels: ['iPhone8,2','1Phone8,Z','iPhone8,Z'],
  ),
  DeviceModel(brand: 'LG', model: 'LG-H815', name: 'LG G4',
    possibleModels: [
      'LG-H8l5',
      'LG-H8IS',
      'L6-H81S',
      'L6-H8IS',
      'L6-H8l5',
      'L6-H8lS',
      'LG-H8I5',
      'LG-H8lS',
      'L6-H8I5',
      'LG-H815',
      'LG-H81S',
      'L6-H815'
    ],
  ),
  DeviceModel(brand: 'Sony', model: 'E6603', name: 'Xperia Z5',
    possibleModels: [
      'E6603', 'E66O3', '366O3', '36603'
    ],
  ),
  DeviceModel(brand: 'Huawei', model: 'ALE-L21', name: 'Honor 4X',
    possibleModels: [
      'AL3-LZ1',
      '4LE-L21',
      'AL3-L21',
      'AL3-LZI',
      'ALE-LZ1',
      'ALE-L21',
      '4L3-LZI',
      '4LE-LZI',
      'AL3-LZl',
      '4L3-L2I',
      'ALE-LZI',
      '4LE-L2l',
      'AL3-L2I',
      'ALE-L2l',
      '4L3-LZl',
      '4LE-LZl',
      'AL3-L2l',
      'ALE-L2I',
      '4L3-L2l',
      '4L3-LZ1',
      '4LE-LZ1',
      'ALE-LZl',
      '4L3-L21',
      '4LE-L2I'
    ],
  ),
  DeviceModel(brand: 'OnePlus', model: 'A2001', name: 'OnePlus 2',
    possibleModels: [
      '42O0I',
      '42OOI',
      'AZOOI',
      '4ZOOI',
      'A20O1',
      'AZO01',
      'AZ00I',
      '42001',
      'A20OI',
      '4ZO01',
      'AZ001',
      '42OO1',
      'A200l',
      '4Z00l',
      'AZO0l',
      'A20Ol',
      '4200I',
      '42OOl',
      'A2O01',
      '420Ol',
      '4Z0OI',
      'AZ0O1',
      '4Z001',
      'AZOO1',
      'AZ00l',
      'AZ0Ol',
      '42O0l',
      'A2OOl',
      'AZOOl',
      '420OI',
      'AZ0OI',
      'A2001',
      'A2OOI',
      '420O1',
      '4Z0O1',
      '4ZO0l',
      '4Z0Ol',
      'AZO0I',
      '4ZO0I',
      'A2O0I',
      '4Z00I',
      '4ZOO1',
      '4ZOOl',
      'A2OO1',
      '42O01',
      'A200I',
      'A2O0l',
      '4200l'
    ],
  ),
  DeviceModel(brand: 'Motorola', model: 'XT1575', name: 'Moto X Style',
    possibleModels: [
      'XT1S75',
      'XTIS7S',
      'XT1575',
      'XTlS75',
      'XTl57S',
      'XTIS75',
      'XTl575',
      'XTI575',
      'XT1S7S',
      'XT157S',
      'XTI57S',
      'XTlS7S'
    ],
  ),
  DeviceModel(brand: 'Google', model: 'LG-H790', name: 'Nexus 5X',
    possibleModels: ['LG-H790','LG-H79O'],
  ),
  DeviceModel(brand: 'Google', model: 'Huawei-H1512', name: 'Nexus 6P',
    possibleModels: [
      'Huawei-HISl2',
      'Huawei-H15l2',
      'Huawei-HlS1Z',
      'Huawei-H15I2',
      'Huawei-H1Sl2',
      'Huawei-Hl5IZ',
      'Huawei-HIS1Z',
      'Huawei-Hl51Z',
      'Huawei-HIS12',
      'Huawei-HI512',
      'Huawei-H1S1Z',
      'Huawei-HI5l2',
      'Huawei-HlSI2',
      'Huawei-Hl5lZ',
      'Huawei-HI51Z',
      'Huawei-HlS12',
      'Huawei-HI5I2',
      'Huawei-HlSIZ',
      'Huawei-HISI2',
      'Huawei-Hl5l2',
      'Huawei-HISIZ',
      'Huawei-HISlZ',
      'Huawei-H1SlZ',
      'Huawei-H1SI2',
      'Huawei-Hl512',
      'Huawei-HI5IZ',
      'Huawei-H15lZ',
      'Huawei-H1512',
      'Huawei-HI5lZ',
      'Huawei-Hl5I2',
      'Huawei-H1SIZ',
      'Huawei-HlSlZ',
      'Huawei-H1S12',
      'Huawei-HlSl2',
      'Huawei-H15IZ',
      'Huawei-H151Z'
    ],
  ),
  // 2016
  DeviceModel(brand: 'Samsung', model: 'SM-G930F', name: 'Galaxy S7',
    possibleModels: [
      'SM-G930F', 'SM-G93OF', '5M-G930F', '5M-G93OF', 'SM-6930F', 'SM-693OF', '5M-6930F', '5M-693OF', 'SM-G9Z0F', 'SM-G9ZOF', '5M-G9Z0F', '5M-G9ZOF'
    ],
  ),
  DeviceModel(brand: 'Samsung', model: 'SM-G935F', name: 'Galaxy S7 Edge',
    possibleModels: [
      'SM-G935F', 'SM-G93SF', 'SM-G9Z5F', 'SM-G9ZSF', '5M-G935F', '5M-G93SF', '5M-G9Z5F', '5M-G9ZSF', 'SM-6935F', 'SM-693SF', 'SM-69Z5F', 'SM-69ZSF', '5M-6935F', '5M-693SF', '5M-69Z5F', '5M-69ZSF'
    ],
  ),
  DeviceModel(brand: 'Apple', model: 'iPhone9,1', name: 'iPhone 7',
    possibleModels: [
      'iPhone9,1', 'iPhone9,I', 'iPhone9,l'
    ],
  ),
  DeviceModel(brand: 'Apple', model: 'iPhone9,2', name: 'iPhone 7 Plus',
    possibleModels: [
      'iPhone9,2', 'iPhone9,Z'
    ],
  ),
  DeviceModel(brand: 'LG', model: 'LG-H850', name: 'LG G5',
    possibleModels: [
      'LG-H850', 'LG-H85O', 'L6-H850', 'L6-H85O'
    ],
  ),
  DeviceModel(brand: 'Google', model: 'Pixel', name: 'Pixel',
    possibleModels: [
      'Pixel', 'P1xel', 'Plxel', 'Pixe1', 'P1xe1', 'PixeI', 'P1xeI'
    ],
  ),
  DeviceModel(brand: 'Google', model: 'Pixel XL', name: 'Pixel XL',
    possibleModels: [
      'Pixel XL', 'P1xel XL', 'Plxel XL', 'Pixe1 XL', 'P1xe1 XL', 'PixeI XL', 'P1xeI XL'
    ],
  ),
  DeviceModel(brand: 'Huawei', model: 'EVA-L19', name: 'P9',
    possibleModels: [
      'EVA-L19', 'EVA-LI9', 'EVA-Ll9', 'EVA-LIZ', 'EVA-LlZ', 'EVA-Llz', '3VA-L19', '3VA-LI9', '3VA-Ll9', '3VA-LIZ', '3VA-LlZ'
    ],
  ),
  DeviceModel(brand: 'Sony', model: 'F5121', name: 'Xperia X',
    possibleModels: [
      'F5121', 'F5I21', 'FS121', 'FSl21', 'F5IZ1', 'F5lZ1', 'F5IZl', 'FSlZl', 'FSIZ1', 'FSIZl'
    ],
  ),
  DeviceModel(brand: 'OnePlus', model: 'A3003', name: 'OnePlus 3',
    possibleModels: [
      'A3003', 'A3OO3', 'A3O03', 'A30O3', 'A3O0O3', 'A3OOO3', 'A30OO3', 'A30O03', '4Z003', '4ZO03', '4Z0O3', '42003', '420O3'
    ],
  ),
  DeviceModel(brand: 'Xiaomi', model: 'MI 5', name: 'Mi 5',
    possibleModels: [
      'MI 5', 'M1 5', 'Ml 5', 'MI S', 'M1 S', 'Ml S'
    ],
  ),
  // 2017
  DeviceModel(brand: 'Samsung', model: 'SM-G950F', name: 'Galaxy S8',
    possibleModels: ['SM-G950F', 'SM-G95OF', '5M-G950F', '5M-G95OF', 'SM-6950F', 'SM-695OF', '5M-6950F', '5M-695OF', 'SM-G9S0F', 'SM-G9SOF', '5M-G9S0F', '5M-G9SOF'],
  ),
  DeviceModel(brand: 'Samsung', model: 'SM-G955F', name: 'Galaxy S8+',
    possibleModels: ['SM-G955F', 'SM-G95SF', 'SM-G9S5F', 'SM-G9SSF', '5M-G955F', '5M-G95SF', '5M-G9S5F', '5M-G9SSF', 'SM-6955F', 'SM-695SF', '5M-6955F', '5M-695SF']
  ),
  DeviceModel(brand: 'Samsung', model: 'SM-N950F', name: 'Galaxy Note8',
      possibleModels: ['SM-N950F', 'SM-N95OF', '5M-N950F', '5M-N95OF', 'SM-N9S0F', 'SM-N9SOF', '5M-N9S0F', '5M-N9SOF'],
  ),
  DeviceModel(brand: 'Apple', model: 'iPhone10,1', name: 'iPhone 8',
      possibleModels: ['iPhone10,1', 'iPhone10,I', 'iPhone10,l'],
  ),
  DeviceModel(brand: 'Apple', model: 'iPhone10,2', name: 'iPhone 8 Plus',
      possibleModels: ['iPhone10,2', 'iPhone10,Z','iPhone1O,Z'],
  ),
  DeviceModel(brand: 'Apple', model: 'iPhone10,3', name: 'iPhone X',
      possibleModels: ['iPhone10,3', 'iPhone10,Z', 'iPhone1O,3'], // stays the same, but could treat "3" as "Z" accidentally, so -> 'iPhone10,Z'
  ),
  DeviceModel(brand: 'OnePlus', model: 'A5010', name: 'OnePlus 5T',
      possibleModels: ['A5010', 'A5O10', 'A5Ol0', 'A5OIO', 'A5OlO', '45010', '45O10', '45Ol0', '45OIO', '45OlO'],
  ),
  DeviceModel(brand: 'LG', model: 'LG-H930', name: 'LG V30',
      possibleModels: ['LG-H930', 'LG-H93O', 'L6-H930', 'L6-H93O'],
  ),
  DeviceModel(brand: 'Sony', model: 'G8341', name: 'Xperia XZ1',
      possibleModels: ['G8341', 'G83I1', 'G8S41', 'G8Sl1', 'G8S4I', 'G8SlI'],
  ),
  DeviceModel(brand: 'Google', model: 'Pixel 2', name: 'Pixel 2',
      possibleModels: ['Pixel 2', 'P1xel 2', 'Plxel 2', 'Pixe1 2', 'P1xe1 2', 'PixeI 2', 'P1xeI 2'],
  ),
  DeviceModel(brand: 'Google', model: 'Pixel 2 XL', name: 'Pixel 2 XL',
      possibleModels: ['Pixel 2 XL', 'P1xel 2 XL', 'Plxel 2 XL', 'Pixe1 2 XL', 'P1xe1 2 XL', 'PixeI 2 XL', 'P1xeI 2 XL'],
  ),
  DeviceModel(brand: 'Huawei', model: 'BLA-L29', name: 'Mate 10 Pro',
      possibleModels: ['BLA-L29', 'BLA-L2g', 'BLA-L2G', 'BLA-LZ9', 'BLA-LZg', 'BLA-LZG', '8LA-L29', '8LA-L2g', '8LA-L2G', '8LA-LZ9', '8LA-LZg', '8LA-LZG'],
  ),
  DeviceModel(brand: 'Xiaomi', model: 'MDE5', name: 'Mi A1',
      possibleModels: ['MDE5', 'MDES', 'MD35'], // MDE5 is already letters and a number 5 — alternative is recognizing "5" as "S" => 'MDE5', 'MDES'
  ),
  // 2018
  DeviceModel(brand: 'Samsung', model: 'SM-G950F', name: 'Galaxy S9',
      possibleModels: ['SM-G950F', 'SM-G95OF', '5M-G950F', '5M-G95OF', 'SM-6950F', 'SM-695OF', '5M-6950F', '5M-695OF', 'SM-G9S0F', 'SM-G9SOF', '5M-G9S0F', '5M-G9SOF'],
  ),
  DeviceModel(brand: 'Samsung', model: 'SM-G955F', name: 'Galaxy S9+',
      possibleModels: ['SM-G955F', 'SM-G95SF', 'SM-G9S5F', 'SM-G9SSF', '5M-G955F', '5M-G95SF', '5M-G9S5F', '5M-G9SSF', 'SM-6955F', 'SM-695SF', '5M-6955F', '5M-695SF'],
  ),
  DeviceModel(brand: 'Samsung', model: 'SM-N960F', name: 'Galaxy Note9',
      possibleModels: ['SM-N960F', 'SM-N96OF', '5M-N960F', '5M-N96OF', 'SM-N9G0F', 'SM-N9GOF', '5M-N9G0F', '5M-N9GOF'],
  ),
  DeviceModel(brand: 'Apple', model: 'iPhone11,2', name: 'iPhone XS',
      possibleModels: ['iPhone11,2', 'iPhoneII,2', 'iPhoneIl,2', 'iPhone11,Z', 'iPhoneII,Z', 'iPhoneIl,Z'],
  ),
  DeviceModel(brand: 'Apple', model: 'iPhone11,4', name: 'iPhone XS Max',
      possibleModels: ['iPhone11,4', 'iPhoneII,4', 'iPhoneIl,4'],
  ),
  DeviceModel(brand: 'Apple', model: 'iPhone11,6', name: 'iPhone XR',
      possibleModels: ['iPhone11,6', 'iPhoneII,6', 'iPhoneIl,6'],
  ),
  DeviceModel(brand: 'Google', model: 'Pixel 3', name: 'Pixel 3',
      possibleModels: ['Pixel 3', 'P1xel 3', 'Plxel 3', 'Pixe1 3', 'P1xe1 3', 'PixeI 3', 'P1xeI 3'],
  ),
  DeviceModel(brand: 'Google', model: 'Pixel 3 XL', name: 'Pixel 3 XL',
      possibleModels: ['Pixel 3 XL', 'P1xel 3 XL', 'Plxel 3 XL', 'Pixe1 3 XL', 'P1xe1 3 XL', 'PixeI 3 XL', 'P1xeI 3 XL'],
  ),
  DeviceModel(brand: 'OnePlus', model: 'A6013', name: 'OnePlus 6T',
      possibleModels: ['A6013', 'A6O13', 'A6Ol3', 'A6O13', 'A6Ol3', '46013', '46O13', '46Ol3', '46O13', '46Ol3'],
  ),
  DeviceModel(brand: 'Huawei', model: 'P20', name: 'Huawei P20',
      possibleModels: ['P20', 'P2O', 'PZO', 'P2o', 'Pzo'],
  ),
  DeviceModel(brand: 'Huawei', model: 'P20 Pro', name: 'Huawei P20 Pro',
      possibleModels: ['P20 Pro', 'P2O Pro', 'PZO Pro', 'P2o Pro', 'Pzo Pro'],
  ),
  DeviceModel(brand: 'Huawei', model: 'Mate 20', name: 'Huawei Mate 20',
      possibleModels: ['Mate 20', 'Mate 2O', 'Mate Z0'],
  ),
  DeviceModel(brand: 'Huawei', model: 'Mate 20 Pro', name: 'Huawei Mate 20 Pro',
      possibleModels: ['Mate 20 Pro', 'Mate 2O Pro', 'Mate Z0 Pro'],
  ),
  DeviceModel(brand: 'Huawei', model: 'P20 Lite', name: 'Huawei P20 Lite',
      possibleModels: ['P20 Lite', 'P2O Lite', 'PZO Lite', 'P2o Lite', 'Pzo Lite'],
  ),
  DeviceModel(brand: 'Huawei', model: 'Nova 3', name: 'Huawei Nova 3',
      possibleModels: ['Nova 3', 'NOVA 3', 'N0VA 3', 'N0va 3'],
  ),
  DeviceModel(brand: 'Huawei', model: 'Honor 10', name: 'Honor 10',
      possibleModels: ['Honor 10', 'H0nor 10', 'HOnor 10', 'H0n0r 10'],
  ),
  DeviceModel(brand: 'Huawei', model: 'Honor Play', name: 'Honor Play',
      possibleModels: ['Honor Play', 'H0nor Play', 'HOnor Play', 'H0n0r Play'],
  ),
  DeviceModel(brand: 'Xiaomi', model: 'Mi 8', name: 'Xiaomi Mi 8',
      possibleModels: ['Mi 8', 'M1 8', 'Ml 8'],
  ),
  DeviceModel(brand: 'Xiaomi', model: 'Mi Mix 3', name: 'Xiaomi Mi Mix 3',
      possibleModels: ['Mi Mix 3', 'M1 Mix 3', 'Ml Mix 3'],
  ),
  DeviceModel(brand: 'Oppo', model: 'CPH1901', name: 'Oppo F9',
      possibleModels: ['CPH1901', 'CPH19OI', 'CPH19Ol', 'CPHl901', 'CPHl9OI', 'CPHl9Ol']
  ),
  // More Samsung devices
  DeviceModel(brand: 'Samsung', model: 'SM-G970F', name: 'Galaxy S10e',
      possibleModels: ['SM-G970F', 'SM-G97OF', '5M-G970F', '5M-G97OF', 'SM-6970F', 'SM-697OF', '5M-6970F', '5M-697OF', 'SM-G9Z0F', 'SM-G9ZOF', '5M-G9Z0F', '5M-G9ZOF'],
  ),
  DeviceModel(brand: 'Samsung', model: 'SM-G973F', name: 'Galaxy S10',
      possibleModels: ['SM-G973F', 'SM-G97SF', '5M-G973F', '5M-G97SF', 'SM-6973F', 'SM-697SF', '5M-6973F', '5M-697SF', 'SM-G9Z3F', 'SM-G9ZSF', '5M-G9Z3F', '5M-G9ZSF']
  ),
  DeviceModel(brand: 'Samsung', model: 'SM-G975F', name: 'Galaxy S10+',
      possibleModels: ['SM-G975F', 'SM-G97SF', '5M-G975F', '5M-G97SF', 'SM-6975F', 'SM-697SF', '5M-6975F', '5M-697SF', 'SM-G9Z5F', 'SM-G9ZSF', '5M-G9Z5F', '5M-G9ZSF'],
  ),
  DeviceModel(brand: 'Samsung', model: 'SM-A530F', name: 'Galaxy A8 (2018)',
      possibleModels:  ['SM-A530F', 'SM-A53OF', '5M-A530F', '5M-A53OF', 'SM-4530F', 'SM-453OF', '5M-4530F', '5M-453OF'],
  ),
  DeviceModel(brand: 'Samsung', model: 'SM-A750F', name: 'Galaxy A8+ (2018)',
    possibleModels:  ['SM-A750F', 'SM-A75OF', '5M-A750F', '5M-A75OF', 'SM-4750F', 'SM-475OF', '5M-4750F', '5M-475OF']
  ),

  // More Huawei devices
  DeviceModel(brand: 'Huawei', model: 'Y9 2018', name: 'Huawei Y9 (2018)',
      possibleModels: ['Y9 2018', 'Y9 2O18', 'Y9 201B', 'Y9 2O1B'],
  ),
  DeviceModel(brand: 'Huawei', model: 'P Smart 2018', name: 'Huawei P Smart (2018)',
      possibleModels:['P Smart 2018', 'P 5mart 2018', 'P Smart 2O18', 'P 5mart 2O18', 'P Smart 201B', 'P 5mart 201B', 'P Smart 2O1B', 'P 5mart 2O1B'],
  ),
  DeviceModel(brand: 'Huawei', model: 'Mate 10 Lite', name: 'Huawei Mate 10 Lite',
      possibleModels: ['Mate 10 Lite', 'Mate 1O Lite', 'Mate 10 Llte', 'Mate 1O Llte'],
  ),
  DeviceModel(brand: 'Huawei', model: 'Honor 7X', name: 'Honor 7X',
      possibleModels: ['Honor 7X']
  ),

  // Xiaomi devices
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 6 Pro', name: 'Redmi Note 6 Pro',
      possibleModels: ['Redmi Note 6 Pro', 'Redmi Note 6 Pr0', 'Redml Note 6 Pro', 'Redml Note 6 Pr0'],
  ),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 7', name: 'Redmi Note 7',
      possibleModels: ['Redmi Note 7'
      ],
  ),

  // Google devices
  DeviceModel(brand: 'Google', model: 'Pixel 3a', name: 'Pixel 3a',
      possibleModels: ['Pixel 3a', 'Plxel 3a', 'Pixel 3a'],
  ),
  DeviceModel(brand: 'Google', model: 'Pixel 3a XL', name: 'Pixel 3a XL',
      possibleModels: ['Pixel 3a XL', 'Plxel 3a XL', 'Pixel 3a XL'],
  ),

  // OnePlus devices
  DeviceModel(brand: 'OnePlus', model: 'A6010', name: 'OnePlus 6',
      possibleModels: ['A6010', 'A6O10', 'A6OlO'],
  ),
  DeviceModel(brand: 'OnePlus', model: 'A6003', name: 'OnePlus 6',
      possibleModels:['A6003', 'A6O03', 'A6OO3'],
  ),

  // LG devices
  DeviceModel(brand: 'LG', model: 'LG-V40', name: 'LG V40 ThinQ',
      possibleModels: ['LG-V40', 'LG-V4O', 'L6-V40'
      ],
  ),
  DeviceModel(brand: 'LG', model: 'LG-G7', name: 'LG G7 ThinQ',
      possibleModels: [ 'LG-G7', 'L6-67'],
  ),

  // Sony devices
  DeviceModel(brand: 'Sony', model: 'Xperia XZ2', name: 'Xperia XZ2',
      possibleModels: [ 'Xperia XZ2', 'Xperia XZZ'],
  ),
  DeviceModel(brand: 'Sony', model: 'Xperia XZ2 Compact', name: 'Xperia XZ2 Compact',
      possibleModels: [ 'Xperia XZ2 Compact', 'Xperia XZZ Compact'],
  ),

  // Oppo
  DeviceModel(brand: 'Oppo', model: 'CPH1823', name: 'Oppo F7',
    possibleModels:  ['CPH1823', 'CPHl823', 'CPHI823', 'CPH18Z3'
    ],
  ),
  DeviceModel(brand: 'Oppo', model: 'CPH1881', name: 'Oppo R15',
    possibleModels: ['CPH1881', 'CPHl88l', 'CPHI88I'
    ],
  ),

  // Vivo devices
  DeviceModel(brand: 'Vivo', model: 'Vivo X21', name: 'Vivo X21',
    possibleModels: [ 'Vivo X21', 'Vivo X2l', 'Vivo X2I', 'Vivo XZ1'
    ],
  ),
  DeviceModel(brand: 'Vivo', model: 'Vivo V9', name: 'Vivo V9',
    possibleModels: [ 'Vivo V9'
    ],
  ),

  // Motorola devices
  DeviceModel(brand: 'Motorola', model: 'Moto Z3', name: 'Moto Z3',
    possibleModels: ['Moto Z3'
    ],
  ),
  DeviceModel(brand: 'Motorola', model: 'Moto G6', name: 'Moto G6',
    possibleModels: [ 'Moto G6', 'Moto 66' ],
  ),

  // Asus devices
  DeviceModel(brand: 'Asus', model: 'ZenFone 5Z', name: 'ZenFone 5Z',
      possibleModels: ['ZenFone 5Z', 'ZenFone SZ']
  ),
  DeviceModel(brand: 'Asus', model: 'ZenFone 5', name: 'ZenFone 5',
      possibleModels:['Nokia 7 Plus', 'Nokia 7 PIus' ]
  ),
  DeviceModel(brand: 'Nokia', model: 'Nokia 7 Plus', name: 'Nokia 7 Plus',
      possibleModels:['Nokia 7 Plus', 'Nokia 7 PIus' ]
  ),
  DeviceModel(brand: 'Nokia', model: 'Nokia 6.1', name: 'Nokia 6.1',
      possibleModels:['Nokia 6.1', 'Nokia 6.l', 'Nokia 6.I' ]
  ),
  //2019
  DeviceModel(brand: 'Huawei', model: 'P30', name: 'Huawei P30', possibleModels: ['P30', 'P3O']),
  DeviceModel(brand: 'Huawei', model: 'P30 Pro', name: 'Huawei P30 Pro', possibleModels: ['P30 Pro', 'P3O Pro']),
  DeviceModel(brand: 'Huawei', model: 'P30 Lite', name: 'Huawei P30 Lite', possibleModels: ['P30 Lite', 'P3O Lite']),
  DeviceModel(brand: 'Huawei', model: 'Mate 30', name: 'Huawei Mate 30', possibleModels: ['Mate 30', 'Mate 3O']),
  DeviceModel(brand: 'Huawei', model: 'Mate 30 Pro', name: 'Huawei Mate 30 Pro', possibleModels: ['Mate 30 Pro', 'Mate 30 Pr0', 'Mate 30 Pr1', 'Mate 30 Pto', 'Mate 3O Pro', 'Mate 30 Pr4']),
  DeviceModel(brand: 'Huawei', model: 'Mate 30 RS', name: 'Huawei Mate 30 RS Porsche Design', possibleModels: ['Mate 30 RS', 'Mate 30 R5', 'Mate 30 R5S', 'Mate 30 R5S', 'Mate 30 R5P', 'Mate 30 R5Porsche']),
  DeviceModel(brand: 'Huawei', model: 'Y9 Prime 2019', name: 'Huawei Y9 Prime (2019)', possibleModels: ['Y9 Prime 2019', 'Y9 Pr1me 2019', 'Y9 Pr1me 2O19', 'Y9 Pr1m3 2019']),
  DeviceModel(brand: 'Huawei', model: 'Nova 5T', name: 'Huawei Nova 5T', possibleModels: ['Nova 5T', 'N0va 5T', 'N0v4 5T', 'N0va 5T0']),
  DeviceModel(brand: 'Huawei', model: 'Nova 5', name: 'Huawei Nova 5', possibleModels: ['Nova 5', 'N0va 5', 'N0v4 5']),
  DeviceModel(brand: 'Huawei', model: 'Nova 5 Pro', name: 'Huawei Nova 5 Pro', possibleModels: ['Nova 5 Pro', 'N0va 5 Pr0', 'N0v4 5 Pr0', 'N0va 5 Pto']),
  DeviceModel(brand: 'Huawei', model: 'Nova 5i', name: 'Huawei Nova 5i', possibleModels: [ 'Nova 5i', 'Nova Si']),
  DeviceModel(brand: 'Huawei', model: 'Nova 5i Pro', name: 'Huawei Nova 5i Pro', possibleModels: ['Nova 5i Pro', 'Nova Si Pro']),

  // Honor (Huawei sub-brand) Devices (2019)
  DeviceModel(brand: 'Huawei', model: 'Honor 20', name: 'Honor 20', possibleModels: ['Honor 20', 'Honor 2O', 'Honor Z0']),
  DeviceModel(brand: 'Huawei', model: 'Honor 20 Pro', name: 'Honor 20 Pro', possibleModels: ['Honor 20 Pro', 'Honor 2O Pro', 'Honor Z0 Pro']),
  DeviceModel(brand: 'Huawei', model: 'Honor 20i', name: 'Honor 20i', possibleModels: ['Honor 20i', 'Honor 2Oi', 'Honor Z0i']),
  DeviceModel(brand: 'Huawei', model: 'Honor 9X', name: 'Honor 9X', possibleModels: ['Honor 9X']),
  DeviceModel(brand: 'Huawei', model: 'Honor 9X Pro', name: 'Honor 9X Pro', possibleModels: ['Honor 9X Pro']),
  DeviceModel(brand: 'Huawei', model: 'Honor View 20', name: 'Honor View 20', possibleModels: ['Honor View 20', 'Honor View 2O', 'Honor View Z0']),

  // Xiaomi Devices (2019)
  DeviceModel(brand: 'Xiaomi', model: 'Mi 9', name: 'Xiaomi Mi 9', possibleModels: ['Mi 9']),
  DeviceModel(brand: 'Xiaomi', model: 'Mi 9 SE', name: 'Xiaomi Mi 9 SE', possibleModels: ['Mi 9 SE', 'Mi 9 5E', 'Mi 9 S3']),
  DeviceModel(brand: 'Xiaomi', model: 'Mi 9T', name: 'Xiaomi Mi 9T', possibleModels: ['Mi 9T']),
  DeviceModel(brand: 'Xiaomi', model: 'Mi 9T Pro', name: 'Xiaomi Mi 9T Pro', possibleModels: ['Mi 9T Pro']),
  DeviceModel(brand: 'Xiaomi', model: 'Mi A3', name: 'Xiaomi Mi A3', possibleModels: ['Mi A3', 'Mi 43']),
  DeviceModel(brand: 'Xiaomi', model: 'Mi Mix Alpha', name: 'Xiaomi Mi Mix Alpha', possibleModels: ['Mi Mix Alpha', 'Mi Mix AIpha', 'Mi Mix 4lpha']),

  DeviceModel(brand: 'Xiaomi', model: 'Redmi K20', name: 'Redmi K20', possibleModels: ['Redmi K20', 'Redmi K2O', 'Redmi KZ0']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K20 Pro', name: 'Redmi K20 Pro', possibleModels: ['Redmi K20 Pro', 'Redmi K2O Pro', 'Redmi KZ0 Pro']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi 7', name: 'Redmi 7', possibleModels: ['Redmi 7']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi 7A', name: 'Redmi 7A', possibleModels: ['Redmi 7A', 'Redmi 74']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 7', name: 'Redmi Note 7', possibleModels: ['Redmi Note 7']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 7 Pro', name: 'Redmi Note 7 Pro', possibleModels: ['Redmi Note 7 Pro']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 8', name: 'Redmi Note 8', possibleModels: [ 'Redmi Note 8']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 8 Pro', name: 'Redmi Note 8 Pro', possibleModels: ['Redmi Note 8 Pro']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi 8', name: 'Redmi 8', possibleModels: ['Redmi 8']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi 8A', name: 'Redmi 8A', possibleModels: ['Redmi 8A', 'Redmi 84']),

  DeviceModel(brand: 'Xiaomi', model: 'Poco F1 Lite', name: 'Poco F1 Lite', possibleModels: ['Poco F1 Lite', 'Poco Fl Lite', 'Poco FI Lite']),
  DeviceModel(brand: 'Xiaomi', model: 'Poco X2 (early prototype)', name: 'Poco X2', possibleModels: ['Poco X2 (early prototype)', 'Poco XZ (early prototype)', 'Poco X2 (earIy prototype)']),

  // LG Devices (2019)
  DeviceModel(brand: 'LG', model: 'LG G8 ThinQ', name: 'LG G8 ThinQ', possibleModels: ['LG G8 ThinQ', 'L6 68 ThinQ']),
  DeviceModel(brand: 'LG', model: 'LG G8s ThinQ', name: 'LG G8s ThinQ', possibleModels: ['LG G8s ThinQ', 'L6 68s ThinQ']),
  DeviceModel(brand: 'LG', model: 'LG G8X ThinQ', name: 'LG G8X ThinQ', possibleModels: ['LG G8X ThinQ', 'L6 68X ThinQ']),
  DeviceModel(brand: 'LG', model: 'LG V50 ThinQ', name: 'LG V50 ThinQ', possibleModels: ['LG V50 ThinQ', 'LG V5O ThinQ', 'LG VS0 ThinQ', 'L6 V50 ThinQ']),
  DeviceModel(brand: 'LG', model: 'LG V50S ThinQ', name: 'LG V50S ThinQ', possibleModels: ['LG V50S ThinQ', 'LG V5OS ThinQ', 'LG VS0S ThinQ', 'LG V505 ThinQ', 'L6 V50S ThinQ']),
  DeviceModel(brand: 'LG', model: 'LG K40', name: 'LG K40', possibleModels: ['LG K40', 'LG K4O', 'L6 K40']),
  DeviceModel(brand: 'LG', model: 'LG K50', name: 'LG K50', possibleModels: ['LG K50', 'LG K5O', 'LG KS0', 'L6 K50']),
  DeviceModel(brand: 'LG', model: 'LG K12+', name: 'LG K12+', possibleModels: ['LG K12+', 'LG Kl2+', 'LG KI2+', 'LG K1Z+', 'L6 K12+']),
  DeviceModel(brand: 'LG', model: 'LG Q60', name: 'LG Q60', possibleModels: ['LG Q60', 'LG Q6O', 'L6 Q60']),
  DeviceModel(brand: 'LG', model: 'LG W10', name: 'LG W10', possibleModels: ['LG W10', 'LG W1O', 'LG Wl0', 'LG WI0', 'L6 W10']),
  DeviceModel(brand: 'LG', model: 'LG W30', name: 'LG W30', possibleModels: ['LG W30', 'LG W3O', 'L6 W30']),
  DeviceModel(brand: 'LG', model: 'LG W30 Pro', name: 'LG W30 Pro', possibleModels: ['LG W30 Pro', 'LG W3O Pro', 'L6 W30 Pro']),

  // OnePlus Devices (2019)
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 7', name: 'OnePlus 7', possibleModels: ['OnePlus 7', '0nePlus 7', 'OnePIus 7']),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 7 Pro', name: 'OnePlus 7 Pro', possibleModels: ['OnePlus 7 Pro', '0nePlus 7 Pro', 'OnePIus 7 Pro']),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 7 Pro 5G', name: 'OnePlus 7 Pro 5G', possibleModels: ['OnePlus 7 Pro 5G', 'OnePlus 7 Pro SG', '0nePlus 7 Pro 5G', 'OnePIus 7 Pro 5G', 'OnePlus 7 Pro 56']),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 7T', name: 'OnePlus 7T', possibleModels: ['OnePlus 7T', '0nePlus 7T', 'OnePIus 7T']),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 7T Pro', name: 'OnePlus 7T Pro', possibleModels: ['OnePlus 7T Pro', '0nePlus 7T Pro', 'OnePIus 7T Pro']),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 7T Pro McLaren Edition', name: 'OnePlus 7T Pro McLaren Edition', possibleModels: ['OnePlus 7T Pro McLaren Edition', '0nePlus 7T Pro McLaren Edition', 'OnePIus 7T Pro McLaren Edition', 'OnePlus 7T Pro McLaren 3dition']),

  // Samsung Devices
  DeviceModel(brand: 'Samsung', model: 'SM-G970F', name: 'Galaxy S10e', possibleModels: ['SM-G970F', 'SM-G97OF', '5M-G970F', 'SM-6970F']),
  DeviceModel(brand: 'Samsung', model: 'SM-G973F', name: 'Galaxy S10', possibleModels: ['SM-G973F', '5M-G973F', 'SM-6973F']),
  DeviceModel(brand: 'Samsung', model: 'SM-G975F', name: 'Galaxy S10+', possibleModels: ['SM-G975F', 'SM-G97SF', '5M-G975F', 'SM-6975F']),
  DeviceModel(brand: 'Samsung', model: 'SM-N975F', name: 'Galaxy Note10', possibleModels: ['SM-N975F', 'SM-N97SF', '5M-N975F']),
  DeviceModel(brand: 'Samsung', model: 'SM-N976B', name: 'Galaxy Note10+', possibleModels: ['SM-N976B', '5M-N976B', 'SM-N9768']),
  DeviceModel(brand: 'Samsung', model: 'SM-A80SF', name: 'Galaxy A80 (Special Firmware)', possibleModels: [ 'SM-A8OSF', '5M-A805F', 'SM-480SF', 'SM-A8OSF', 'SM-A8O5F','SM-A80F']),
  DeviceModel(brand: 'Samsung', model: 'SM-A505F', name: 'Galaxy A50', possibleModels: ['SM-A505F', 'SM-A5O5F', 'SM-AS0SF', '5M-A505F', 'SM-4505F']),
  DeviceModel(brand: 'Samsung', model: 'SM-A705F', name: 'Galaxy A70', possibleModels: ['SM-A705F', 'SM-A7O5F', 'SM-A70SF', '5M-A705F', 'SM-4705F']),
  DeviceModel(brand: 'Samsung', model: 'SM-A305F', name: 'Galaxy A30', possibleModels: ['SM-A305F', 'SM-A3O5F', 'SM-A30SF', '5M-A305F', 'SM-4305F']),
  DeviceModel(brand: 'Samsung', model: 'SM-A205F', name: 'Galaxy A20', possibleModels: ['SM-A205F', 'SM-A2O5F', 'SM-A20SF', '5M-A205F', 'SM-AZ05F', 'SM-4205F']),
  DeviceModel(brand: 'Samsung', model: 'SM-A105F', name: 'Galaxy A10', possibleModels: ['SM-A105F', 'SM-A1O5F', 'SM-Al05F', 'SM-AI05F', 'SM-A10SF', '5M-A105F', 'SM-4105F']),
  DeviceModel(brand: 'Samsung', model: 'SM-M105F', name: 'Galaxy M10', possibleModels: ['SM-M105F', 'SM-M1O5F', 'SM-Ml05F', 'SM-MI05F', 'SM-M10SF', '5M-M105F']),
  DeviceModel(brand: 'Samsung', model: 'SM-M205F', name: 'Galaxy M20', possibleModels: ['SM-M205F', 'SM-M2O5F', 'SM-M20SF', '5M-M205F', 'SM-MZ05F']),
  DeviceModel(brand: 'Samsung', model: 'SM-M305F', name: 'Galaxy M30', possibleModels: ['SM-M305F', 'SM-M3O5F', 'SM-M30SF', '5M-M305F']),
  DeviceModel(brand: 'Samsung', model: 'SM-A705FN', name: 'Galaxy A70 (variant)', possibleModels: ['SM-A7O5FN', 'SM-A70SFN', '5M-A705FN', 'SM-4705FN']),
  DeviceModel(brand: 'Samsung', model: 'SM-G977B', name: 'Galaxy S10 5G', possibleModels: [ 'SM-G977B', '5M-G977B', 'SM-G9778', 'SM-6977B']),
  DeviceModel(brand: 'Samsung', model: 'SM-F900F', name: 'Galaxy Fold', possibleModels: ['SM-F900F', 'SM-F9OOF', '5M-F900F']),
  DeviceModel(brand: 'Samsung', model: 'Galaxy S24', name: 'Samsung Galaxy S24', possibleModels: ['Galaxy S24', 'Galaxy 524', 'Galaxy SZ4', 'GaIaxy S24', '6alaxy S24']),
  DeviceModel(brand: 'Samsung', model: 'Galaxy S24+', name: 'Samsung Galaxy S24+', possibleModels: ['Galaxy S24+', 'Galaxy 524+', 'Galaxy SZ4+', 'GaIaxy S24+', '6alaxy S24+']),
  DeviceModel(brand: 'Samsung', model: 'Galaxy S24 Ultra', name: 'Samsung Galaxy S24 Ultra', possibleModels: ['Galaxy S24 Ultra', 'Galaxy 524 Ultra', 'Galaxy SZ4 Ultra', 'GaIaxy S24 UItra', '6alaxy S24 Ultra']),
  DeviceModel(brand: 'Samsung', model: 'Galaxy Z Flip 6', name: 'Samsung Galaxy Z Flip 6', possibleModels: ['Galaxy Z Flip 6', 'GaIaxy Z FIip 6', '6alaxy Z Flip 6']),
  DeviceModel(brand: 'Samsung', model: 'Galaxy Z Fold 6', name: 'Samsung Galaxy Z Fold 6', possibleModels: ['Galaxy Z Fold 6', 'GaIaxy Z FoId 6', '6alaxy Z Fold 6']),
  DeviceModel(brand: 'Samsung', model: 'Galaxy A84 5G', name: 'Samsung Galaxy A84 5G', possibleModels: ['Galaxy A84 5G', 'Galaxy A84 SG', 'GaIaxy A84 5G', 'Galaxy 484 5G', '6alaxy A84 56']),
  DeviceModel(brand: 'Samsung', model: 'Galaxy A94 5G', name: 'Samsung Galaxy A94 5G', possibleModels: ['Galaxy A94 5G', 'Galaxy A94 SG', 'GaIaxy A94 5G', 'Galaxy 494 5G', '6alaxy A94 56']),
  DeviceModel(brand: 'Samsung', model: 'SM-A80SF', name: 'Samsung Galaxy A80', possibleModels: ['SM-A80SF', 'SM-A8OSF', '5M-A805F', 'SM-480SF']),

  // Google Devices (2019)
  DeviceModel(brand: 'Google', model: 'Pixel 3a', name: 'Pixel 3a', possibleModels: ['Pixel 3a', 'PixeI 3a']),
  DeviceModel(brand: 'Google', model: 'Pixel 3a XL', name: 'Pixel 3a XL', possibleModels: ['Pixel 3a XL', 'PixeI 3a XL']),
  DeviceModel(brand: 'Google', model: 'Pixel 4', name: 'Pixel 4', possibleModels: ['Pixel 4', 'PixeI 4']),
  DeviceModel(brand: 'Google', model: 'Pixel 4 XL', name: 'Pixel 4 XL', possibleModels: ['Moto Z4']),

  // Motorola Devices (2019)
  DeviceModel(brand: 'Motorola', model: 'Moto Z4', name: 'Moto Z4', possibleModels: ['Moto Z4']),
  DeviceModel(brand: 'Motorola', model: 'Moto G7', name: 'Moto G7', possibleModels: ['Moto G7', 'Moto 67']),
  DeviceModel(brand: 'Motorola', model: 'Moto G7 Plus', name: 'Moto G7 Plus', possibleModels: ['Moto G7 Plus', 'Moto G7 PIus', 'Moto 67 Plus']),
  DeviceModel(brand: 'Motorola', model: 'Moto G7 Play', name: 'Moto G7 Play', possibleModels: ['Moto G7 Play', 'Moto G7 PIay', 'Moto 67 Play']),
  DeviceModel(brand: 'Motorola', model: 'Moto G7 Power', name: 'Moto G7 Power', possibleModels: ['Moto G7 Power', 'Moto 67 Power']),
  DeviceModel(brand: 'Motorola', model: 'Motorola One Vision', name: 'Motorola One Vision', possibleModels: ['Motorola One Vision', 'Motorola 0ne Vision', 'MotoroIa One Vision']),
  DeviceModel(brand: 'Motorola', model: 'Motorola One Zoom', name: 'Motorola One Zoom', possibleModels: ['Motorola One Zoom', 'Motorola 0ne Zoom', 'MotoroIa One Zoom']),
  DeviceModel(brand: 'Motorola', model: 'Motorola One Macro', name: 'Motorola One Macro', possibleModels: ['Motorola One Macro', 'Motorola 0ne Macro', 'MotoroIa One Macro']),
  DeviceModel(brand: 'Motorola', model: 'Motorola One Action', name: 'Motorola One Action', possibleModels: ['Motorola One Action', 'Motorola 0ne Action', 'MotoroIa One Action', 'Motorola One 4ction']),
  DeviceModel(brand: 'Motorola', model: 'Motorola Razr (2019)', name: 'Motorola Razr (2019)', possibleModels: ['Motorola Razr (2019)', 'Motorola Razr (2O19)', 'Motorola Razr (20l9)', 'Motorola Razr (20I9)', 'Motorola Razr (Z019)', 'MotoroIa Razr (2019)']),


  // Oppo Devices released in 2019
  DeviceModel(brand: 'Oppo', model: 'Reno 10x Zoom', name: 'Oppo Reno 10x Zoom', possibleModels: ['Reno 10x Zoom', 'Reno 1Ox Zoom', 'Reno l0x Zoom', 'Reno I0x Zoom']),
  DeviceModel(brand: 'Oppo', model: 'Reno 2', name: 'Oppo Reno 2', possibleModels: ['Reno 2', 'Reno Z']),
  DeviceModel(brand: 'Oppo', model: 'Reno Z', name: 'Oppo Reno Z', possibleModels: ['Reno Z']),
  DeviceModel(brand: 'Oppo', model: 'F11 Pro', name: 'Oppo F11 Pro', possibleModels: ['F11 Pro', 'Fll Pro', 'FII Pro']),
  DeviceModel(brand: 'Oppo', model: 'A9 2020', name: 'Oppo A9 2020', possibleModels: ['A9 2020', 'A9 2O2O', 'A9 Z0Z0', '49 2020']),

  // Vivo Devices released in 2019
  DeviceModel(brand: 'Vivo', model: 'Vivo V15', name: 'Vivo V15', possibleModels: ['Vivo V15', 'Vivo Vl5', 'Vivo VI5', 'Vivo V1S']),
  DeviceModel(brand: 'Vivo', model: 'Vivo S1', name: 'Vivo S1', possibleModels: ['Vivo S1', 'Vivo Sl', 'Vivo SI', 'Vivo 51']),
  DeviceModel(brand: 'Vivo', model: 'Vivo V15 Pro', name: 'Vivo V15 Pro', possibleModels: ['Vivo V15 Pro', 'Vivo Vl5 Pro', 'Vivo VI5 Pro', 'Vivo V1S Pro']),
  DeviceModel(brand: 'Vivo', model: 'Vivo Z1 Pro', name: 'Vivo Z1 Pro', possibleModels: ['Vivo Z1 Pro', 'Vivo Zl Pro', 'Vivo ZI Pro']),
  DeviceModel(brand: 'Vivo', model: 'Vivo S1 Pro', name: 'Vivo S1 Pro', possibleModels: ['Vivo S1 Pro', 'Vivo Sl Pro', 'Vivo SI Pro', 'Vivo 51 Pro']),
  DeviceModel(brand: 'Vivo', model: 'Vivo V17 Pro', name: 'Vivo V17 Pro', possibleModels: ['Vivo V17 Pro', 'Vivo Vl7 Pro', 'Vivo VI7 Pro']),

  // Asus Devices released in 2019
  DeviceModel(brand: 'Asus', model: 'ZenFone 6', name: 'ZenFone 6', possibleModels: ['ZenFone 6']),
  DeviceModel(brand: 'Asus', model: 'ZenFone 6Z', name: 'ZenFone 6Z', possibleModels: ['ZenFone 6Z']),
  DeviceModel(brand: 'Asus', model: 'ZenFone 5Z', name: 'ZenFone 5Z', possibleModels: ['ZenFone 5Z', 'ZenFone SZ']),
  DeviceModel(brand: 'Asus', model: 'ZenFone Max Pro M2', name: 'ZenFone Max Pro M2', possibleModels: ['ZenFone Max Pro M2', 'ZenFone Max Pro MZ']),
  DeviceModel(brand: 'Asus', model: 'ZenFone Max M2', name: 'ZenFone Max M2', possibleModels: ['ZenFone Max M2', 'ZenFone Max MZ']),

  // Nokia Devices released in 2019
  DeviceModel(brand: 'Nokia', model: 'Nokia 9 PureView', name: 'Nokia 9 PureView', possibleModels: ['Nokia 9 PureView']),
  DeviceModel(brand: 'Nokia', model: 'Nokia 8.1', name: 'Nokia 8.1', possibleModels: ['Nokia 8.1', 'Nokia 8.l', 'Nokia 8.I']),
  DeviceModel(brand: 'Nokia', model: 'Nokia 7.2', name: 'Nokia 7.2', possibleModels: ['Nokia 7.2', 'Nokia 7.Z']),
  DeviceModel(brand: 'Nokia', model: 'Nokia 6.2', name: 'Nokia 6.2', possibleModels: ['Nokia 6.2', 'Nokia 6.Z']),
  DeviceModel(brand: 'Nokia', model: 'Nokia 2.3', name: 'Nokia 2.3', possibleModels: ['Nokia 2.3', 'Nokia Z.3']),

  // Sony Devices released in 2019
  DeviceModel(brand: 'Sony', model: 'Xperia 1', name: 'Xperia 1', possibleModels: ['Xperia 1', 'Xperia l', 'Xperia I']),
  DeviceModel(brand: 'Sony', model: 'Xperia 10', name: 'Xperia 10', possibleModels: ['Xperia 10', 'Xperia 1O', 'Xperia l0', 'Xperia I0']),
  DeviceModel(brand: 'Sony', model: 'Xperia 10 Plus', name: 'Xperia 10 Plus', possibleModels: ['Xperia 10 Plus', 'Xperia 1O Plus', 'Xperia l0 Plus', 'Xperia I0 Plus', 'Xperia 10 PIus']),
  DeviceModel(brand: 'Sony', model: 'Xperia L3', name: 'Xperia L3', possibleModels: ['Xperia L3']),

  // Realme Devices released in 2019
  DeviceModel(brand: 'Realme', model: 'Realme X', name: 'Realme X', possibleModels: ['Realme X', 'ReaIme X']),
  DeviceModel(brand: 'Realme', model: 'Realme 5 Pro', name: 'Realme 5 Pro', possibleModels: ['Realme 5 Pro', 'Realme S Pro', 'ReaIme 5 Pro']),
  DeviceModel(brand: 'Realme', model: 'Realme 3 Pro', name: 'Realme 3 Pro', possibleModels: ['Realme 3 Pro', 'ReaIme 3 Pro']),
  DeviceModel(brand: 'Realme', model: 'Realme 5', name: 'Realme 5', possibleModels: ['Realme 5', 'Realme S', 'ReaIme 5']),
  DeviceModel(brand: 'Realme', model: 'Realme X2', name: 'Realme X2', possibleModels: ['Realme X2', 'Realme XZ', 'ReaIme X2']),

  DeviceModel(brand: 'Xiaomi', model: 'Mi 10 Pro', name: 'Xiaomi Mi 10 Pro', possibleModels: ['Mi 10 Pro', 'Mi 1O Pro', 'Mi l0 Pro', 'Mi I0 Pro']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K30', name: 'Redmi K30', possibleModels: ['Redmi K30', 'Redmi K3O']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K30 Pro', name: 'Redmi K30 Pro', possibleModels: ['Redmi K30 Pro', 'Redmi K3O Pro']),
  DeviceModel(brand: 'Xiaomi', model: 'Mi 10 Lite', name: 'Xiaomi Mi 10 Lite', possibleModels: ['Mi 10 Lite', 'Mi 1O Lite', 'Mi l0 Lite', 'Mi I0 Lite']),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 9S', name: 'Redmi Note 9S', possibleModels: ['Redmi Note 9S', 'Redmi Note 95']),
  DeviceModel(brand: 'Xiaomi', model: 'Mi 10T', name: 'Xiaomi Mi 10T', possibleModels: ['Mi 10T', 'Mi 1OT', 'Mi l0T', 'Mi I0T']),
  DeviceModel(brand: 'Xiaomi', model: 'Mi 10T Pro', name: 'Xiaomi Mi 10T Pro', possibleModels: ['Mi 10T Pro', 'Mi 1OT Pro', 'Mi l0T Pro', 'Mi I0T Pro']),
// LG Devices released in 2020
  DeviceModel(brand: 'LG', model: 'LG Velvet', name: 'LG Velvet', possibleModels: []),
  DeviceModel(brand: 'LG', model: 'LG Wing', name: 'LG Wing', possibleModels: []),
  DeviceModel(brand: 'LG', model: 'LG V60 ThinQ', name: 'LG V60 ThinQ', possibleModels: []),
  DeviceModel(brand: 'LG', model: 'LG K61', name: 'LG K61', possibleModels: []),
  DeviceModel(brand: 'LG', model: 'LG K51S', name: 'LG K51S', possibleModels: []),
  DeviceModel(brand: 'LG', model: 'LG K41S', name: 'LG K41S', possibleModels: []),

  // OnePlus Devices released in 2020
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 8', name: 'OnePlus 8', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 8 Pro', name: 'OnePlus 8 Pro', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord', name: 'OnePlus Nord', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 8T', name: 'OnePlus 8T', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 8R', name: 'OnePlus 8R', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord N10 5G', name: 'OnePlus Nord N10 5G', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord N100', name: 'OnePlus Nord N100', possibleModels: []),

  // Samsung Devices released in 2020
  DeviceModel(brand: 'Samsung', model: 'SM-G980F', name: 'Galaxy S20', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-G981B', name: 'Galaxy S20 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-G985F', name: 'Galaxy S20+', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-G986B', name: 'Galaxy S20+ 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-G988B', name: 'Galaxy S20 Ultra', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A515F', name: 'Galaxy A51', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A715F', name: 'Galaxy A71', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A11', name: 'Galaxy A11', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A31', name: 'Galaxy A31', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A41', name: 'Galaxy A41', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A51', name: 'Galaxy A51', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A71', name: 'Galaxy A71', possibleModels: []),

  // Google Devices
  DeviceModel(brand: 'Google', model: 'Pixel 5', name: 'Pixel 5', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 4a', name: 'Pixel 4a', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 4a 5G', name: 'Pixel 4a 5G', possibleModels: []),

  // Motorola Devices released in 2020
  DeviceModel(brand: 'Motorola', model: 'Moto G Power', name: 'Moto G Power (2020)', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G Stylus', name: 'Moto G Stylus (2020)', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto Edge', name: 'Moto Edge', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto Edge Plus', name: 'Moto Edge Plus', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto One 5G', name: 'Moto One 5G', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G Fast', name: 'Moto G Fast', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto E (2020)', name: 'Moto E (2020)', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G 5G Plus', name: 'Moto G 5G Plus', possibleModels: []),

  // Oppo Devices released in 2020
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X2', name: 'Oppo Find X2', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X2 Pro', name: 'Oppo Find X2 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno4', name: 'Oppo Reno4', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno4 Pro', name: 'Oppo Reno4 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo A53', name: 'Oppo A53 (2020)', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo A72', name: 'Oppo A72 (2020)', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo F17', name: 'Oppo F17', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo F17 Pro', name: 'Oppo F17 Pro', possibleModels: []),

  // Vivo Devices released in 2020
  DeviceModel(brand: 'Vivo', model: 'Vivo V19', name: 'Vivo V19', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X50', name: 'Vivo X50', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo Y30', name: 'Vivo Y30', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo Y50', name: 'Vivo Y50', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V19 Neo', name: 'Vivo V19 Neo', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X50 Pro', name: 'Vivo X50 Pro', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X50e', name: 'Vivo X50e', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V20', name: 'Vivo V20', possibleModels: []),

  // Asus Devices released in 2020
  DeviceModel(brand: 'Asus', model: 'ZenFone 7', name: 'ZenFone 7', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ZenFone 7 Pro', name: 'ZenFone 7 Pro', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ZenFone 6Z', name: 'ZenFone 6Z', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 3', name: 'ROG Phone 3', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ZenFone 6', name: 'ZenFone 6', possibleModels: []),

  // Realme Devices released in 2020
  DeviceModel(brand: 'Realme', model: 'Realme 7', name: 'Realme 7', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme 7 Pro', name: 'Realme 7 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme Narzo 20 Pro', name: 'Realme Narzo 20 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme X50 Pro', name: 'Realme X50 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme Narzo 20A', name: 'Realme Narzo 20A', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme Narzo 20', name: 'Realme Narzo 20', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme X3 SuperZoom', name: 'Realme X3 SuperZoom', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme X3', name: 'Realme X3', possibleModels: []),

  // Sony Devices released in 2020
  DeviceModel(brand: 'Sony', model: 'Xperia 1 II', name: 'Xperia 1 II', possibleModels: []),
  DeviceModel(brand: 'Sony', model: 'Xperia 10 II', name: 'Xperia 10 II', possibleModels: []),
  DeviceModel(brand: 'Sony', model: 'Xperia L4', name: 'Xperia L4', possibleModels: []),

  // 2021
  // Huawei Devices released in 2021
  DeviceModel(brand: 'Huawei', model: 'P50', name: 'Huawei P50', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'P50 Pro', name: 'Huawei P50 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'P50E', name: 'Huawei P50E', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 40E', name: 'Huawei Mate 40E', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 40 Pro', name: 'Huawei Mate 40 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 40 Pro+', name: 'Huawei Mate 40 Pro+', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 8', name: 'Huawei Nova 8', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 9', name: 'Huawei Nova 9', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 9 Pro', name: 'Huawei Nova 9 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'P50 Pocket', name: 'Huawei P50 Pocket', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate X2', name: 'Huawei Mate X2', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Huawei Y7a', name: 'Huawei Y7a', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Y9a', name: 'Huawei Y9a', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Y9a 2021', name: 'Huawei Y9a 2021', possibleModels: []),

  // Xiaomi Devices released in 2021
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 10', name: 'Redmi Note 10', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 10 Pro', name: 'Redmi Note 10 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 10S', name: 'Redmi Note 10S', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 10 5G', name: 'Redmi Note 10 5G', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 10 5G Pro', name: 'Redmi Note 10 5G Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi Mi 11', name: 'Xiaomi Mi 11', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi Mi 11 Ultra', name: 'Xiaomi Mi 11 Ultra', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi Mi 11i', name: 'Xiaomi Mi 11i', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi Mi 11X Pro', name: 'Xiaomi Mi 11X Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K40', name: 'Redmi K40', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K40 Pro', name: 'Redmi K40 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K40 Pro+', name: 'Redmi K40 Pro+', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K40 Gaming', name: 'Redmi K40 Gaming', possibleModels: []),

  // LG Devices released in 2021
  DeviceModel(brand: 'LG', model: 'LG Wing 5G', name: 'LG Wing 5G', possibleModels: []),
  DeviceModel(brand: 'LG', model: 'LG V70 ThinQ', name: 'LG V70 ThinQ', possibleModels: []),
  DeviceModel(brand: 'LG', model: 'LG K92 5G', name: 'LG K92 5G', possibleModels: []),
  DeviceModel(brand: 'LG', model: 'LG Q52', name: 'LG Q52', possibleModels: []),
  DeviceModel(brand: 'LG', model: 'LG Velvet 5G', name: 'LG Velvet 5G', possibleModels: []),

  // OnePlus Devices released in 2021
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 9', name: 'OnePlus 9', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 9 Pro', name: 'OnePlus 9 Pro', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 9R', name: 'OnePlus 9R', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord 2', name: 'OnePlus Nord 2', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord CE 5G', name: 'OnePlus Nord CE 5G', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 9RT', name: 'OnePlus 9RT', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord 100', name: 'OnePlus Nord 100', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord 200 5G', name: 'OnePlus Nord 200 5G', possibleModels: []),

  // Samsung Devices released in 2021
  DeviceModel(brand: 'Samsung', model: 'SM-G991B', name: 'Galaxy S21', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-G996B', name: 'Galaxy S21+', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-G998B', name: 'Galaxy S21 Ultra', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A525F', name: 'Galaxy A52', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A725F', name: 'Galaxy A72', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-F711B', name: 'Galaxy Z Flip 3', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-F926B', name: 'Galaxy Z Fold 3', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-G780G', name: 'Galaxy S20 FE 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A032F', name: 'Galaxy A03', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-A125F', name: 'Galaxy A12', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-G775F', name: 'Galaxy S20 FE', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'SM-F716B', name: 'Galaxy Z Flip 3 Bespoke Edition', possibleModels: []),

  // Google Devices released in 2021
  DeviceModel(brand: 'Google', model: 'Pixel 6', name: 'Pixel 6', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 6 Pro', name: 'Pixel 6 Pro', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 5a 5G', name: 'Pixel 5a 5G', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 5', name: 'Pixel 5', possibleModels: []),

  // Motorola Devices
  DeviceModel(brand: 'Motorola', model: 'Moto G100', name: 'Moto G100', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto Edge 20', name: 'Moto Edge 20', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto Edge 20 Pro', name: 'Moto Edge 20 Pro', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G200', name: 'Moto G200', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto Edge 20 Lite', name: 'Moto Edge 20 Lite', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G50 5G', name: 'Moto G50 5G', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto E 2021', name: 'Moto E 2021', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G60', name: 'Moto G60', possibleModels: []),

  // Oppo Devices
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X3', name: 'Oppo Find X3', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X3 Pro', name: 'Oppo Find X3 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno6', name: 'Oppo Reno6', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno6 Pro', name: 'Oppo Reno6 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno6 5G', name: 'Oppo Reno6 5G', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo F19 Pro', name: 'Oppo F19 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo F19', name: 'Oppo F19', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo A95', name: 'Oppo A95', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo A74 5G', name: 'Oppo A74 5G', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo A53s 5G', name: 'Oppo A53s 5G', possibleModels: []),

  // Vivo Devices
  DeviceModel(brand: 'Vivo', model: 'Vivo V21', name: 'Vivo V21', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X60', name: 'Vivo X60', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X60 Pro', name: 'Vivo X60 Pro', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V21e', name: 'Vivo V21e', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V21 5G', name: 'Vivo V21 5G', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X70', name: 'Vivo X70', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X70 Pro', name: 'Vivo X70 Pro', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo Y20T', name: 'Vivo Y20T', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo Y31s', name: 'Vivo Y31s', possibleModels: []),

  // Realme Devices
  DeviceModel(brand: 'Realme', model: 'Realme GT', name: 'Realme GT', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme GT Master Edition', name: 'Realme GT Master Edition', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme 8 Pro', name: 'Realme 8 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme GT 5G', name: 'Realme GT 5G', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme 8 5G', name: 'Realme 8 5G', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme Narzo 30 Pro', name: 'Realme Narzo 30 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme Narzo 30A', name: 'Realme Narzo 30A', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme X7 Pro', name: 'Realme X7 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme X7', name: 'Realme X7', possibleModels: []),

  // Asus Devices
  DeviceModel(brand: 'Asus', model: 'ZenFone 8', name: 'ZenFone 8', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ZenFone 8 Flip', name: 'ZenFone 8 Flip', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 5', name: 'ROG Phone 5', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 5 Pro', name: 'ROG Phone 5 Pro', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 5 Ultimate', name: 'ROG Phone 5 Ultimate', possibleModels: []),

  // Sony Devices
  DeviceModel(brand: 'Sony', model: 'Xperia 1 III', name: 'Xperia 1 III', possibleModels: []),
  DeviceModel(brand: 'Sony', model: 'Xperia 5 III', name: 'Xperia 5 III', possibleModels: []),
  DeviceModel(brand: 'Sony', model: 'Xperia 10 III', name: 'Xperia 10 III', possibleModels: []),
  DeviceModel(brand: 'Sony', model: 'Xperia Pro-I', name: 'Xperia Pro-I', possibleModels: []),

  // TCL Devices
  DeviceModel(brand: 'TCL', model: 'TCL 20 Pro 5G', name: 'TCL 20 Pro 5G', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 20 5G', name: 'TCL 20 5G', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 20L', name: 'TCL 20L', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 20L+', name: 'TCL 20L+', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 20 SE', name: 'TCL 20 SE', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 20Y', name: 'TCL 20Y', possibleModels: []),


  // Huawei Devices
  DeviceModel(brand: 'Huawei', model: 'P50 Pro', name: 'Huawei P50 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'P50E', name: 'Huawei P50E', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 50', name: 'Huawei Mate 50', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 50 Pro', name: 'Huawei Mate 50 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 50 RS Porsche Design', name: 'Huawei Mate 50 RS Porsche Design', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 10', name: 'Huawei Nova 10', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 10 Pro', name: 'Huawei Nova 10 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 10 SE', name: 'Huawei Nova 10 SE', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova Y90', name: 'Huawei Nova Y90', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova Y70', name: 'Huawei Nova Y70', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova Y70 Plus', name: 'Huawei Nova Y70 Plus', possibleModels: []),

  // Xiaomi Devices
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 12', name: 'Xiaomi 12', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 12 Pro', name: 'Xiaomi 12 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 12X', name: 'Xiaomi 12X', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 12S', name: 'Xiaomi 12S', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 12S Pro', name: 'Xiaomi 12S Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 12S Ultra', name: 'Xiaomi 12S Ultra', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 11', name: 'Redmi Note 11', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 11 Pro', name: 'Redmi Note 11 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 11 Pro+ 5G', name: 'Redmi Note 11 Pro+ 5G', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K50', name: 'Redmi K50', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K50 Pro', name: 'Redmi K50 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K50 Gaming', name: 'Redmi K50 Gaming', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi 10C', name: 'Redmi 10C', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Poco F4', name: 'Poco F4', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Poco X4 Pro 5G', name: 'Poco X4 Pro 5G', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Mi MIX 4', name: 'Mi MIX 4', possibleModels: []),

  // OnePlus Devices
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 10 Pro', name: 'OnePlus 10 Pro', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 10T', name: 'OnePlus 10T', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Ace', name: 'OnePlus Ace', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Ace Pro', name: 'OnePlus Ace Pro', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord 2T', name: 'OnePlus Nord 2T', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord CE 2', name: 'OnePlus Nord CE 2', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord CE 2 Lite', name: 'OnePlus Nord CE 2 Lite', possibleModels: []),

  // Samsung Devices
  DeviceModel(brand: 'Samsung', model: 'Galaxy S22', name: 'Samsung Galaxy S22', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy S22+', name: 'Samsung Galaxy S22+', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy S22 Ultra', name: 'Samsung Galaxy S22 Ultra', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy Z Flip 4', name: 'Samsung Galaxy Z Flip 4', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy Z Fold 4', name: 'Samsung Galaxy Z Fold 4', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy A53 5G', name: 'Samsung Galaxy A53 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy A73 5G', name: 'Samsung Galaxy A73 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy A33 5G', name: 'Samsung Galaxy A33 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy M13', name: 'Samsung Galaxy M13', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy M23 5G', name: 'Samsung Galaxy M23 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy M53 5G', name: 'Samsung Galaxy M53 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy XCover6 Pro', name: 'Samsung Galaxy XCover6 Pro', possibleModels: []),

  // Google Devices
  DeviceModel(brand: 'Google', model: 'Pixel 6a', name: 'Google Pixel 6a', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 7', name: 'Google Pixel 7', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 7 Pro', name: 'Google Pixel 7 Pro', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel Tablet (Developer Preview)', name: 'Google Pixel Tablet (Developer Preview)', possibleModels: []),

  // Oppo Devices
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X5', name: 'Oppo Find X5', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X5 Pro', name: 'Oppo Find X5 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X5 Lite', name: 'Oppo Find X5 Lite', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno8', name: 'Oppo Reno8', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno8 Pro', name: 'Oppo Reno8 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno8 Pro+', name: 'Oppo Reno8 Pro+', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo A77 5G', name: 'Oppo A77 5G', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo A57 5G', name: 'Oppo A57 5G', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo K10 5G', name: 'Oppo K10 5G', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo K10 Pro', name: 'Oppo K10 Pro', possibleModels: []),

  // Vivo Devices
  DeviceModel(brand: 'Vivo', model: 'Vivo X80', name: 'Vivo X80', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X80 Pro', name: 'Vivo X80 Pro', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X Fold', name: 'Vivo X Fold', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X Note', name: 'Vivo X Note', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V23e', name: 'Vivo V23e', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V23 5G', name: 'Vivo V23 5G', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo T1 5G', name: 'Vivo T1 5G', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo T1 Pro', name: 'Vivo T1 Pro', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo Y75 5G', name: 'Vivo Y75 5G', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo Y77', name: 'Vivo Y77', possibleModels: []),

  // Realme Devices
  DeviceModel(brand: 'Realme', model: 'Realme GT 2 Pro', name: 'Realme GT 2 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme GT 2', name: 'Realme GT 2', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme 9 Pro+', name: 'Realme 9 Pro+', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme 9 Pro', name: 'Realme 9 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme 9i', name: 'Realme 9i', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme Narzo 50 5G', name: 'Realme Narzo 50 5G', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme Narzo 50 Pro 5G', name: 'Realme Narzo 50 Pro 5G', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme C35', name: 'Realme C35', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme C55', name: 'Realme C55', possibleModels: []),

  // Motorola Devices
  DeviceModel(brand: 'Motorola', model: 'Motorola Edge 30', name: 'Motorola Edge 30', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Edge 30 Pro', name: 'Motorola Edge 30 Pro', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola G200', name: 'Motorola G200', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Edge 20', name: 'Motorola Edge 20', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Edge 20 Pro', name: 'Motorola Edge 20 Pro', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola G71 5G', name: 'Motorola G71 5G', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola G51 5G', name: 'Motorola G51 5G', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola G62 5G', name: 'Motorola G62 5G', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Moto E32', name: 'Motorola Moto E32', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Moto G22', name: 'Motorola Moto G22', possibleModels: []),

  // Asus Devices
  DeviceModel(brand: 'Asus', model: 'ZenFone 9', name: 'Asus ZenFone 9', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 6', name: 'Asus ROG Phone 6', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 6 Pro', name: 'Asus ROG Phone 6 Pro', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ZenFone 8', name: 'Asus ZenFone 8', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ZenFone 8 Flip', name: 'Asus ZenFone 8 Flip', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 5S', name: 'Asus ROG Phone 5S', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 5S Pro', name: 'Asus ROG Phone 5S Pro', possibleModels: []),

  // TCL Devices
  DeviceModel(brand: 'TCL', model: 'TCL 30 5G', name: 'TCL 30 5G', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 20 Pro 5G', name: 'TCL 20 Pro 5G', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 20 SE', name: 'TCL 20 SE', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 30 XE 5G', name: 'TCL 30 XE 5G', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 20 5G', name: 'TCL 20 5G', possibleModels: []),

  // Infinix Devices
  DeviceModel(brand: 'Infinix', model: 'Infinix Zero 5G', name: 'Infinix Zero 5G', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Infinix Note 12', name: 'Infinix Note 12', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Infinix Zero Ultra', name: 'Infinix Zero Ultra', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Infinix Zero 20', name: 'Infinix Zero 20', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Infinix Hot 12', name: 'Infinix Hot 12', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Infinix Hot 12 Play', name: 'Infinix Hot 12 Play', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Infinix Note 12 Pro', name: 'Infinix Note 12 Pro', possibleModels: []),

  // Honor Devices
  DeviceModel(brand: 'Honor', model: 'Honor Magic4 Pro', name: 'Honor Magic4 Pro', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Honor X8', name: 'Honor X8', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Honor Magic4', name: 'Honor Magic4', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Honor 70', name: 'Honor 70', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Honor 70 Pro', name: 'Honor 70 Pro', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Honor 70 Pro+', name: 'Honor 70 Pro+', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Honor X9', name: 'Honor X9', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Honor X9 5G', name: 'Honor X9 5G', possibleModels: []),

  // 2023
  // Huawei Devices
  DeviceModel(brand: 'Huawei', model: 'P60', name: 'Huawei P60', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'P60 Pro', name: 'Huawei P60 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 60', name: 'Huawei Mate 60', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 60 Pro', name: 'Huawei Mate 60 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 60 Pro Plus', name: 'Huawei Mate 60 Pro Plus', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate X3', name: 'Huawei Mate X3', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 11', name: 'Huawei Nova 11', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 11 Pro', name: 'Huawei Nova 11 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 11 Ultra', name: 'Huawei Nova 11 Ultra', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 11i', name: 'Huawei Nova 11i', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 11 SE', name: 'Huawei Nova 11 SE', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 12', name: 'Huawei Nova 12', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 12 Pro', name: 'Huawei Nova 12 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 12 Ultra', name: 'Huawei Nova 12 Ultra', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova Y91', name: 'Huawei Nova Y91', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova Y72', name: 'Huawei Nova Y72', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova Y71', name: 'Huawei Nova Y71', possibleModels: []),

  // Xiaomi Devices
  // Xiaomi 13 Series
  DeviceModel(brand: 'Xiaomi', model: '13', name: 'Xiaomi 13', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: '13 Pro', name: 'Xiaomi 13 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: '13 Ultra', name: 'Xiaomi 13 Ultra', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: '13 Lite', name: 'Xiaomi 13 Lite', possibleModels: []),

  // Xiaomi 13T Series (Global release)
  DeviceModel(brand: 'Xiaomi', model: '13T', name: 'Xiaomi 13T', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: '13T Pro', name: 'Xiaomi 13T Pro', possibleModels: []),

  // Redmi Note 12 Series
  DeviceModel(brand: 'Xiaomi', model: 'Note 12', name: 'Redmi Note 12', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Note 12 Pro', name: 'Redmi Note 12 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Note 12 Pro+', name: 'Redmi Note 12 Pro+', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Note 12 Turbo', name: 'Redmi Note 12 Turbo', possibleModels: []),

  // Redmi K60 Series
  DeviceModel(brand: 'Xiaomi', model: 'K60', name: 'Redmi K60', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'K60 Pro', name: 'Redmi K60 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'K60E', name: 'Redmi K60E', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'K60 Ultra', name: 'Redmi K60 Ultra', possibleModels: []),

  // Poco F5 Series (Global release of K60)
  DeviceModel(brand: 'Xiaomi', model: 'F5 Pro', name: 'Poco F5 Pro', possibleModels: []),

  // OnePlus Devices
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 11', name: 'OnePlus 11', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 11R', name: 'OnePlus 11R', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord CE 3', name: 'OnePlus Nord CE 3', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord 3', name: 'OnePlus Nord 3', possibleModels: []),
  // OnePlus Open (First foldable device)
  DeviceModel(brand: 'OnePlus', model: 'Open', name: 'OnePlus Open', possibleModels: []),

  // Samsung Devices
  // Galaxy S23 Series
  DeviceModel(brand: 'Samsung', model: 'S23', name: 'Samsung Galaxy S23', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'S23+', name: 'Samsung Galaxy S23+', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'S23 Ultra', name: 'Samsung Galaxy S23 Ultra', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'S23 FE', name: 'Samsung Galaxy S23 FE', possibleModels: []),

  // Galaxy Z Series
  DeviceModel(brand: 'Samsung', model: 'Z Flip 5', name: 'Samsung Galaxy Z Flip 5', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Z Fold 5', name: 'Samsung Galaxy Z Fold 5', possibleModels: []),

  // Galaxy A Series
  DeviceModel(brand: 'Samsung', model: 'A54 5G', name: 'Samsung Galaxy A54 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'A74 5G', name: 'Samsung Galaxy A74 5G', possibleModels: []),

  // Galaxy M Series
  DeviceModel(brand: 'Samsung', model: 'M14 5G', name: 'Samsung Galaxy M14 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'M54 5G', name: 'Samsung Galaxy M54 5G', possibleModels: []),


  DeviceModel(brand: 'Samsung', model: 'F14 5G', name: 'Samsung Galaxy F14 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'F54 5G', name: 'Samsung Galaxy F54 5G', possibleModels: []),

  // Galaxy XCover Series
  DeviceModel(brand: 'Samsung', model: 'XCover 6 Pro', name: 'Samsung Galaxy XCover 6 Pro', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'XCover 6', name: 'Samsung Galaxy XCover 6', possibleModels: []),

  // Google Devices
  DeviceModel(brand: 'Google', model: 'Pixel 8', name: 'Google Pixel 8', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 8 Pro', name: 'Google Pixel 8 Pro', possibleModels: []),

  // Pixel Watch 2
  DeviceModel(brand: 'Google', model: 'Pixel Watch 2', name: 'Google Pixel Watch 2', possibleModels: []),

  // Oppo Devices
  // Find X6 Series
  DeviceModel(brand: 'Oppo', model: 'Find X6', name: 'Oppo Find X6', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Find X6 Pro', name: 'Oppo Find X6 Pro', possibleModels: []),

  // Reno 10 Series
  DeviceModel(brand: 'Oppo', model: 'Reno 10', name: 'Oppo Reno 10', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Reno 10 Pro', name: 'Oppo Reno 10 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Reno 10 Pro 5G', name: 'Oppo Reno 10 Pro 5G', possibleModels: []),

  // Oppo F23 Series
  DeviceModel(brand: 'Oppo', model: 'F23', name: 'Oppo F23', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'F23 5G', name: 'Oppo F23 5G', possibleModels: []),

  // Oppo A Series
  DeviceModel(brand: 'Oppo', model: 'A78 5G', name: 'Oppo A78 5G', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'A57 5G', name: 'Oppo A57 5G', possibleModels: []),

  // Vivo Devices
  // X Series
  DeviceModel(brand: 'Vivo', model: 'X90', name: 'Vivo X90', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'X90 Pro', name: 'Vivo X90 Pro', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'X90 Pro+', name: 'Vivo X90 Pro+', possibleModels: []),

  // V Series
  DeviceModel(brand: 'Vivo', model: 'V27', name: 'Vivo V27', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'V27 Pro', name: 'Vivo V27 Pro', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'V27e', name: 'Vivo V27e', possibleModels: []),

  // Y Series
  DeviceModel(brand: 'Vivo', model: 'Y200 5G', name: 'Vivo Y200 5G', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Y200e 5G', name: 'Vivo Y200e 5G', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Y100', name: 'Vivo Y100', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Y100e', name: 'Vivo Y100e', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Y36', name: 'Vivo Y36', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Y39 5G', name: 'Vivo Y39 5G', possibleModels: []),

  // Realme Devices
  // GT Series
  DeviceModel(brand: 'Realme', model: 'GT 3', name: 'Realme GT 3', possibleModels: []),

  // 11 Series
  DeviceModel(brand: 'Realme', model: '11', name: 'Realme 11', possibleModels: []),
  DeviceModel(brand: 'Realme', model: '11 Pro', name: 'Realme 11 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: '11 Pro+', name: 'Realme 11 Pro+', possibleModels: []),

  // Narzo Series
  DeviceModel(brand: 'Realme', model: 'Narzo 60', name: 'Realme Narzo 60', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Narzo 60 5G', name: 'Realme Narzo 60 5G', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Narzo 60 Pro', name: 'Realme Narzo 60 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Narzo 60 Pro 5G', name: 'Realme Narzo 60 Pro 5G', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Narzo 60x', name: 'Realme Narzo 60x', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Narzo 60x 5G', name: 'Realme Narzo 60x 5G', possibleModels: []),

  // Motorola Devices
  // Edge Series
  DeviceModel(brand: 'Motorola', model: 'Edge 40', name: 'Motorola Edge 40', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Edge 40 Pro', name: 'Motorola Edge 40 Pro', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Edge 40 Neo', name: 'Motorola Edge 40 Neo', possibleModels: []),

  // Moto G Series
  DeviceModel(brand: 'Motorola', model: 'Moto G73', name: 'Motorola Moto G73', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G73 5G', name: 'Motorola Moto G73 5G', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G53', name: 'Motorola Moto G53', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G53 5G', name: 'Motorola Moto G53 5G', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G13', name: 'Motorola Moto G13', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G23', name: 'Motorola Moto G23', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G33', name: 'Motorola Moto G33', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G43', name: 'Motorola Moto G43', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G53 5G', name: 'Motorola Moto G53 5G', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Moto G73 5G', name: 'Motorola Moto G73 5G', possibleModels: []),

  // Asus Devices
  // ZenFone Series
  DeviceModel(brand: 'Asus', model: 'ZenFone 10', name: 'Asus ZenFone 10', possibleModels: []),

  // ROG Phone Series
  DeviceModel(brand: 'Asus', model: 'ROG Phone 7', name: 'Asus ROG Phone 7', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 7 Ultimate', name: 'Asus ROG Phone 7 Ultimate', possibleModels: []),

  // TCL Devices
  // 40 Series
  DeviceModel(brand: 'TCL', model: '40 5G', name: 'TCL 40 5G', possibleModels: []),
  DeviceModel(brand: 'TCL', model: '40 SE', name: 'TCL 40 SE', possibleModels: []),
  DeviceModel(brand: 'TCL', model: '40 XE 5G', name: 'TCL 40 XE 5G', possibleModels: []),
  DeviceModel(brand: 'TCL', model: '40 X 5G', name: 'TCL 40 X 5G', possibleModels: []),
  DeviceModel(brand: 'TCL', model: '40 XL', name: 'TCL 40 XL', possibleModels: []),
  DeviceModel(brand: 'TCL', model: '40 NXTPAPER', name: 'TCL 40 NXTPAPER', possibleModels: []),
  DeviceModel(brand: 'TCL', model: '40 NXTPAPER 5G', name: 'TCL 40 NXTPAPER 5G', possibleModels: []),

  // Infinix Devices
  // Zero Series
  DeviceModel(brand: 'Infinix', model: 'Zero 30', name: 'Infinix Zero 30', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Zero 30 5G', name: 'Infinix Zero 30 5G', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Zero 30 4G', name: 'Infinix Zero 30 4G', possibleModels: []),

  // Note Series
  DeviceModel(brand: 'Infinix', model: 'Note 30', name: 'Infinix Note 30', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Note 30 5G', name: 'Infinix Note 30 5G', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Note 30 4G', name: 'Infinix Note 30 4G', possibleModels: []),

  // Honor Devices
  // Magic Series
  DeviceModel(brand: 'Honor', model: 'Magic5 Pro', name: 'Honor Magic5 Pro', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Magic5', name: 'Honor Magic5', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Magic5 Lite', name: 'Honor Magic5 Lite', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Magic5 Ultimate', name: 'Honor Magic5 Ultimate', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Magic6', name: 'Honor Magic6', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Magic6 Pro', name: 'Honor Magic6 Pro', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Magic6 Ultimate', name: 'Honor Magic6 Ultimate', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Magic V2', name: 'Honor Magic V2', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Magic V3', name: 'Honor Magic V3', possibleModels: []),

  // 90 Series
  DeviceModel(brand: 'Honor', model: '90', name: 'Honor 90', possibleModels: []),
  DeviceModel(brand: 'Honor', model: '90 Pro', name: 'Honor 90 Pro', possibleModels: []),
  DeviceModel(brand: 'Honor', model: '90 Lite', name: 'Honor 90 Lite', possibleModels: []),
  DeviceModel(brand: 'Honor', model: '90 GT', name: 'Honor 90 GT', possibleModels: []),
  DeviceModel(brand: 'Honor', model: '90 Smart', name: 'Honor 90 Smart', possibleModels: []),

  // 100 Series
  DeviceModel(brand: 'Honor', model: '100', name: 'Honor 100', possibleModels: []),
  DeviceModel(brand: 'Honor', model: '100 Pro', name: 'Honor 100 Pro', possibleModels: []),

  // X Series
  DeviceModel(brand: 'Honor', model: 'X5', name: 'Honor X5', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X5 Plus', name: 'Honor X5 Plus', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X6a', name: 'Honor X6a', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X7a', name: 'Honor X7a', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X7b', name: 'Honor X7b', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X8a', name: 'Honor X8a', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X8b', name: 'Honor X8b', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X9a', name: 'Honor X9a', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X9b', name: 'Honor X9b', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X9c', name: 'Honor X9c', possibleModels: []),

  // Play Series
  DeviceModel(brand: 'Honor', model: 'Play 30M 5G', name: 'Honor Play 30M 5G', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Play 40', name: 'Honor Play 40', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Play 40 Plus', name: 'Honor Play 40 Plus', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Play 50 Plus', name: 'Honor Play 50 Plus', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Play 8T', name: 'Honor Play 8T', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Play 7T', name: 'Honor Play 7T', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Play 7T Pro', name: 'Honor Play 7T Pro', possibleModels: []),

  // V Series
  DeviceModel(brand: 'Honor', model: 'V Purse', name: 'Honor V Purse', possibleModels: []),

  // Other Models
  DeviceModel(brand: 'Honor', model: 'X50', name: 'Honor X50', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X50 Pro', name: 'Honor X50 Pro', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X50i', name: 'Honor X50i', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X50i+', name: 'Honor X50i+', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X6a', name: 'Honor X6a', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X7a', name: 'Honor X7a', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X7b', name: 'Honor X7b', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X8a', name: 'Honor X8a', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X8b', name: 'Honor X8b', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X9a', name: 'Honor X9a', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X9b', name: 'Honor X9b', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'X9c', name: 'Honor X9c', possibleModels: []),

  // 2024
  // Huawei Devices
  DeviceModel(brand: 'Huawei', model: 'Pura 70', name: 'Huawei Pura 70', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Pura 70 Pro', name: 'Huawei Pura 70 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Pura 70 Pro Plus', name: 'Huawei Pura 70 Pro Plus', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Pura 70 Ultra', name: 'Huawei Pura 70 Ultra', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 70', name: 'Huawei Mate 70', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 70 Pro', name: 'Huawei Mate 70 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 70 Pro+', name: 'Huawei Mate 70 Pro+', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 70 RS Ultimate Design', name: 'Huawei Mate 70 RS Ultimate Design', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate XT', name: 'Huawei Mate XT', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate X6', name: 'Huawei Mate X6', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 13', name: 'Huawei Nova 13', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 13 Pro', name: 'Huawei Nova 13 Pro', possibleModels: []),

  // Xiaomi Devices
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 14', name: 'Xiaomi 14', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 14 Pro', name: 'Xiaomi 14 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 14 Ultra', name: 'Xiaomi 14 Ultra', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 14T Pro', name: 'Xiaomi 14T Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 14T', name: 'Xiaomi 14T', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K70 Ultra', name: 'Redmi K70 Ultra', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K70 Pro', name: 'Redmi K70 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K70', name: 'Redmi K70', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K70E', name: 'Redmi K70E', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 13 Pro+', name: 'Redmi Note 13 Pro+', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 13 Pro', name: 'Redmi Note 13 Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 13', name: 'Redmi Note 13', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 13R Pro', name: 'Redmi Note 13R Pro', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 13R', name: 'Redmi Note 13R', possibleModels: []),

  // OnePlus Devices
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 12', name: 'OnePlus 12', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 12 Pro', name: 'OnePlus 12 Pro', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord CE 4', name: 'OnePlus Nord CE 4', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord 4', name: 'OnePlus Nord 4', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 12R', name: 'OnePlus 12R', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 12 Ultra', name: 'OnePlus 12 Ultra', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 12X', name: 'OnePlus 12X', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord CE 4 Lite', name: 'OnePlus Nord CE 4 Lite', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord 4 Pro', name: 'OnePlus Nord 4 Pro', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord 4 Ultra', name: 'OnePlus Nord 4 Ultra', possibleModels: []),

  // Samsung Devices
  DeviceModel(brand: 'Samsung', model: 'Galaxy S24', name: 'Samsung Galaxy S24', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy S24+', name: 'Samsung Galaxy S24+', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy S24 Ultra', name: 'Samsung Galaxy S24 Ultra', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy Z Flip 6', name: 'Samsung Galaxy Z Flip 6', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy Z Fold 6', name: 'Samsung Galaxy Z Fold 6', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy A84 5G', name: 'Samsung Galaxy A84 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy A94 5G', name: 'Samsung Galaxy A94 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy M24', name: 'Samsung Galaxy M24', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy M34 5G', name: 'Samsung Galaxy M34 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy F24 5G', name: 'Samsung Galaxy F24 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy F34 5G', name: 'Samsung Galaxy F34 5G', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy XCover 7', name: 'Samsung Galaxy XCover 7', possibleModels: []),

  // Google Devices
  DeviceModel(brand: 'Google', model: 'Pixel 9', name: 'Google Pixel 9', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 9 Pro', name: 'Google Pixel 9 Pro', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 9a', name: 'Google Pixel 9a', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 9 XL', name: 'Google Pixel 9 XL', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 9 Ultra', name: 'Google Pixel 9 Ultra', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel Fold 2', name: 'Google Pixel Fold 2', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 9 Lite', name: 'Google Pixel 9 Lite', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 9 5G', name: 'Google Pixel 9 5G', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 9a Pro', name: 'Google Pixel 9a Pro', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 9 Mini', name: 'Google Pixel 9 Mini', possibleModels: []),

  // Oppo Devices
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X7', name: 'Oppo Find X7', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X7 Pro', name: 'Oppo Find X7 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno11', name: 'Oppo Reno11', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno11 Pro', name: 'Oppo Reno11 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo A78', name: 'Oppo A78', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo A98', name: 'Oppo A98', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo F24', name: 'Oppo F24', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo F34', name: 'Oppo F34', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X7 Lite', name: 'Oppo Find X7 Lite', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno11 Lite', name: 'Oppo Reno11 Lite', possibleModels: []),

  // Vivo Devices
  DeviceModel(brand: 'Vivo', model: 'Vivo X100', name: 'Vivo X100', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X100 Pro', name: 'Vivo X100 Pro', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V30', name: 'Vivo V30', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V30 Pro', name: 'Vivo V30 Pro', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V30e', name: 'Vivo V30e', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V30 Lite', name: 'Vivo V30 Lite', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X100 Lite', name: 'Vivo X100 Lite', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V30 Ultra', name: 'Vivo V30 Ultra', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X100 Pro Plus', name: 'Vivo X100 Pro Plus', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo Y100', name: 'Vivo Y100', possibleModels: []),

  // Realme Devices
  DeviceModel(brand: 'Realme', model: 'Realme GT 4', name: 'Realme GT 4', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme 12 Pro+', name: 'Realme 12 Pro+', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme GT 4 Pro', name: 'Realme GT 4 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme 12', name: 'Realme 12', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme 12 Pro', name: 'Realme 12 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme Narzo 70', name: 'Realme Narzo 70', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme Narzo 70 Pro', name: 'Realme Narzo 70 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme X50', name: 'Realme X50', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme X50 Pro', name: 'Realme X50 Pro', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme GT 4 Lite', name: 'Realme GT 4 Lite', possibleModels: []),

  // Motorola Devices
  DeviceModel(brand: 'Motorola', model: 'Motorola Edge 50', name: 'Motorola Edge 50', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Moto G100', name: 'Motorola Moto G100', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Edge 50 Pro', name: 'Motorola Edge 50 Pro', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Moto G200', name: 'Motorola Moto G200', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Edge 50 Ultra', name: 'Motorola Edge 50 Ultra', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Moto G40', name: 'Motorola Moto G40', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Moto G60', name: 'Motorola Moto G60', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Edge 50 Lite', name: 'Motorola Edge 50 Lite', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Razr 2024', name: 'Motorola Razr 2024', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Moto Edge X', name: 'Motorola Moto Edge X', possibleModels: []),

  // Asus Devices
  DeviceModel(brand: 'Asus', model: 'Zenfone 11 Ultra', name: 'Asus Zenfone 11 Ultra', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 8', name: 'Asus ROG Phone 8', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 8 Pro', name: 'Asus ROG Phone 8 Pro', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 8 Pro Edition', name: 'Asus ROG Phone 8 Pro Edition', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 9', name: 'Asus ROG Phone 9', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 9 Pro', name: 'Asus ROG Phone 9 Pro', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 9 Pro Edition', name: 'Asus ROG Phone 9 Pro Edition', possibleModels: []),

  // stop here for 04/26/2025
  // TCL Devices
  DeviceModel(brand: 'TCL', model: 'TCL 50 5G', name: 'TCL 50 5G', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 50 SE', name: 'TCL 50 SE', possibleModels: []),

  // Infinix Devices
  DeviceModel(brand: 'Infinix', model: 'Infinix Zero 40', name: 'Infinix Zero 40', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Infinix Note 40', name: 'Infinix Note 40', possibleModels: []),

  // Honor Devices
  DeviceModel(brand: 'Honor', model: 'Honor Magic6 Pro', name: 'Honor Magic6 Pro', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Honor 100', name: 'Honor 100', possibleModels: []),

  // 2025
  // Huawei Devices
  // Existing entries
  DeviceModel(brand: 'Huawei', model: 'P80 Pro', name: 'Huawei P80 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 80 Pro', name: 'Huawei Mate 80 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 13', name: 'Huawei Nova 13', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 13 Pro', name: 'Huawei Nova 13 Pro', possibleModels: []),

  // Confirmed 2025 releases
  DeviceModel(brand: 'Huawei', model: 'Mate 70', name: 'Huawei Mate 70', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 70 Pro', name: 'Huawei Mate 70 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 70 Pro Plus', name: 'Huawei Mate 70 Pro Plus', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate 70 RS', name: 'Huawei Mate 70 RS', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate X6', name: 'Huawei Mate X6', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Mate XT Ultimate', name: 'Huawei Mate XT Ultimate', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 14', name: 'Huawei Nova 14', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Nova 14 Pro', name: 'Huawei Nova 14 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Pocket 3', name: 'Huawei Pocket 3', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Pura 80', name: 'Huawei Pura 80', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Pura 80 Pro', name: 'Huawei Pura 80 Pro', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Pura 80 Pro+', name: 'Huawei Pura 80 Pro+', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Pura 80 Ultra', name: 'Huawei Pura 80 Ultra', possibleModels: []),
  DeviceModel(brand: 'Huawei', model: 'Pura X', name: 'Huawei Pura X', possibleModels: []),

  // Xiaomi Devices
  // Xiaomi 15 Series
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 15 Ultra', name: 'Xiaomi 15 Ultra', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Xiaomi 15', name: 'Xiaomi 15', possibleModels: []),

  // Redmi Note 14 Series
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 14 4G', name: 'Redmi Note 14 4G', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 14 5G', name: 'Redmi Note 14 5G', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 14 Pro 4G', name: 'Redmi Note 14 Pro 4G', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 14 Pro 5G', name: 'Redmi Note 14 Pro 5G', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi Note 14 Pro+ 5G', name: 'Redmi Note 14 Pro+ 5G', possibleModels: []),

  // Redmi K80 Series
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K80', name: 'Redmi K80', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'Redmi K80 Pro', name: 'Redmi K80 Pro', possibleModels: []),

  // POCO X7 Series
  DeviceModel(brand: 'Xiaomi', model: 'POCO X7', name: 'POCO X7', possibleModels: []),
  DeviceModel(brand: 'Xiaomi', model: 'POCO X7 Pro', name: 'POCO X7 Pro', possibleModels: []),

  // OnePlus 13 Series
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 13', name: 'OnePlus 13', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 13R', name: 'OnePlus 13R', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 13T', name: 'OnePlus 13T', possibleModels: []),

  // OnePlus Nord Series
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord 5', name: 'OnePlus Nord 5', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Nord 5 Pro', name: 'OnePlus Nord 5 Pro', possibleModels: []),

  // OnePlus Ace Series (China-exclusive)
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Ace 5S', name: 'OnePlus Ace 5S', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Ace 5V', name: 'OnePlus Ace 5V', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Ace 6', name: 'OnePlus Ace 6', possibleModels: []),
  DeviceModel(brand: 'OnePlus', model: 'OnePlus Ace 6 Pro', name: 'OnePlus Ace 6 Pro', possibleModels: []),

  // Upcoming Flagship
  DeviceModel(brand: 'OnePlus', model: 'OnePlus 15', name: 'OnePlus 15', possibleModels: []),


  // Galaxy S25 Series
  DeviceModel(brand: 'Samsung', model: 'Galaxy S25', name: 'Samsung Galaxy S25', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy S25+', name: 'Samsung Galaxy S25+', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy S25 Ultra', name: 'Samsung Galaxy S25 Ultra', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy S25 Edge', name: 'Samsung Galaxy S25 Edge', possibleModels: []),

  // Galaxy Z Series
  DeviceModel(brand: 'Samsung', model: 'Galaxy Z Flip 7', name: 'Samsung Galaxy Z Flip 7', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy Z Fold 7', name: 'Samsung Galaxy Z Fold 7', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy Z Flip FE', name: 'Samsung Galaxy Z Flip FE', possibleModels: []),

  // Galaxy A Series
  DeviceModel(brand: 'Samsung', model: 'Galaxy A100', name: 'Samsung Galaxy A100', possibleModels: []),
  DeviceModel(brand: 'Samsung', model: 'Galaxy A110', name: 'Samsung Galaxy A110', possibleModels: []),

  // Google Devices
  DeviceModel(brand: 'Google', model: 'Pixel 10', name: 'Google Pixel 10', possibleModels: []),
  DeviceModel(brand: 'Google', model: 'Pixel 10 Pro', name: 'Google Pixel 10 Pro', possibleModels: []),

  // Oppo Devices
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X8', name: 'Oppo Find X8', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Find X8 Pro', name: 'Oppo Find X8 Pro', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno12', name: 'Oppo Reno12', possibleModels: []),
  DeviceModel(brand: 'Oppo', model: 'Oppo Reno12 Pro', name: 'Oppo Reno12 Pro', possibleModels: []),

  // Vivo Devices
  DeviceModel(brand: 'Vivo', model: 'Vivo X110', name: 'Vivo X110', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo X110 Pro', name: 'Vivo X110 Pro', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V40', name: 'Vivo V40', possibleModels: []),
  DeviceModel(brand: 'Vivo', model: 'Vivo V40 Pro', name: 'Vivo V40 Pro', possibleModels: []),

  // Realme Devices
  DeviceModel(brand: 'Realme', model: 'Realme GT 5', name: 'Realme GT 5', possibleModels: []),
  DeviceModel(brand: 'Realme', model: 'Realme 13 Pro+', name: 'Realme 13 Pro+', possibleModels: []),

  // Motorola Devices
  DeviceModel(brand: 'Motorola', model: 'Motorola Edge 60', name: 'Motorola Edge 60', possibleModels: []),
  DeviceModel(brand: 'Motorola', model: 'Motorola Moto G120', name: 'Motorola Moto G120', possibleModels: []),

  // Asus Devices
  DeviceModel(brand: 'Asus', model: 'ZenFone 12', name: 'Asus ZenFone 12', possibleModels: []),
  DeviceModel(brand: 'Asus', model: 'ROG Phone 9', name: 'Asus ROG Phone 9', possibleModels: []),

  // TCL Devices
  DeviceModel(brand: 'TCL', model: 'TCL 60 5G', name: 'TCL 60 5G', possibleModels: []),
  DeviceModel(brand: 'TCL', model: 'TCL 60 SE', name: 'TCL 60 SE', possibleModels: []),

  // Infinix Devices
  DeviceModel(brand: 'Infinix', model: 'Infinix Zero 50', name: 'Infinix Zero 50', possibleModels: []),
  DeviceModel(brand: 'Infinix', model: 'Infinix Note 50', name: 'Infinix Note 50', possibleModels: []),

  // Honor Devices
  DeviceModel(brand: 'Honor', model: 'Honor Magic7 Pro', name: 'Honor Magic7 Pro', possibleModels: []),
  DeviceModel(brand: 'Honor', model: 'Honor 110', name: 'Honor 110', possibleModels: []),

  // Apple Devices all
  DeviceModel(brand: 'Apple', model: 'iPhone XR', name: 'Apple iPhone XR', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone XS', name: 'Apple iPhone XS', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone XS Max', name: 'Apple iPhone XS Max', possibleModels: []),

  DeviceModel(brand: 'Apple', model: 'iPhone 11', name: 'Apple iPhone 11', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 11 Pro', name: 'Apple iPhone 11 Pro', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 11 Pro Max', name: 'Apple iPhone 11 Pro Max', possibleModels: []),

  DeviceModel(brand: 'Apple', model: 'iPhone SE (2nd generation)', name: 'Apple iPhone SE (2nd generation)', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 12', name: 'Apple iPhone 12', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 12 mini', name: 'Apple iPhone 12 mini', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 12 Pro', name: 'Apple iPhone 12 Pro', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 12 Pro Max', name: 'Apple iPhone 12 Pro Max', possibleModels: []),

  DeviceModel(brand: 'Apple', model: 'iPhone 13', name: 'Apple iPhone 13', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 13 mini', name: 'Apple iPhone 13 mini', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 13 Pro', name: 'Apple iPhone 13 Pro', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 13 Pro Max', name: 'Apple iPhone 13 Pro Max', possibleModels: []),

  DeviceModel(brand: 'Apple', model: 'iPhone SE (3rd generation)', name: 'Apple iPhone SE (3rd generation)', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 14', name: 'Apple iPhone 14', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 14 Plus', name: 'Apple iPhone 14 Plus', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 14 Pro', name: 'Apple iPhone 14 Pro', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 14 Pro Max', name: 'Apple iPhone 14 Pro Max', possibleModels: []),

  DeviceModel(brand: 'Apple', model: 'iPhone 15', name: 'Apple iPhone 15', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 15 Plus', name: 'Apple iPhone 15 Plus', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 15 Pro', name: 'Apple iPhone 15 Pro', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 15 Pro Max', name: 'Apple iPhone 15 Pro Max', possibleModels: []),

  DeviceModel(brand: 'Apple', model: 'iPhone 16', name: 'Apple iPhone 16', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 16 Plus', name: 'Apple iPhone 16 Plus', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 16 Pro', name: 'Apple iPhone 16 Pro', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 16 Pro Max', name: 'Apple iPhone 16 Pro Max', possibleModels: []),

  DeviceModel(brand: 'Apple', model: 'iPhone 17', name: 'Apple iPhone 17', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 17 Plus', name: 'Apple iPhone 17 Plus', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 17 Pro', name: 'Apple iPhone 17 Pro', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 17 Pro Max', name: 'Apple iPhone 17 Pro Max', possibleModels: []),
  DeviceModel(brand: 'Apple', model: 'iPhone 17 Ultra', name: 'Apple iPhone 17 Ultra', possibleModels: []),


];