//
//  ContentView.swift
//  GameKitLeakTest
//
//  Created by Dan Waltin on 2023-03-03.
//

import SwiftUI
import GameKit

struct ContentView: View {
	var body: some View {
		Button("Leak memory") {
			leakyVariant()
		}
		.padding()
		Button("Does not leak memory") {
			nonLeakyVariant()
		}
		.padding()
	}
	
	private func leakyVariant() {
		let _ = GKGridGraph(
			fromGridStartingAt: simd_int2(0, 0),
			width: 10,
			height: 10,
			diagonalsAllowed: false)
	}

	private func nonLeakyVariant() {
		let graph = GKGridGraph(
			fromGridStartingAt: simd_int2(0, 0),
			width: 10,
			height: 10,
			diagonalsAllowed: false)
		graph.remove(graph.nodes ?? [])
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
