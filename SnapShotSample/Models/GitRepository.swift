// MARK: - Item
struct GitRepository: Codable {

    var id: Int
    var nodeId: String
    var name: String
    var homePageUrl: String
    var description: String
    var owner: Owner
    var stars: Int

    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case homePageUrl = "html_url"
        case owner
        case description
        case stars = "stargazers_count"
    }
}

struct Owner: Codable {
    let name: String
    let photo: String

    enum CodingKeys: String, CodingKey {
        case name = "login"
        case photo = "avatar_url"
    }

}
