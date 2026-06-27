import SwiftUI

struct CustomisationsSection: View {
  @AppStorage("fishAnimation") var fishAnimation = true
  @AppStorage("fishAmount") var fishAmount = 10
  @AppStorage("fishOpacity") var fishOpacity = 0.5

  var body: some View {
    Section(header: Text("customisations")) {
      Toggle(isOn: $fishAnimation) {
        Text("fish animation")
      }.keyboardShortcut("a", modifiers: [.command])

      Menu("fish amount") {
        Section(header: Text("fish amount")) {
          Divider()

          ForEach([10, 50, 100, 150, 200, 250, 300, 350, 400, 450, 500], id: \.self) { fishAmountItem in
            Button(action: {
              GlobalStateManager.shared.fishAmount = fishAmountItem
            }) {
              Toggle(isOn: .constant(fishAmount == fishAmountItem)) {
                Text("\(fishAmountItem)")
              }
            }
          }
          Divider()

          Button(
            "reset",
            action: {
              GlobalStateManager.shared.fishAmount = 50
            })
        }
      }

      Menu("fish opacity") {
        Section(header: Text("fish opacity")) {
          Divider()

          ForEach(Array(stride(from: 10, through: 100, by: 10)), id: \.self) { fishOpacityItem in
            Button(action: {
              GlobalStateManager.shared.fishOpacity = Double(fishOpacityItem) / 100
            }) {
              Toggle(isOn: .constant(fishOpacity == Double(fishOpacityItem) / 100)) {
                Text("\(fishOpacityItem)%")
              }
            }
          }

          Divider()

          Button(
            "reset",
            action: {
              GlobalStateManager.shared.fishOpacity = 0.5
            })
        }
      }
    }
  }
}
