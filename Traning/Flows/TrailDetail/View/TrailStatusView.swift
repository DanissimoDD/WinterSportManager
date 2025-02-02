//
//  TrailStatus.swift
//  Traning
//
//  Created by Danil Viugov on 02.02.2025.
//

import SwiftUI

struct TrailStatusView: View {
	
	var image: Image
	
	var color: Color
	
	var text: String
	
	var body: some View {// Иконка для расстояния
		ZStack(alignment: .leading) {
			// Rounded rectangle with specified corner radius
			RoundedRectangle(cornerRadius: 12) // Adjust the corner radius as needed
				.fill(Gradient(colors: [.cyan, color]).opacity(0.4)) // Fill color for the rounded rectangle
			HStack {
				ZStack {
					Circle()
						.fill(color) // Заливка круга
						.frame(width: 48, height: 48) // Фиксированный размер круга
						.overlay(
							Circle()
								.stroke(Color.white, lineWidth: 1) // Обводка круга
						)
					image
						.foregroundStyle(.white)
						.frame(width: 16, height: 16) // Фиксированный размер иконки
				}
				Text(text).font(.system(size: 14, weight: .bold))
			}.padding(.leading, 8)
		}
	}
}
