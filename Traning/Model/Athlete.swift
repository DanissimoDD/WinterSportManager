//
//  Athlete.swift
//  Traning
//
//  Created by Danil Viugov on 22.01.2025.
//

import Foundation

struct Athlete: Identifiable {
	let id: UUID
	var overall: Double
	var bio: Bio
	var condition: SportCondition = SportCondition()
	var naturalAbilities: NaturalAbilities = NaturalAbilities()
	var acquiredAbilities: AcquiredAbilities = AcquiredAbilities()
	
	init(
		_ name: String,
		_ sourname: String,
		nation nationality: Nationalities
	) {
		id = UUID()
		let age = Int.random(in: 21...34)
		self.bio = Bio(id: id, age: age, name: name, sourname: sourname, nationality: nationality)
		// TODO: - Техника, сила, стамина
		self.overall = [
//			condition.breath,
//			condition.health,
//			condition.mental,
//			condition.physical,
//			naturalAbilities.hardWork,
//			naturalAbilities.talent,
			acquiredAbilities.experience/2,
			acquiredAbilities.technik,
			acquiredAbilities.strength,
			acquiredAbilities.stamina,
		].reduce(0.0) { $0 + $1/3.5 }
	}
}

struct SportCondition {
	var physical: Double
	var breath: Double
	var mental: Double
	var health: Double
	
	init() {
		self.physical = Double.random(in: 0.8..<1)
		self.breath = Double.random(in: 0.8..<1)
		self.mental = Double.random(in: 0.7..<1)
		self.health = Double.random(in: 0.8..<1)
	}
}

struct NaturalAbilities {
	var talent: Double
	var hardWork: Double
//	var steadfastness: Double
	
	init() {
		self.talent = Double.random(in: 0..<1)
		self.hardWork = Double.random(in: 0..<1)
//		self.steadfastness = Double.random(in: 0..<1)
	}
}

struct AcquiredAbilities {
	var technik: Double = Double.random(in: 0.4..<1) // skills technique
	var experience: Double = Double.random(in: 0.3..<1)
	var strength: Double = Double.random(in: 0.3..<1)
	var stamina: Double = Double.random(in: 0.3..<1)
}

struct Bio: Identifiable {
	let id: UUID
	var age: Int
	let name: String
	let sourname: String
	let nationality: Nationalities
}
