//
//  SeasonView.swift
//  Traning
//
//  Created by Danil Viugov on 23.01.2025.
//

import SwiftUI

struct SeasonView: View {
	
	let dataManager: DataStorageManager
	
	// TODO: - Разбить body и сделать viewModel
	@State var navigationPath = NavigationPath() // Для NavigationStack
	
	@Binding var athlets: [Athlete]
	@Binding var trails: [Trail]
	@State private var isViewLoaded = false
	
	var body: some View {
		NavigationStack(path: $navigationPath) {
			VStack {// Заголовок "Trails"
				Text("Trails")
					.font(Font.system(size: 18, weight: .heavy))
					.foregroundColor(.black) // Темно-синий текст
					.shadow(color: .white.opacity(0.3), radius: 2, x: 1, y: 1) // Тень
					.padding(.top, 10)
				ScrollView(.horizontal, showsIndicators: false) {
					HStack(spacing: 15) {
						// Убрал, тут был binding, мб нужен хз
						ForEach($trails) { trail in
							NavigationLink(value: trail) {
								SeasonTrailView(trail: trail)
									.shadow(color: .black.opacity(0.2), radius: 5, x: 2, y: 2)
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
						ForEach(athlets) { athlet in
							NavigationLink(value: athlet) {
								AthleteBioRow(bio: athlet.bio)
							}
						}
					}
				header: {
					Text("Total Cup Score")
						.foregroundColor(.black) // Темно-синий текст заголовка
				}
				}
				.scrollIndicators(.hidden)
				.scrollContentBackground(.hidden)
				.background(Color.clear) // Прозрачный фон списка
			}
			.navigationTitle("Season 2024")
			.navigationBarTitleDisplayMode(.inline)
			.toolbarBackground(.teal.opacity(0.3), for: .navigationBar)
			.toolbarBackground(.visible, for: .navigationBar)
			.containerRelativeFrame([.horizontal, .vertical])
			.background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.2))
			// Добавлено: navigationDestination для Trail
			.navigationDestination(for: Binding<Trail>.self) { trail in
				TrailDetailsView(
					trail: trail,
					athlets: athlets,
					dataManager: dataManager,
					navigationPath: $navigationPath
				)
			}

			// Добавлено: navigationDestination для Athlete
			.navigationDestination(for: Athlete.self) { AthletBiosView(athlete: $0) }
		}
		.onAppear() {
			// Выполняем только при первом появлении
			if !isViewLoaded {
				loadInitialData()
				isViewLoaded = true
			}
			// Всегда обновляем при возврате на экран
			updateProgressTrail()
		}
	}
	
//	private func updateProgressTrail() {
//		guard trails.filter({ $0.phase == .inProgress }).isEmpty,
//			  let trail = trails.filter({ $0.phase == .notStarted }).first,
//			  let index = trails.firstIndex(of: trail) else { return }
//		trails[index].phase = .inProgress
//	}
	
	private func updateProgressTrail() {
		// Добавляем проверку на пустоту массива
		guard !trails.isEmpty else { return }
		
		// Ищем первый трейл, который еще не начался
		if let index = trails.firstIndex(where: { $0.phase == .notStarted }) {
			trails[index].phase = .inProgress
		}
	}
	
	private func loadInitialData() {
		loadAthletes()
		loadTrails()
	}
	
	private func loadAthletes() {
		do {
			athlets = try dataManager.fetchAllAthletes()
		} catch {
			debugPrint("Failed to fetch athletes: \(error)")
		}
	}

	private func loadTrails() {
		do {
			trails = try dataManager.fetchAllTrails()
		} catch {
			debugPrint("Failed to fetch trails: \(error)")
		}
	}
}

// TODO: - Добавить вместо ерунды
enum TrailPhase: String {
	case notStarted    // Гонка еще не началась
	case inProgress    // Гонка в процессе
	case finished      // Гонка завершена
}
