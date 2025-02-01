//
//  ContentView.swift
//  Flashzilla
//
//  Created by mac on 20/01/25.
//

import SwiftUI


struct ContentView: View {
    
    @State private var isShowingAnswer = false
    @State private var cards = [Card]()
    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.scenePhase) var scenePhase
    @State private var isActive = true
    @State private var progress: CGFloat = 2.0
    @State private var showingEditScreen: Bool = false
    let card:Card
    var body: some View {
        let width = 10
          let height = 5
        ZStack {
            
            Image(.background)
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Time: \(timeRemaining)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                
                if cards.isEmpty{   Button("Start Again", action: resetCards)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.black)
                        .clipShape(.capsule)
                }
                VStack {
                    HStack {
                        Spacer()

                        Button {
                            showingEditScreen = true
                        } label: {
                            Image(systemName: "plus.circle")
                                .padding()
                                .background(.black.opacity(0.7))
                                .clipShape(.circle)
                        }
                    }

                    Spacer()
                }
                .foregroundStyle(.white)
                .font(.largeTitle)
             
                
                ZStack {
                    ForEach(0..<cards.count, id: \.self) { index in
                        
                        CardView(onRemove: {
                            withAnimation{
                                removeCard(at: index)
                            }
                        }, card: cards[index])
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                
                
                
            }
            
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards,content:EditCards.init ).onAppear(perform: resetCards)
        .onReceive(timer) { time in
            guard   isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }.onChange(of: scenePhase) {
            if scenePhase == .active {
                if cards.isEmpty == false {
                    isActive = true
                }
            } else {
                isActive = false
            }
        }
    }
    func removeCard(at index: Int) {
        cards.remove(at: index)
        if cards.isEmpty {
            isActive = false
        }
    }
    func resetCards() {
        timeRemaining = 100
        isActive = true
        loadData()
    }
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                cards = decoded
            }
        }
    }
}

#Preview {
    ContentView(card: .example)
}
