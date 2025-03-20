//
//  RaceView.swift
//  Traning
//
//  Created by Danil Viugov on 09.02.2025.
//

import SwiftUI

struct RaceView: View {
	@ObservedObject var viewModel: RaceViewModel
	@Binding var navigationPath: NavigationPath
	@State private var showGoBackButton = false // Состояние для анимации

	init(trail: Trail, athlets: [Athlete], navigationPath: Binding<NavigationPath>) {
		viewModel = RaceViewModel(trail: trail, athlets: athlets)
		_navigationPath = Binding(projectedValue: navigationPath)
	}

	var body: some View {
		onRace
	}
	
	var onRace: some View {
		ZStack {
			VStack {
				RaceTimeView(
					type: .idle,
					time: viewModel.currentRaceTime,
					font: .system(size: 40, weight: .bold, design: .monospaced)
				)
				HStack {
					// TODO: - Переделать на что-то красивое
					ForEach($viewModel.race.trail.route) { route in
						if viewModel.routeSelected == route.id {
							Circle()
								.frame(width: 40, height: 40)
								.foregroundStyle(.red)
								.onTapGesture {
									viewModel.routeSelected = route.id
								}
						} else {
							Circle()
								.frame(width: 40, height: 40)
								.foregroundStyle(.cyan)
								.onTapGesture {
									viewModel.routeSelected = route.id
								}
						}
					}
				}
				.padding(16)
				List {
					ForEach(
						Array(viewModel.presentedAthlets.enumerated()),
						id: \.element.id
					) { index, athleteTiming in
						AthleteRaceRow(bestTiming: viewModel.bestTimeInRoute(), athleteTiming: athleteTiming, standing: index + 1)
							.listRowSeparator(.hidden)
							.listRowBackground(Color.clear)
					}
				}
				.scrollIndicators(.hidden)
				.scrollContentBackground(.hidden)
				.padding(.zero)
				.listStyle(.plain)
				.background(Color.clear)
				.onAppear {
					UITableView.appearance().separatorStyle = .none
					viewModel.startTimer()
				}
				.onDisappear {
					viewModel.stopTimer()
				}
			}
			if viewModel.isFinished {
				VStack {
					Spacer()
					Button(action: {
						navigationPath.removeLast(2)
					}) {
						Text("Go back!")
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
							.cornerRadius(10)
							.scaleEffect(showGoBackButton ? 1 : 0.5) // Анимация масштабирования
							.opacity(showGoBackButton ? 1 : 0) // Анимация прозрачности
							.animation(.easeInOut(duration: 0.5), value: showGoBackButton) // Плавная анимация
					}
					.padding(.horizontal, 20)
				}
				.onAppear {
					// Запуск анимации при появлении экрана
					withAnimation(.easeInOut(duration: 0.8)) {
						showGoBackButton = true
					}
				}
			}
		}
	}
}

extension RaceView: Hashable {
	static func == (lhs: RaceView, rhs: RaceView) -> Bool {
		lhs.viewModel == rhs.viewModel
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(viewModel)
	}
}
