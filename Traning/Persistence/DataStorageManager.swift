//
//  DataManager.swift
//  Traning
//
//  Created by Danil Viugov on 30.01.2025.
//

import Foundation
import CoreData

final class DataStorageManager: ObservableObject {
	
	private let userDefaultsManager: UserDefaultsManager
	
	init(defaults userDefaultsManager: UserDefaultsManager) {
		self.userDefaultsManager = userDefaultsManager
	}
	
	let container = {
		let container = NSPersistentContainer(name: "Traning")
		container.loadPersistentStores { (storeDescription, error) in
			if let error = error as NSError? {
				fatalError("Unresolved error \(error), \(error.userInfo)")
			}
		}
		return container
	} ()
	
	lazy var context = container.viewContext // Основной контекст
	
	lazy var backgroundContext = container.newBackgroundContext()
	
	// MARK: - Save
	
	func saveAthlete(_ athlete: Athlete) throws {
		let athleteEntity = AthleteEntity(model: athlete, context: context)
		try context.save()
	}
	
	// MARK: - Fetch
	
	func fetchAthletes() throws -> [Athlete] {
		let request: NSFetchRequest<AthleteEntity> = AthleteEntity.fetchRequest()
		let entities = try context.fetch(request)
		return entities.map { Athlete(entity: $0) }
	}
	
	// MARK: - Update
	
	func updateAthlete(_ athlete: Athlete) throws {
		guard let athleteEntity = try fetchAthleteEntity(by: athlete.id) else {
			throw NSError(domain: "DataManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Athlete not found"])
		}
		
		athleteEntity.overall = athlete.overall
		athleteEntity.bio = BioEntity(model: athlete.bio, context: context)
		athleteEntity.condition = SportConditionEntity(model: athlete.condition, context: context)
		athleteEntity.naturalAbil = NaturalAbilitiesEntity(model: athlete.naturalAbilities, context: context)
		athleteEntity.acquredAbil = AcquredAbilitiesEntity(model: athlete.acquiredAbilities, context: context)
		
		try context.save()
	}
	
	// MARK: - Delete
	
	func deleteAthlete(by id: UUID) throws {
		guard let athleteEntity = try fetchAthleteEntity(by: id) else {
			throw NSError(domain: "DataManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Athlete not found"])
		}
		
		context.delete(athleteEntity)
		try context.save()
	}
	
	// MARK: - Private Helpers
	
	private func fetchAthleteEntity(by id: UUID) throws -> AthleteEntity? {
		let request: NSFetchRequest<AthleteEntity> = AthleteEntity.fetchRequest()
		request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
		return try context.fetch(request).first
	}
}

extension DataStorageManager {
	// Метод для создания атлетов, если они еще не созданы
	func createInitialAthletesIfNeeded() {
		guard !userDefaultsManager.areAthletesCreated else {
			return // Атлеты уже созданы
		}
		
		let athletes: [Athlete] = [
			Athlete("De Smet", "Claerhout", nation: .Belgium),
			Athlete("Novák", "Balan", nation: .CzechRepublic),
			Athlete("Jensen", "Kaysen", nation: .Denmark),
			Athlete("Isotalo", "Lehtinen", nation: .Finland),
			Athlete("Leroy", "Aimard", nation: .France),
			Athlete("Noah", "Weber", nation: .Germany),
			Athlete("Alfonso", "Abbruzzese", nation: .Italy),
			Athlete("Nielsen", "Danielsen", nation: .Norway),
			Athlete("Piotr", "Gadowski", nation: .Poland),
			Athlete("Danil", "Viugov", nation: .Russia),
			Athlete("Lars", "Andersson", nation: .Sweden),
			Athlete("Carl", "Fuchs", nation: .Switzerland),
			Athlete("Oliver", "Brown", nation: .UK),
			Athlete("Yosyp", "Boyko", nation: .Ukraine),
			Athlete("Dzhanik", "Fayziev", nation: .Uzbekistan)
		]
		
		do {
			for athlete in athletes {
				try saveAthlete(athlete)
			}
			userDefaultsManager.areAthletesCreated = true // Устанавливаем флаг
			print("Athletes created successfully.")
		} catch {
			print("Failed to create athletes: \(error)")
		}
	}
}

extension AthleteEntity {
	convenience init(model: Athlete, context: NSManagedObjectContext) {
		self.init(context: context)
		self.id = model.id
		self.overall = model.overall
		self.bio = BioEntity(model: model.bio, context: context)
		self.condition = SportConditionEntity(model: model.condition, context: context)
		self.naturalAbil = NaturalAbilitiesEntity(model: model.naturalAbilities, context: context)
		self.acquredAbil = AcquredAbilitiesEntity(model: model.acquiredAbilities, context: context)
	}
}

extension BioEntity {
	convenience init(model: Bio, context: NSManagedObjectContext) {
		self.init(context: context)
		self.id = model.id
		self.age = Int16(model.age)
		self.name = model.name
		self.sourname = model.sourname
		self.nationality = model.nationality.rawValue
	}
}

extension SportConditionEntity {
	convenience init(model: SportCondition, context: NSManagedObjectContext) {
		self.init(context: context)
		self.physical = model.physical
		self.breath = model.breath
		self.mental = model.mental
		self.health = model.health
	}
}

extension NaturalAbilitiesEntity {
	convenience init(model: NaturalAbilities, context: NSManagedObjectContext) {
		self.init(context: context)
		self.talent = model.talent
		self.hardWork = model.hardWork
	}
}

extension AcquredAbilitiesEntity {
	convenience init(model: AcquiredAbilities, context: NSManagedObjectContext) {
		self.init(context: context)
		self.technik = model.technik
		self.stamina = model.stamina
		self.strength = model.strength
		self.experience = model.experience
	}
}

extension Bio {
	init(entity: BioEntity) {
		self.id = entity.id ?? UUID()
		self.age = Int(entity.age)
		self.name = entity.name ?? ""
		self.sourname = entity.sourname ?? ""
		self.nationality = Nationalities(rawValue: entity.nationality ?? "") ?? .unknown
	}
}

extension SportCondition {
	init(entity: SportConditionEntity) {
		self.physical = entity.physical
		self.breath = entity.breath
		self.mental = entity.mental
		self.health = entity.health
	}
}

extension NaturalAbilities {
	init(entity: NaturalAbilitiesEntity) {
		self.talent = entity.talent
		self.hardWork = entity.hardWork
	}
}

extension AcquiredAbilities {
	init(entity: AcquredAbilitiesEntity) {
		self.technik = entity.technik
		self.strength = entity.strength
		self.stamina = entity.stamina
		self.experience = entity.experience
	}
}
