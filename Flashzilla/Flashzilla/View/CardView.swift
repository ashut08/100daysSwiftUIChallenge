//
//  CardView.swift
//  Flashzilla
//
//  Created by mac on 20/01/25.
//
import SwiftUI
struct CardView : View {
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    var onRemove: (() -> Void)?
    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
    


let card: Card
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 25)
                .fill(
                    accessibilityDifferentiateWithoutColor ? .white : .white
                        .opacity(1 - Double(abs(offset.width / 50)))
                ).background(RoundedRectangle(cornerRadius: 25).fill(offset.width>0 ? .green : .red))
          
            
            VStack{
                
                Text(card.prompt)
                    .font(.largeTitle)
                                   .foregroundStyle(.black)

                if isShowingAnswer{   Text(card.answer)
                        .font(.title)
                        .foregroundStyle(.secondary)
                }
            }  .padding(20)
                .multilineTextAlignment(.center)
            
        }
         .padding(20).frame(width: 450, height: 250).rotationEffect(.degrees(offset.width / 5.0)).offset(x: offset.width * 5).offset(x: offset.width * 5).gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if abs(offset.width) > 100 {
                        onRemove?() 
                    } else {
                        offset = .zero
                    }
                }
        )
            .onTapGesture {
            isShowingAnswer.toggle()
        }
    }
}
