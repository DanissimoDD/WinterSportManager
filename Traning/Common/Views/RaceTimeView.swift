//
//  RaceTimeView.swift
//  Traning
//
//  Created by Danil Viugov on 10.03.2025.
//

import SwiftUI

struct RaceTimeView: View {
	
	var type: TimeType
	
	var time: TimeInterval
	
	var font: Font
	
    var body: some View {
		Text(stringTime())
			.font(font)
			.padding()
    }
	
	private func stringTime() -> String {
		switch type {
		case .idle:
			TimeFormatter.formatToString(time)
		case .gap:
			"+" + TimeFormatter.formatToString(time)
		}
	}
}

enum TimeType {
	case idle
	case gap
}
