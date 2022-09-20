//
//  ContentView.swift
//  TryMeApp
//
//  Created by Lera Savchenko on 19.09.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 0..<100)
    @State private var alertPresented = false
    @Binding var currentValue: Double
    @Binding var thumbColor: UIColor
    
    var body: some View {
        VStack {
         
            Text("Подвинь слайдер как можно ближе к: \(targetValue) ")
            HStack {
                Text("0")
                Slider(sliderValue: $currentValue, thumbColor: $thumbColor)
                Text("100")
                    
            }
            .padding()
            Button ("Проверь меня!", action: {alertPresented.toggle() } )
                .alert("Ваш счет", isPresented: $alertPresented) {
                    Button("OK") {}
                } message: {
                    Text("\(computeScore())")
                }
                .padding()
            Button("Начать заново") {
                targetValue = Int.random(in: 0..<100)
            }
            .padding()
        }
        
    }
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func setSliderThumbColor() -> UIColor {
        let difference = abs(targetValue - lround(currentValue))
        if difference < 20 {
            thumbColor = UIColor(red: 255, green: 0, blue: 0, alpha: 1)
        } else if difference > 21 && difference < 50 {
            thumbColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.5)
        } else {
            thumbColor = UIColor(red: 255, green: 0, blue: 0, alpha: 0.1)
        }
        return thumbColor
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(currentValue: .constant(44), thumbColor: .constant(.red))
    }
}
