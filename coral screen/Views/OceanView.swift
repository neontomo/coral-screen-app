import SwiftUI

struct Fish: View {
  @State public var position: CGPoint = CGPoint(x: 0, y: 0)
  @State public var size: CGSize = CGSize(width: 100, height: 100)
  @State public var direction: Int = 0
  @State public var screenSize: CGSize = CGSize(width: 100, height: 100)

  @State private var skewAngle: Double = 0
  @State private var speed: Double = 0
  @State private var fishName: String = "0"
  @State private var delay: Double = 0

  func navigateToRandomSpot() {
    self.position.y = CGFloat.random(in: 0..<screenSize.height)
    self.fishName = String(Int.random(in: 0...58))
    self.speed = Double.random(in: 10...30)
    self.direction = Int.random(in: 0...1)
    self.fishName = String(Int.random(in: 0...58))
    self.delay = Double.random(in: 0...10)

    withAnimation(Animation.linear(duration: self.speed).delay(self.delay)) {
      if direction == 0 {
        position.x = -size.width * 5
      } else {
        position.x = screenSize.width + (size.width * 5)
      }
      position.y = CGFloat.random(in: position.y - 300...position.y + 300)
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + self.speed + self.delay) {
      navigateToRandomSpot()
    }
  }

  var body: some View {
    Image(fishName)
      .resizable()
      .scaledToFit()
      .frame(width: size.width, height: size.height)
      .scaleEffect(x: direction == 0 ? 1 : -1, y: 1)
      .rotation3DEffect(
        .degrees(skewAngle),
        axis: (x: 0.0, y: 1.0, z: 0.0)
      )
      .position(x: position.x, y: position.y)
      .onAppear {
        self.position.x =
          self.direction == 0 ? screenSize.width + (size.width * 5) : -size.width * 5
        self.position.y = CGFloat.random(in: 0..<screenSize.height)

        withAnimation(Animation.linear(duration: 0.2).repeatForever(autoreverses: true)) {
          skewAngle = 15
        }
        navigateToRandomSpot()
      }
  }
}
struct OceanView: View {
  // @ObservedObject var globalStateManager = GlobalStateManager.shared
  @State private var renderKey: Int = 0

  @AppStorage("fishAnimation") var fishAnimation = true
  @AppStorage("fishAmount") var fishAmount = 50
  @AppStorage("fishOpacity") var fishOpacity = 0.5

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        if fishAnimation {
          ForEach(0..<fishAmount, id: \.self) { index in
            Fish(
              size: CGSize(
                width: geometry.size.width * 0.05 + (Double(index) * 0.1),
                height: geometry.size.height * 0.05 + (Double(index) * 0.1)
              ),
              direction: Int.random(in: 0...1),
              screenSize: geometry.size
            )
          }
        }
      }
      .opacity(fishOpacity)
      .id(renderKey)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .drawingGroup()
    .edgesIgnoringSafeArea(.all)
    .onChange(of: fishAnimation) {
      renderKey += 1
    }
    .onChange(of: fishAmount) {
      renderKey += 1
    }
    .onChange(of: fishOpacity) {
      renderKey += 1
    }

  }
}
