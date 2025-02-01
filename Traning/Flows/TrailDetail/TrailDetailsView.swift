//
//  TrailDetailsView.swift
//  Traning
//
//  Created by Danil Viugov on 26.01.2025.
//

import SwiftUI

struct TrailDetailsView: View {
	@Binding var trail: Trail
	
	@Binding var athlets: [Athlete]
	
	@State var isPressed = false
	
	var body: some View {
		ZStack {
			VStack(alignment: .leading) {
				HStack(alignment: .top) {
					trail.image.resizable().frame(width: 140, height: 140)
						.clipShape(.rect(cornerSize: CGSize(width: 12, height: 12)))
					VStack(alignment: .leading) {
						Text("Длина трассы: \n\(trail.distance.description)")
						Text("Высота трассы: \n\(trail.height.description)")
					}.padding(.zero)
				}.navigationTitle(trail.name)
					.toolbarBackground(.teal.opacity(0.3), for: .navigationBar) // Устанавливаем цвет
					.toolbarBackground(.visible, for: .navigationBar) // Делаем фон видимым
				List {
					ForEach(Array($athlets.enumerated()), id: \.element.id) {
						index, athlet in
						HStack {
									// Номер элемента
									Text("\(index + 1)")
										.font(.system(size: 14, weight: .bold))
										.foregroundColor(.white)
										.frame(width: 24, height: 24)
										.background(Circle().fill(Color.blue)) // Круг с номером
										.overlay(Circle().stroke(Color.white, lineWidth: 1)) // Обводка круга
									
									// Отображение атлета
									AthletView(bio: athlet.bio)
								}
								.listRowSeparator(.hidden) // Скрыть разделители строк
								.listRowBackground(Color.clear) // Прозрачный фон ячеек
					}
				}.scrollIndicators(.hidden)
					.scrollContentBackground(.hidden)
					.padding(.zero)
					.listStyle(.plain)
					.onAppear {
						UITableView.appearance().separatorStyle = .none
					}
					.background(Color.clear) // Прозрачный фон списка
			}.padding(16)
			VStack {
				Spacer()
				Button(action: {
					// Add your action here
				}) {
					Text("Start race!")
						.font(.title3.weight(.semibold))
						.padding(.horizontal, 40)
						.padding(.vertical, 16)
						.frame(maxWidth: .infinity)
						.foregroundColor(.white)
						.background(
							LinearGradient(
								colors: [.teal, .blue],
								startPoint: .leading,
								endPoint: .trailing
							)
						)
						.cornerRadius(16)
						.shadow(color: .gray.opacity(0.4), radius: 4, y: 2)
						.overlay(
							RoundedRectangle(cornerRadius: 16)
								.stroke(.white.opacity(0.2), lineWidth: 1)
						)
						.scaleEffect(isPressed ? 0.95 : 1.0) // Add a press animation
						.animation(.bouncy/*.easeInOut(duration: 0.1)*/, value: isPressed)
				}
				.padding(.horizontal, 20)
				.simultaneousGesture(
					DragGesture(minimumDistance: 0)
						.onChanged { _ in isPressed = true }
						.onEnded { _ in isPressed = false }
				)

			}
		}
		.background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.2))
	}
}
