//
//  Athlete.swift
//  Traning
//
//  Created by Danil Viugov on 22.01.2025.
//

import Foundation

final class Athlete: Identifiable {
	let id: UUID
	var overall: Double
	var bio: Bio
	var condition: SportCondition = SportCondition()
	var naturalAbilities: NaturalAbilities = NaturalAbilities()
	var acquiredAbilities: AcquiredAbilities
	
	var seasonPoints = 0
	var racePerformance: RacePerformance?
	
	
	init(entity: AthleteEntity) {
		self.id = entity.id ?? UUID()
		self.overall = entity.overall
		self.bio = Bio(entity: entity.bio!)
		self.condition = SportCondition(entity: entity.condition!)
		self.naturalAbilities = NaturalAbilities(entity: entity.naturalAbil!)
		self.acquiredAbilities = AcquiredAbilities(entity: entity.acquredAbil!)
	}
	
	init(
		id: UUID = UUID(),
		_ name: String,
		_ sourname: String,
		nation nationality: Nationalities
	) {
		self.id = id
		let age = Int.random(in: 21...34)
		self.acquiredAbilities = AcquiredAbilities(age: age)
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

extension Athlete: Hashable {
	static func == (lhs: Athlete, rhs: Athlete) -> Bool {
		lhs.bio == rhs.bio
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine(bio)
	}
}

struct SportCondition: Hashable {
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
	
	 init(entity: SportConditionEntity) {
		 self.physical = entity.physical
		 self.breath = entity.breath
		 self.mental = entity.mental
		 self.health = entity.health
	 }
}

struct NaturalAbilities: Hashable {
	var talent: Double
	var hardWork: Double
//	var steadfastness: Double
	
	init() {
		self.talent = Double.random(in: 0..<1)
		self.hardWork = Double.random(in: 0..<1)
//		self.steadfastness = Double.random(in: 0..<1)
	}

	init(entity: NaturalAbilitiesEntity) {
		 self.talent = entity.talent
		 self.hardWork = entity.hardWork
	 }
}

struct AcquiredAbilities: Hashable {
	var technik = Double.random(in: 0.4..<1)
	var experience = Double.random(in: 0.3..<1)
	var strength = Double.random(in: 0.3..<1)
	var stamina = Double.random(in: 0.3..<1)
	
	init(age: Int) {
		let stats: (min: Double, max: Double) = switch age {
		case 21:
			(0.2, 0.45)
		case 22:
			(0.26, 0.51)
		case 23:
			(0.32, 0.57)
		case 24:
			(0.38, 0.63)
		case 25:
			(0.44, 0.68)
		case 26:
			(0.50, 0.72)
		case 27:
			(0.56, 0.76)
		case 28:
			(0.62, 0.80)
		case 29:
			(0.68, 0.84)
		case 30:
			(0.72, 0.87)
		case 31:
			(0.76, 0.89)
		case 32:
			(0.78, 0.9)
		case 33:
			(0.79, 0.9)
		case 34:
			(0.8, 0.9)
		default:
			(0, 1)
		}
		self.experience = Double.random(in: stats.min...stats.max)
	}
	
	init(entity: AcquredAbilitiesEntity) {
		 self.technik = entity.technik
		 self.strength = entity.strength
		 self.stamina = entity.stamina
		 self.experience = entity.experience
	 }
}

struct Bio: Identifiable, Hashable {
	let id: UUID
	var age: Int
	let name: String
	let sourname: String
	let nationality: Nationalities
	
	init(
		id: UUID = UUID(),
		age: Int,
		name: String,
		sourname: String,
		nationality: Nationalities
	) {
		self.id = id
		self.age = age
		self.name = name
		self.sourname = sourname
		self.nationality = nationality
	}
	
	init(entity: BioEntity) {
		self.id = entity.id ?? UUID()
		self.age = Int(entity.age)
		self.name = entity.name ?? ""
		self.sourname = entity.sourname ?? ""
		self.nationality = Nationalities(rawValue: entity.nationality ?? "") ?? .unknown
	}
}

struct AthletePerformance {
	let id: UUID
	let performance: Double
}
