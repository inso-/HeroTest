public class Item: Codable {
	
	public let sugars: Int?
	public let brandName: String?
	public let carbohydrate: Int?
	public let images: [Images]
	public let transFat: Float?
	public let ingredients: String?
	public let saturatedFat: Float?
	public let protein: Int?
	public let size: String?
	public let alcoholByVolume: Float?
	public let author: String?
	public let fiber: Int?
	public let potassium: Int?
	public let fat: Float?
	public let pages: Int?
	public let monounsaturatedFat: Float?
	public let fatCalories: Int?
	public let publisher: String?
	public let name: String?
	public let sodium: Int?
	public let calories: Int?
	public let polyunsaturatedFat: Float?
	public let gtin14: String
	public let servingSize: String?
	public let format: String?
	public let cholesterol: Int?
	public let servingsPerContainer: String?
	
	public init(sugars: Int,
				brandName: String,
				carbohydrate: Int,
				images: [Images],
				transFat: Float,
				ingredients: String,
				saturatedFat: Float,
				protein: Int,
				size: String,
				alcoholByVolume: Float,
				author: String,
				fiber: Int,
				potassium: Int,
				fat: Float,
				pages: Int,
				monounsaturatedFat: Float,
				fatCalories: Int,
				publisher: String,
				name: String,
				sodium: Int,
				calories: Int,
				polyunsaturatedFat: Float,
				gtin14: String,
				servingSize: String,
				format: String,
				cholesterol: Int,
				servingsPerContainer: String) {
		self.sugars = sugars
		self.brandName = brandName
		self.carbohydrate = carbohydrate
		self.images = images
		self.transFat = transFat
		self.ingredients = ingredients
		self.saturatedFat = saturatedFat
		self.protein = protein
		self.size = size
		self.alcoholByVolume = alcoholByVolume
		self.author = author
		self.fiber = fiber
		self.potassium = potassium
		self.fat = fat
		self.pages = pages
		self.monounsaturatedFat = monounsaturatedFat
		self.fatCalories = fatCalories
		self.publisher = publisher
		self.name = name
		self.sodium = sodium
		self.calories = calories
		self.polyunsaturatedFat = polyunsaturatedFat
		self.gtin14 = gtin14
		self.servingSize = servingSize
		self.format = format
		self.cholesterol = cholesterol
		self.servingsPerContainer = servingsPerContainer
	}
	
	public static let decodeStrategy: ([CodingKey]) -> CodingKey = { keys in
		let lastKey = keys.last!
		if lastKey.intValue != nil {
			return lastKey
		}
		let firstLetter = lastKey.stringValue.prefix(1).lowercased()
		let modifiedKey = firstLetter + lastKey.stringValue.dropFirst()
		return MyCodingKey(stringValue: modifiedKey)!
	}
	
}

extension Item: Equatable {
	public static func == (lhs: Item, rhs: Item) -> Bool {
		return lhs.name == rhs.name
	}
}

extension Item: Hashable {
	
	public func hash(into hasher: inout Hasher) {
		
		hasher.combine(gtin14)
	}
}

