//
//  RectangleStatView.swift
//  Traning
//
//  Created by Danil Viugov on 27.01.2025.
//

import SwiftUI

struct RectangleStatView: View {

	let stat: Double

	var body: some View {
		Text("\(Int(stat * 100))")
			.padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8))
			.background(rectangleStatColor)
			.clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 4.0, bottomLeading: 4.0, bottomTrailing: 4.0, topTrailing: 4.0)))
	}

	var rectangleStatColor: Color {
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
}
