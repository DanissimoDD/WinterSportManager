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
	
	// MARK: - CRUD Athlete
	
	func saveAthlete(_ athlete: Athlete) throws {
		AthleteEntity(model: athlete, context: context)
		try context.save()
	}
	
	func fetchAllAthletes() throws -> [Athlete] {
		let request: NSFetchRequest<AthleteEntity> = AthleteEntity.fetchRequest()
		let entities = try context.fetch(request)
		return entities.map { Athlete(entity: $0) }
	}
	
	func updateAthlete(_ athlete: Athlete) throws {
		guard let athleteEntity = try fetchAthleteEntity(by: athlete.id) else {
			throw NSError(domain: "DataManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Athlete not found"])
		}
		
		athleteEntity.overall = athlete.overall
		athleteEntity.bio = BioEntity(model: athlete.bio, context: context)
		athleteEntity.seasonPoints = athlete.seasonPoints
		athleteEntity.condition = SportConditionEntity(model: athlete.condition, context: context)
		athleteEntity.naturalAbil = NaturalAbilitiesEntity(model: athlete.naturalAbilities, context: context)
		athleteEntity.acquredAbil = AcquredAbilitiesEntity(model: athlete.acquiredAbilities, context: context)
		
		try context.save()
	}
	
	func deleteAthlete(by id: UUID) throws {
		guard let athleteEntity = try fetchAthleteEntity(by: id) else {
			throw NSError(domain: "DataManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Athlete not found"])
		}
		
		context.delete(athleteEntity)
		try context.save()
	}
	
	// MARK: - CRUD Trail
	
	func saveTrail(_ trail: Trail) throws {
		TrailEntity(model: trail, context: context)
		try context.save()
	}
	
	func fetchAllTrails() throws -> [Trail] {
		let request: NSFetchRequest<TrailEntity> = TrailEntity.fetchRequest()
		let entities = try context.fetch(request)
		return entities.map { Trail(entity: $0) }
	}
	
	func updateTrail(_ trail: Trail) throws {
		guard let trailEntity = try fetchTrailEntity(by: trail.id) else {
			throw NSError(domain: "DataManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Trail not found"])
		}
		
		trailEntity.phase = trail.phase.rawValue
		
		try context.save()
	}
	
	func deleteTrail(by id: UUID) throws {
		guard let trailEntity = try fetchTrailEntity(by: id) else {
			throw NSError(domain: "DataManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "Athlete not found"])
		}
		
		context.delete(trailEntity)
		try context.save()
	}
	
	// MARK: - Private Helpers
	
	private func fetchTrailEntity(by id: UUID) throws -> TrailEntity? {
		let request: NSFetchRequest<TrailEntity> = TrailEntity.fetchRequest()
		request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
		return try context.fetch(request).first
	}
	
	private func fetchAthleteEntity(by id: UUID) throws -> AthleteEntity? {
		let request: NSFetchRequest<AthleteEntity> = AthleteEntity.fetchRequest()
		request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
		return try context.fetch(request).first
	}
}

extension DataStorageManager {
	// Метод для создания атлетов, если они еще не созданы
	func createInitialDataIfNeeded() {
		guard !userDefaultsManager.areInitialDataCreated else {
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
		
		let trails: [Trail] = TrailCases.allCases.map { $0.details }
		do {
			for athlete in athletes {
				try saveAthlete(athlete)
			}
			for trail in trails {
				try saveTrail(trail)
			}
			userDefaultsManager.areInitialDataCreated = true // Устанавливаем флаг
			
			debugPrint("Athletes created successfully.")
		} catch {
			debugPrint("Failed to create athletes: \(error)")
		}
	}
}
