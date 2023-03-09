//
//  ContentView.swift
//  Tomatoro
//
//  Created by Łukasz Stachnik on 02/03/2023.
//  Updated by Rool Paap on 09/03/2023.
//

import Foundation
import Combine

struct Constants {
	static let timerLength = 10
}

final class ContentViewModel: ObservableObject {
	
	enum Status {
		case notStarted
		case inProgress
		case complete
	}
	
	private var timerCancellable: AnyCancellable?
	private var startDate: Date?
	@Published var status: Status = .notStarted
	@Published var remainingSeconds = Constants.timerLength
	
	func start() {
		
		status = .inProgress
		startDate = Date()
		
		startTimer()
	}
	
	func complete() {
		
		status = .complete
		timerCancellable?.cancel()
	}
	
	func restart() {
		
		status = .inProgress
		startDate = Date()
		
		startTimer()
	}
	
	private func startTimer() {
		
		timerCancellable = Timer
			.publish(every: 1, on: .current, in: .common)
			.autoconnect()
			.receive(on: DispatchQueue.main)
			.sink(receiveValue: { [weak self] _ in
				guard let self else { return }
				
				switch self.status {
					case .notStarted:
						self.start()
					case .inProgress:
						if let startDate {
							let elapsedTime = Date().timeIntervalSince(startDate)
							let remainingTime = max (0, Constants.timerLength - Int(elapsedTime))
							self.remainingSeconds = remainingTime
							if remainingTime == 0 {
								self.status = .complete
								self.timerCancellable?.cancel()
							}
						}
					default: break
				}
			})
	}
}
