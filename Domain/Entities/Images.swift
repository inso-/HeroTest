//
//	Images.swift Generate By modelGenerator
//	Create the Mon Dec 17 19:43:25 2018
//	https://github.com/inso-/modelGenerator
//

public class Images: Codable {

	public let url: String

	public init(url: String) {
		self.url = url
	}

}

extension Images: Equatable {
	public static func == (lhs: Images, rhs: Images) -> Bool {
		return lhs.url == rhs.url
	}
}
