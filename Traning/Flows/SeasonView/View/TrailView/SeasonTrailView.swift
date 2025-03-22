//
//  SeasonTrailView.swift
//  Traning
//
//  Created by Danil Viugov on 23.01.2025.
//

import SwiftUI

struct SeasonTrailView: View {
	@Binding var trail: Trail
	
	@State private var showCheckmark: Bool = false
	
	var body: some View {
		ZStack {
			Image(trail.name + "Image")
				.resizable()
				.frame(width: 108, height: 108, alignment: .center)
				.cornerRadius(12)
			// Блюр и галочка (если трейл пройден)
			if trail.hasPassed {
				ZStack {
					// Размытый фон
					Color.white.opacity(0.9)
						.frame(width: 108, height: 108)
						.cornerRadius(12)
					
					// Зеленая галочка с анимацией
					Image(systemName: "checkmark.circle.fill")
						.resizable()
						.frame(width: 48, height: 48)
						.padding(.bottom, 18)
						.foregroundColor(.green)
						.shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 1) // Тень галочки
						.scaleEffect(showCheckmark ? 1 : 0.8) // Анимация масштабирования
						.opacity(showCheckmark ? 1 : 0) // Анимация появления
						.animation(.spring(response: 0.7, dampingFraction: 0.2, blendDuration: 0.3), value: showCheckmark)
				}
				.frame(width: 108, height: 108)
				.cornerRadius(12)
			}
			VStack {
				Spacer()
				ZStack {
					Rectangle()
						.frame(width: 80, height: 20)
						.background(Color.white).opacity(0.3)
					Text(trail.name).padding(.horizontal, 8).foregroundColor(.black)
				}.cornerRadius(10)
					.padding(.bottom, 2)
			}
		}
		.frame(width: 108, height: 108)
		.shadow(color: Color.black.opacity(0.3), radius: 5, x: 1, y: 0)
		.onAppear {
			// Сбрасываем состояние перед запуском анимации
			showCheckmark = false
			
			// Запускаем анимацию с небольшой задержкой
			DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
				withAnimation(.spring(response: 0.7, dampingFraction: 0.2, blendDuration: 0.3)) {
					showCheckmark = trail.hasPassed
				}
			}
		}
	}
}
