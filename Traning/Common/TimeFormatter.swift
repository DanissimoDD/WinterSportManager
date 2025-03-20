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
		
		var time: [String] = []
		if hours != 0 {
			time.append(String(format: "%02d", hours))
			time.append(String(format: "%02d", minutes))
			time.append(String(format: "%02d", seconds))
			time.append(String(format: "%01d", milliseconds))
		} else if minutes != 0 {
			time.append(String(format: "%02d", minutes))
			time.append(String(format: "%02d", seconds))
			time.append(String(format: "%01d", milliseconds))
		} else if minutes > 9 {
			time.append(String(format: "%02d", seconds))
			time.append(String(format: "%01d", milliseconds))
		} else {
			time.append(String(format: "%01d", seconds))
			time.append(String(format: "%01d", milliseconds))
		}
		return "+" + time.joined(separator: ":")
	}
	
	// Форматирование времени в строку "чч:мм:сс:мс"
	static func formatToFullString(_ time: TimeInterval) -> String {
		let hours = Int(time) / 3600
		let minutes = (Int(time) % 3600) / 60
		let seconds = Int(time) % 60
		let milliseconds = Int((time.truncatingRemainder(dividingBy: 1)) * 10)
		
		return String(format: "%02d:%02d:%02d:%01d", hours, minutes, seconds, milliseconds)
	}
}
