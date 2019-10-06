import Foundation

class Parser<T: Codable> {

    let jsonData: Data

    // MARK: Init
    init(jsonData data: Data) {
        jsonData = data
    }

    // MARK: Public Methods
    func response() -> (response: T?, error: Swift.Error?) {

        do {

            if jsonData.endIndex > 5 {

                #if DEBUG
                print(try JSONSerialization.jsonObject(with: jsonData, options: []))
                #endif

                let object = try JSONDecoder().decode(T.self, from: jsonData)
                return (object, error: nil)

            } else {

                let emptyData = try JSONSerialization.data(
                    withJSONObject: ["status": "success"],
                    options: .prettyPrinted
                )

                let responseNoContent: T = try JSONDecoder().decode(T.self, from: emptyData)
                return (responseNoContent, error: nil)
            }
        } catch let error {

            #if DEBUG
            print(error)
            #endif

            return (nil, error: error)
        }
    }
}
