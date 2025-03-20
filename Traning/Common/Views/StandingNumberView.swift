//
//  StandingNumberView.swift
//  Traning
//
//  Created by Danil Viugov on 20.03.2025.
//

import SwiftUI

struct StandingNumberView: View {
	let standing: Int
	
	var body: some View {
		Text(standing.formatted())
			.font(.system(size: 14, weight: .bold))
			.foregroundColor(.white)
			.frame(width: 24, height: 24)
			.background(circleBackground) // Применяем фон
			.overlay(Circle().stroke(Color.white, lineWidth: 1)) // Обводка
	}
	
	// Вычисляемое свойство для выбора фона
	private var circleBackground: some View {
		switch standing {
		case 1:
			return Circle().fill(Color.yellow)
		case 2:
			return Circle().fill(Color.gray)
		case 3:
			return Circle().fill(Color.orange)
		default:
			return Circle().fill(Color.blue)
		}
	}
}
