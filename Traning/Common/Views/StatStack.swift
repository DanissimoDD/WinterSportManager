//
//  StatStack.swift
//  Traning
//
//  Created by Danil Viugov on 26.01.2025.
//

import SwiftUI

struct StatStack: View {
	
	let title: String
	
	let stat: Double
	
	var statColor: Color {
		switch stat {
		case 0..<0.25:
				.red
		case 0.25..<0.5:
				.orange
		case 0.5..<0.8:
				.yellow
		default:
				.green
		}
	}
	
    var body: some View {
		HStack {
			Text(title)
			Spacer()
			Text("\(Int(stat * 100))").foregroundStyle(statColor)
		}
    }
}
