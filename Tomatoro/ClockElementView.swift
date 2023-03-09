//
//  ClockView.swift
//  Tomatoro
//
//  Created by Łukasz Stachnik on 02/03/2023.
//  Updated by Rool Paap on 09/03/2023.
//

import SwiftUI

struct ClockElementView: View {
	
	@Binding var displayValue: String
	
	var body: some View {
		RoundedRectangle(cornerRadius: 10)
			.overlay {
				Text(displayValue)
					.fontDesign(.monospaced)
					.font(.system(size: 72))
					.foregroundColor(.white)
			}
			.frame(width: 100, height: 100)
	}
}

struct ClockElementView_Previews: PreviewProvider {
	static var previews: some View {
		ClockElementView(displayValue: .constant("05"))
	}
}
