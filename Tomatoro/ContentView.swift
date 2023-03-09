// From https://itnext.io/insomnia-dont-let-that-screen-sleep-8d40ee7822b4 and

import SwiftUI

struct ContentView: View {
	
	@StateObject var viewModel = ContentViewModel()
	
	var body: some View {
		VStack(spacing: 20) {
			Text("🍅")
				.font(.largeTitle)
			
			ClockView(remainingSeconds: $viewModel.remainingSeconds)
			
			switch viewModel.status {
				case .notStarted:
					Button {
						viewModel.start()
					} label: {
						Text("Start")
					}
					.buttonStyle(.borderedProminent)
					.tint(.green)
					
				case .inProgress:
					
					Button {
						viewModel.complete()
					} label: {
						Text("Complete")
					}
					.buttonStyle(.borderedProminent)
					.tint(.blue)
					
				case .complete:
					
					Button {
						viewModel.restart()
					} label: {
						Text("Restart")
					}
					.buttonStyle(.borderedProminent)
					.tint(.green)
			}
		}
		.padding()
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
