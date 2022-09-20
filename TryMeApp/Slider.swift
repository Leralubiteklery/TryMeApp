//
//  Slider.swift
//  TryMeApp
//
//  Created by Lera Savchenko on 19.09.22.
//

import SwiftUI

struct Slider: UIViewRepresentable {

    @Binding var sliderValue: Double
    @Binding var thumbColor: UIColor

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = thumbColor
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didSliderValueChange),
            for: .valueChanged
        )
        
        return slider
    }
 
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }

}

extension Slider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        
        init(sliderValue: Binding<Double>) {
            self._sliderValue = sliderValue
        }
        
        @objc func didSliderValueChange(_ sender: UISlider) {
            sliderValue = Double(sender.value)
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider(sliderValue: .constant(76), thumbColor: .constant(.red))
    }
}
