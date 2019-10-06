import Foundation
import UIKit

enum AppAction {

    case showRepositoryDetails

}

protocol AppActionable: class {
    func handle(_ action: AppAction)
}

class AppCoordinator: Coordinator {

    // MARK: - Properties
    let window: UIWindow
    var navigationController: CustomNavigation
    
    // MARK: - Coordinator
    init(window: UIWindow) {
        self.window = window
        self.navigationController = CustomNavigation()
    }

    var currentView: UIViewController? {
        get {
            return window.rootViewController
        }
        set {
            UIView.transition(with: self.window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.window.rootViewController = newValue
            }, completion: nil)
        }
    }

    func start() {
        showFeed()

    }

    fileprivate func showFeed(){
        let homeView = FeedViewController()
        self.navigationController.setViewControllers([homeView], animated: false)
        homeView.delegate = self
        self.currentView = navigationController
    }

}

extension AppCoordinator: AppActionable {

    func handle(_ action: AppAction) {

        switch action {

        case .showRepositoryDetails:
            print("Show Details")

        }
    }

}


class CustomNavigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()

    }

    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }

    func setupViews() {
        self.navigationBar.barTintColor = UIColor(hexString: "101031")
        self.navigationBar.tintColor = UIColor(hexString: "E6E6E6")
        self.navigationBar.isTranslucent = false
        self.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
            NSAttributedString.Key.foregroundColor: UIColor(hexString: "E6E6E6")
        ]
    }
}

