//
//  RaceViewModel.swift
//  Traning
//
//  Created by Danil Viugov on 22.02.2025.
//
import Foundation
import SwiftUI

final class RaceViewModel: ObservableObject {

	@Published var routeSelected: UUID {
		didSet {
			presentedAthlets = race.athletsOnRoutes[routeSelected] ?? []
		}
	}

	@Published var race: Race

	@Published var presentedAthlets: [AthleteTiming] = []
	
	@Published var currentRaceTime: TimeInterval = 0.0
	
	@Published var isFinished = false
	
	var athlets: [Athlete]

	private var timerTask: Task<Void, Never>?
	private var isTimerRunning = false

	init(trail: Trail, athlets: [Athlete]) {
		let race = Race(trail: trail)
		self.race = race
		self.athlets = athlets.map {
			let athlete = $0
			athlete.racePerformance = Athlete.RacePerformance(race: race, athlete: athlete)
			return athlete
		}
		routeSelected = race.trail.route.first?.id ?? UUID()
	}
	
	var getLastRouteResult: [Athlete] {
		guard let lastRouteId = race.trail.route.last?.id,
			let athletesTiming =  race.athletsOnRoutes[lastRouteId] else { return  [] }
		return athletesTiming.map { $0.athlete }
	}

	func startTimer() {
		guard !isTimerRunning else { return }
		isTimerRunning = true

		timerTask = Task {
			while isTimerRunning {
				await fireTimer()
				try? await Task.sleep(nanoseconds: 100_000_000) // 0.02 секунды
			}
		}
	}
	
	func stopTimer() {
		isTimerRunning = false
		timerTask?.cancel()
		timerTask = nil
	}
	
	func bestTimeInRoute() -> TimeInterval {
		presentedAthlets[0].time
	}

	private func fireTimer() async {
		guard let lastRouteId = race.trail.route.last?.id, athlets.count != race.athletsOnRoutes[lastRouteId]?.count else {
			await MainActor.run {
				isFinished = true
			}
			stopTimer()
			return
		}

		await MainActor.run {
			athlets.forEach { athlete in
				guard let finished = athlete.racePerformance?.hasFinished, !finished else { return }
				athlete.racePerformance?.updateDistance()
				guard let routeId = athlete.racePerformance?.lastComplitedRoute?.id,
					  var array = race.athletsOnRoutes[routeId] else { return }
				guard array.filter({ athlet in athlet.id == athlete.id }).isEmpty else { return }
				array.append(AthleteTiming(athlete: athlete, time: currentRaceTime))
				race.athletsOnRoutes[routeId] = array
				if routeId == routeSelected {
					presentedAthlets = array
				}
			}
			currentRaceTime += 0.1
		}
	}
}

extension RaceViewModel: Hashable {
	static func == (lhs: RaceViewModel, rhs: RaceViewModel) -> Bool {
		lhs.presentedAthlets == rhs.presentedAthlets && lhs.race == rhs.race
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(presentedAthlets)
		hasher.combine(race)
	}
}
