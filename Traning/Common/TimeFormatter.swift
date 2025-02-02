//
//  TimeFormatter.swift
//  Traning
//
//  Created by Danil Viugov on 10.03.2025.
//

import Foundation

enum TimeFormatter {
	// Форматирование времени в строку "чч:мм:сс:мс"
	static func formatToString(_ time: TimeInterval) -> String {
		let hours = Int(time) / 3600
		let minutes = (Int(time) % 3600) / 60
		let seconds = Int(time) % 60
		let milliseconds = Int((time.truncatingRemainder(dividingBy: 1)) * 10)
		
		return String(format: "%02d:%02d:%02d:%01d", hours, minutes, seconds, milliseconds)
	}
}
