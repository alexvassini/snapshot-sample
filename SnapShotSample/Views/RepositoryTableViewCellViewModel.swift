import Foundation

class RepositoryTableViewCellViewModel {

    private let item: GitRepository

    init (item: GitRepository) {
        self.item = item
    }

    func getImage() -> URL? {
        return URL(string: item.owner.photo)
    }

    func getOwnerName() -> String {
        return item.owner.name
    }

    func getDescription() -> String {
        return item.description
    }

    func getName() -> String {
        return item.name
    }

    func getStars() -> String {
        if item.stars < 1000 {
            return "⭐️\(item.stars)"
        }
        return "⭐️\(Float(item.stars/100))k"
    }
    
}
