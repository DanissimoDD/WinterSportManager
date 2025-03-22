//
//  TrailDetailsView.swift
//  Traning
//
//  Created by Danil Viugov on 26.01.2025.
//
import SwiftUI

struct TrailDetailsView: View {
	
	private let dataManager: DataStorageManager
	
	@ObservedObject var viewModel: TrailDetailViewModel
	@Binding var navigationPath: NavigationPath
	
	init(
		trail: Binding<Trail>,
		raceTrailId: UUID?,
		athlets: [Athlete],
		dataManager: DataStorageManager,
		navigationPath: Binding<NavigationPath>
	) {
		self.viewModel = TrailDetailViewModel(trail: trail, raceTrailId: raceTrailId, athlets: athlets)
		self.dataManager = dataManager
		_navigationPath = Binding(projectedValue: navigationPath)
	}

	var body: some View {
		if viewModel.trail.hasPassed {
			onHasPassed
		} else if viewModel.isTrailOnRace {
			onRace
		} else {
			onNotYetTime
		}
	}
	
	var onRace: some View {
		VStack(alignment: .leading) {
			trailDetails
			AthletsStandings(athlets: viewModel.athlets)
			startButton
		}
		.background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.2))
		.navigationTitle(viewModel.trail.name)
		.navigationBarTitleDisplayMode(.inline)
		.toolbarBackground(.teal.opacity(0.3), for: .navigationBar)
		.toolbarBackground(.visible, for: .navigationBar)
		.containerRelativeFrame([.horizontal, .vertical])
		.background(Gradient(colors: [.teal, .cyan, .green]).opacity(0.2))
		.navigationDestination(for: RaceView.self) { raceView in
			raceView
		}
		.onAppear {
			let appearance = UINavigationBarAppearance()
			appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
			UINavigationBar.appearance().standardAppearance = appearance
			UINavigationBar.appearance().scrollEdgeAppearance = appearance
		}
	}
	
	var onHasPassed: some View {
		VStack {
			Text("Race has been passed!")
			Button(action: {
				navigationPath.removeLast()
			}) {
				Text("Go back!")
			}
		}
	}
	
	var onNotYetTime: some View {
		VStack {
			Text("Not time for this race!")
			Button(action: {
				navigationPath.removeLast()
			}) {
				Text("Go back!")
			}
		}
	}

	var trailDetails: some View {
		HStack(alignment: .top) {
			viewModel.trail.image
				.resizable()
				.frame(width: 140, height: 140)
				.clipShape(.rect(cornerSize: CGSize(width: 12, height: 12)))

			VStack(alignment: .leading) {
				TrailStatusView(image: Image(systemName: "point.topleft.down.to.point.bottomright.curvepath"), color: statusColor.0, text: "LENGTH")
					.frame(height: 64)

				TrailStatusView(image: Image(systemName: "mountain.2.fill"), color: statusColor.1, text: "HEIGHT")
					.frame(height: 64)
			}
			.padding(.zero)
		}
		.padding(8)
		.toolbarBackground(.teal.opacity(0.3), for: .navigationBar)
		.toolbarBackground(.visible, for: .navigationBar)
	}

	var startButton: some View {
		Button(action: {
			navigationPath.append(
				RaceView(
					trail: viewModel.$trail,
					athlets: viewModel.athlets,
					dataManager: dataManager,
					navigationPath: $navigationPath
				)
			)
		}) {
			Text("Start race!")
				.font(.title3.weight(.semibold))
				.padding(.horizontal, 40)
				.padding(.vertical, 16)
				.frame(maxWidth: .infinity)
				.foregroundColor(.white)
				.background(
					LinearGradient(
						colors: [.teal, .blue],
						startPoint: .leading,
						endPoint: .trailing
					)
				)
				.cornerRadius(16)
				.shadow(color: .gray.opacity(0.4), radius: 4, y: 2)
				.overlay(
					RoundedRectangle(cornerRadius: 16)
						.stroke(.white.opacity(0.2), lineWidth: 1)
				)
				.scaleEffect(viewModel.isPressed ? 0.95 : 1.0) // Add a press animation
				.animation(.bouncy, value: viewModel.isPressed)
		}
		.padding(.horizontal, 20)
		.simultaneousGesture(
			DragGesture(minimumDistance: 0)
				.onChanged { _ in viewModel.isPressed = true }
				.onEnded { _ in viewModel.isPressed = false }
		)
	}
}

extension TrailDetailsView {
	// TODO: - Сделать норм
	private var statusColor: (Color, Color) {
		(.blue, .green)
	}
}
