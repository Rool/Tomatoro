//
//  ClockView.swift
//  Tomatoro
//
//  Created by Łukasz Stachnik on 02/03/2023.
//  Updated by Rool Paap on 09/03/2023.
//

import SwiftUI

struct ClockView: View {
	
	@Binding var remainingSeconds: Int
	
	var body: some View {
		HStack {
			ClockElementView(displayValue: .constant("\(String(format: "%02d", remainingSeconds / 60))"))
			ClockElementView(displayValue: .constant("\(String(format: "%02d", remainingSeconds % 60))"))
		}
	}
}

struct ClockView_Previews: PreviewProvider {
	static var previews: some View {
		ClockView(remainingSeconds: .constant(75))
	}
}
