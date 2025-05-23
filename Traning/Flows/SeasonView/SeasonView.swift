//
//  SeasonView.swift
//  Traning
//
//  Created by Danil Viugov on 23.01.2025.
//

import SwiftUI

struct SeasonView: View {
	@State var trails: [Trail]
	
	@Binding var athlets: [Athlete]
	
	
	@State var active: Bool = true
	
	var body: some View {
		NavigationView {
			VStack {// Заголовок "Trails"
				Text("Trails")
					.font(Font.system(size: 18, weight: .heavy))
					.foregroundColor(.black) // Темно-синий текст
					.shadow(color: .white.opacity(0.3), radius: 2, x: 1, y: 1) // Тень
					.padding(.top, 10)
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 15) {
						ForEach($trails) { trail in
							NavigationLink {
								TrailDetailsView(trail: trail, athlets: $athlets)
							} label: {
								SeasonTrailView(title: trail.name)
									.shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 2)
									.scaleEffect(active ? 1.0 : 0.55) // Анимация масштаба
									.animation(.easeInOut(duration: 0.2), value: active) // Анимация
							}
						}
					}
					.padding(.horizontal, 15) // Отступы по бокам
					.padding(.vertical, 10) // Отступы сверху и снизу
				}
				.background(Color.teal.opacity(0.3)) // Фон ScrollView
				.cornerRadius(15) // Закругленные углы
				.padding(.horizontal, 10) // Отступы по бокам
				List {
					Section {
						ForEach($athlets) { athlet in
							NavigationLink {
								AthletBiosView(athlete: athlet)
							} label: {
								AthletView(bio: athlet.bio)
							}
						}
					}
				header: {
					Text("Total Cup Score")
						.foregroundColor(.black) // Темно-синий текст заголовка
				}
				}.scrollIndicators(.hidden)
					.scrollContentBackground(.hidden)
					.background(Color.clear) // Прозрачный фон списка
			}
			.navigationTitle("Season 2024")
			.navigationBarTitleDisplayMode(.inline)
			.toolbarBackground(.teal.opacity(0.3), for: .navigationBar) // Устанавливаем цвет фона навигационного бара
			.toolbarBackground(.visible, for: .navigationBar) // Делаем фон видимым
			.containerRelativeFrame([.horizontal, .vertical])
			.background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.2))
		}
	}
}
