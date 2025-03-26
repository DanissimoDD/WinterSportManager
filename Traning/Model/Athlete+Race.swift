//
//  Race.swift
//  Traning
//
//  Created by Danil Viugov on 20.02.2025.
//

import Foundation
import SwiftUI

final class Race: Hashable {
	// MARK: - Properties
	
	@Binding var trail: Trail
	
	var athletsOnRoutes: [UUID : [AthleteTiming]] // Это по сути могли быть модели
	
	var finishedAthlets: [Athlete] {
		guard let array = athletsOnRoutes[lastRouteId] else { return [] }
		return array.map { $0.athlete }
	}
	
	private let lastRouteId: UUID
	
	// MARK: - Init
	
	init(trail: Binding<Trail>) {
		self._trail = trail
		var athletsOnRoutes = [UUID : [AthleteTiming]]()
		trail.route.forEach {
			athletsOnRoutes[$0.id] = []
		}
		lastRouteId = trail.route.last?.id ?? UUID()
		self.athletsOnRoutes = athletsOnRoutes
	}
	
	// MARK: - Hashable
	
	static func == (lhs: Race, rhs: Race) -> Bool {
		lhs.trail == rhs.trail
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(trail)
	}
}

// MARK: - RacePerformance

extension Athlete {
	final class RacePerformance: Hashable {
		let race: Race
		let athlete: Athlete
		var hasFinished: Bool
		let ski: SkiSliding

		/// default 100.0
		private var stamina: Double

		/// default 0.0
		private var coveredDistance: Double
		/// default false

		/// default 0.0
		private var currentSpeed: Double

		var currentRoutePart: RoutePart? {
			var route: RoutePart? = nil
			var countedDistance = 0.0
			race.trail.route.forEach {
				guard route == nil else { return }
				countedDistance += $0.distance
				if coveredDistance < countedDistance {
					route = $0
				}
			}
			return route
		}

		var lastComplitedRoute: RoutePart? {
			if let current = currentRoutePart {
				guard let index = race.trail.route.firstIndex(of: current),
					  index > 0 else { return nil }
				return race.trail.route[index - 1]
			} else {
				hasFinished = true
				return race.trail.route.last
			}
		}
		
		init(race: Race, athlete: Athlete, stamina: Double = 100.0, coveredDistance: Double = 0.0, hasFinished: Bool = false, currentSpeed: Double = 0.0) {
			self.race = race
			self.athlete = athlete
			self.stamina = stamina
			self.coveredDistance = coveredDistance
			self.hasFinished = hasFinished
			self.currentSpeed = currentSpeed
			ski = SkiSliding(rawValue: Int.random(in: 0...6)) ?? .fair
		}
		
		func updateDistance() {
			setSpeed()
			coveredDistance += currentSpeed
		}
		
		private func setSpeed() {
			guard let terrain = currentRoutePart?.type else { return }
			let physic = 1 + athlete.acquiredAbilities.strength * athlete.condition.physical
			let technik = 1 + athlete.acquiredAbilities.technik * athlete.condition.breath
			switch terrain {
			case .ascent(let scale):
				// TODO: - Пока прямая зависимость потом придумать по-интереснее
				currentSpeed = physic + 0.5 * technik / scale * ski.raceSliding
			case .flat:
				currentSpeed = technik + 0.5 * physic * ski.raceSliding
			case .descent(let scale):
				// TODO: - Тут ещё лыжи долны учитываться и возможно расталкивания
				currentSpeed = scale * (2.5 + athlete.acquiredAbilities.stamina / 2) * ski.raceSliding
			}
		}
		
		// MARK: - Hashable
		
		static func == (lhs: RacePerformance, rhs: RacePerformance) -> Bool {
			return lhs.race == rhs.race && lhs.athlete == rhs.athlete
		}
		
		func hash(into hasher: inout Hasher) {
			hasher.combine(race)
			hasher.combine(athlete)
		}
	}
}
