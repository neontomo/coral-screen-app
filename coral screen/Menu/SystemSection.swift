import SwiftUI

struct SystemSection: View {
  let currentYear = String(Calendar.current.component(.year, from: Date()))

  var body: some View {
    Section(header: Text("system")) {
      Menu("about") {
        Section(header: Text("about")) {
          Divider()

          Button(
            "coral screen website",
            action: {
              openURL("https://coral-screen.netlify.app")
            })

          Button(
            "leave review",
            action: {
              openURL("macappstore://apps.apple.com/app/id6529545947?action=write-review")
            })

          Button(
            "privacy policy",
            action: {
              openURL("https://github.com/neontomo/coral-screen-app/blob/main/PRIVACY.md")
            })

          Divider()

          Button(
            "email me",
            action: {
              openURL("mailto:tomomyrman+coralscreen@proton.me?subject=coral%20screen%20feedback")
            })

          Divider()

          Button("other apps by me", action: {}).disabled(true)

          Button(
            "rain screen",
            action: {
              openURL("https://rain-screen.netlify.app")
            })

          Button(
            "overstimulated",
            action: {
              openURL("https://overstimulated.netlify.app")
            })

          Button(
            "my other projects",
            action: {
              openURL("https://neontomo.com")
            })

          Divider()

          Button("\(currentYear) © Tomo Myrman", action: {}).disabled(true)
        }

      }

      Button("reset all settings") {
        GlobalStateManager.shared.fishAnimation = true
        GlobalStateManager.shared.fishAmount = 50
        GlobalStateManager.shared.fishOpacity = 0.5
        GlobalStateManager.shared.useMultipleScreens = false
      }

      Button("check for updates") {
        openURL("macappstore://apps.apple.com/app/id6529545947?action=update")
      }.keyboardShortcut("u", modifiers: [.command])

      Divider()

      Button("quit") {
        NSApp.terminate(self)
      }.keyboardShortcut("q", modifiers: [.command])
    }
  }
}

#Preview {
  SystemSection()
}
