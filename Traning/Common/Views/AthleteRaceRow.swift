//
//  AthleteRaceRow.swift
//  Traning
//
//  Created by Danil Viugov on 06.03.2025.
//

import SwiftUI

struct AthleteRaceRow: View {

	var bestTiming: TimeInterval

	var athleteTiming: AthleteTiming
	
	let standing: Int

	// TODO: - Сделать алаймент для времени и ограничение для фамилии с `...`
	var body: some View {
		HStack(alignment: .center) {
			StandingNumberView(standing: standing)
			athleteTiming.athlete.bio.nationality.flagImage
				.resizable()
				.frame(width: 28, height: 28)
				.cornerRadius(4)
				.padding(.trailing, 4)
			Text("\(athleteTiming.athlete.bio.name.prefix(1)). \(athleteTiming.athlete.bio.sourname)").font(.system(size: 18, weight: .medium))
			Spacer()
			RaceTimeView(
				type: getTimeType(),
				time: getTime(),
				font: .system(size: 18, weight: .medium, design: .monospaced)
			)
		}
    }
	
	// TODO: Сделать структуру и вообще переделать
	private func getTimeType() -> TimeType {
		bestTiming == athleteTiming.time ? .idle : .gap
	}
	
	private func getTime() -> TimeInterval {
		let type = getTimeType()
		switch type {
		case .idle:
			return athleteTiming.time
		case .gap:
			return athleteTiming.time - bestTiming
		}
	}
}
