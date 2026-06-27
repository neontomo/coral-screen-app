import SwiftUI

class GlobalStateManager: ObservableObject {
  static let shared: GlobalStateManager = GlobalStateManager()

  @Published var fishAnimation: Bool = UserDefaults.standard.bool(forKey: "fishAnimation") {
    didSet {
      UserDefaults.standard.set(fishAnimation, forKey: "fishAnimation")
    }
  }

  @Published var fishSpeed: Int = UserDefaults.standard.integer(forKey: "fishSpeed") {
    didSet {
      UserDefaults.standard.set(fishSpeed, forKey: "fishSpeed")
    }
  }

  @Published var fishAmount: Int = UserDefaults.standard.integer(forKey: "fishAmount") {
    didSet {
      UserDefaults.standard.set(fishAmount, forKey: "fishAmount")
    }
  }

  @Published var fishOpacity: Double = UserDefaults.standard.double(forKey: "fishOpacity") {
    didSet {
      UserDefaults.standard.set(fishOpacity, forKey: "fishOpacity")
    }
  }

  @Published var useMultipleScreens: Bool =
    UserDefaults.standard.bool(forKey: "useMultipleScreens")
  {
    didSet {
      UserDefaults.standard.set(useMultipleScreens, forKey: "useMultipleScreens")
    }
  }

}
