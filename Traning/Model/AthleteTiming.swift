//
//  AthleteTiming.swift
//  Traning
//
//  Created by Danil Viugov on 04.03.2025.
//

import Foundation


class AthleteTiming: Hashable, Identifiable {
	let id: UUID
	var athlete: Athlete
	let time: TimeInterval
	
	init(athlete: Athlete, time: TimeInterval) {
		self.id = athlete.id
		self.athlete = athlete
		self.time = time
	}
	
	static func == (lhs: AthleteTiming, rhs: AthleteTiming) -> Bool {
		lhs.athlete == rhs.athlete
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(athlete)
		hasher.combine(time)
	}
}
