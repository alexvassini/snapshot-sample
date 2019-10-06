import Foundation

extension Data {

    static func mocked<T: Codable>(type: T.Type) -> Data {
        let bundle = Bundle.main
        let resource = String(describing: type).sliceFrom(from: "<", to: ">")
        guard let path = bundle.path(forResource: resource, ofType: "json") else { return Data() }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            return Data()
        }
    }

    static func codable<T: Codable>(type: T.Type) -> T? {
        let parser = Parser<T>(jsonData: mocked(type: T.self))
        let parsed = parser.response()
        guard let response = parsed.response  else { return nil }
        return response
    }
}

extension String {

    func sliceFrom(from: String, to: String) -> String? {
        let newString = (range(of: from)?.upperBound)
            .flatMap { substringFrom in
                (range(of: to, range: substringFrom..<endIndex)?.lowerBound)
                    .map { substringTo in
                        //        substring(with: substringFrom..<substringTo) //swift 3
                        String(self[substringFrom..<substringTo]) //swift 4
                }
        }
        guard let string = newString else { return self }
        return string
    }

}
