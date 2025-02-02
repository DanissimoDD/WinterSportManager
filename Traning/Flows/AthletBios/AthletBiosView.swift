//
//  AthletBios.swift
//  Traning
//
//  Created by Danil Viugov on 25.01.2025.
//

import SwiftUI

struct AthletBiosView: View {
	
	let athlete: Athlete
	
	var body: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .center) {
				Image("AthletImage").resizable().frame(width: 130, height: 130).cornerRadius(28)
				VStack(alignment: .leading) {
					Text("\(athlete.bio.name) \(athlete.bio.sourname)")
					Text("Age: \(athlete.bio.age)")
					HStack {
						Text("Nationality: \(athlete.bio.nationality.rawValue)")
						athlete.bio.nationality.flagImage.resizable().frame(width: 18, height: 18).cornerRadius(4)
					}
					ZStack {
						RectangleStatView(stat: athlete.overall)
					}
				}
			}
			.toolbarBackground(.teal.opacity(0.3), for: .navigationBar) // Устанавливаем цвет фона навигационного бара
			.toolbarBackground(.visible, for: .navigationBar) // Делаем фон видимым
			Spacer()
			List {
				Section {
					StatStack(title: "Technik: ", stat: athlete.acquiredAbilities.technik)
					StatStack(title: "Experience: ", stat: athlete.acquiredAbilities.experience)
					StatStack(title: "Strength: ", stat: athlete.acquiredAbilities.strength)
					StatStack(title: "Stamina: ", stat: athlete.acquiredAbilities.stamina)
				} header: {
					Text("Acquired abilities")
				}
				Section {
					StatStack(title: "Physical: ", stat: athlete.condition.physical)
					StatStack(title: "Breath: ", stat: athlete.condition.breath)
//					StatStack(title: "Mental: ", stat: $athlete.condition.mental)
					StatStack(title: "Health: ", stat: athlete.condition.health)
				} header: {
					Text("Sport condition")
				}
				Section {
					StatStack(title: "Talent: ", stat: athlete.naturalAbilities.talent)
					StatStack(title: "Hard work: ", stat: athlete.naturalAbilities.hardWork)
					//				StatStack(title: "Steadfastness: ", stat: $athlete.naturalAbilities.steadfastness)
				} header: {
					Text("Natural abilities")
				}
			}.scrollDisabled(true)
				.cornerRadius(16)
				.listSectionSpacing(.zero)
		}
		.padding(.horizontal, 16)
		.padding(.top, 16)
		.background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.2))
	}
}
