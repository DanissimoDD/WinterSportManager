//
//  AthletsStandings.swift
//  Traning
//
//  Created by Danil Viugov on 18.03.2025.
//

import SwiftUI

struct AthletsStandings: View {
	let athlets: [Athlete]
    var body: some View {
		VStack {
			title
			List {
				ForEach(Array(athlets.enumerated()), id: \.element.id) { index, athlet in
						standAthleteRow(athleteBio: athlet.bio, in: index)
					.listRowSeparator(.hidden)
					.listRowBackground(Color.clear)
				}
			}
			.scrollIndicators(.hidden)
			.scrollContentBackground(.hidden)
			.padding(.zero)
			.listStyle(.plain)
			.onAppear {
				UITableView.appearance().separatorStyle = .none
			}
			.background(Color.clear) // Прозрачный фон списка
		}
		.padding(.top, 8)
	}
	
	private var title: some View {
		Text("START LIST")
			.font(.system(size: 18, weight: .bold))
			.foregroundStyle(.blue)
	}
	
	private func standAthleteRow(athleteBio: Bio, in pos: Int) -> some View {
		HStack {
			Text("\(pos + 1)")
				.font(.system(size: 14, weight: .bold))
				.foregroundColor(.white)
				.frame(width: 24, height: 24)
				.background(Circle().fill(Color.blue))
				.overlay(Circle().stroke(Color.white, lineWidth: 1))
			AthleteBioRow(bio: athleteBio)
		}
	}
}
