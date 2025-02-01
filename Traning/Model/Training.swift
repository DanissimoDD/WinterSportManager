//
//  Training.swift
//  Traning
//
//  Created by Danil Viugov on 23.01.2025.
//

import Foundation

struct Training {
	let physical: Double
	let breath: Double
	let mental: Double
	let health: Double
	
	init(setup: TrainingSetup) {
		self.physical = 0
		self.breath = 0
		self.mental = 0
		self.health = 0
	}
}

struct TrainingSetup {
	let type: TrainingType
	let intensity: TrainingIntensity
}


enum TrainingType {
	case physical
	case recovery
	case mental
	case highLands
}

enum TrainingIntensity {
	case low
	case normal
	case high
}
