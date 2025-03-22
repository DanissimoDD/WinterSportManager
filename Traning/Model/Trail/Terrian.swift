//
//  Terrian.swift
//  Traning
//
//  Created by Danil Viugov on 22.03.2025.
//

import Foundation

enum Terrain: Hashable {
	init(rawValue: String, scale: Double? = nil) {
		switch rawValue {
		case "ascent":
			self = .ascent(scale: scale ?? 1)
		case "flat":
			self = .flat
		case "descent":
			self = .descent(scale: scale ?? 1)
		default:
			self = .flat
		}
	}
	
	case ascent(scale: Double)
	case flat
	case descent(scale: Double)
	
	var rawValue: String {
		switch self {
		case .ascent:
			"ascent"
		case .flat:
			"flat"
		case .descent:
			"descent"
		}
	}
}
