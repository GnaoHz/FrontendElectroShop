//
//  ProductConfigurationView.swift
//  thuctap
//
//  Created by NGUYEN VIET HOANG on 24/9/25.
//

import SwiftUI

struct ProductConfigurationView: View {
    let configuration: Configuration
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text("Configuration")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.leading,5)
                Spacer()
            }
            
            Grid(alignment: .leading, horizontalSpacing: 15, verticalSpacing: 20) {
                configRow("CPU", configuration.cpu)
                configRow("RAM", configuration.ram)
                configRow("SSD", configuration.ssd)
                configRow("VGA", configuration.vga)
                configRow("Battery", configuration.battery)
                configRow("Dimensions", configuration.dimensions)
                configRow("Weight", configuration.weight)
                configRow("Hz", configuration.hz)
                configRow("Security", configuration.security)
                configRow("Bluetooth", configuration.bluetooth)
                configRow("OS", configuration.operatingSystem)
                configRow("Webcam", configuration.webcam)
                configRow("Brand", configuration.brand)
                configRow("Wi-Fi", configuration.wifi)
                configRow("Warranty", configuration.warranty)
            }
            .font(.subheadline)
            .padding(10)
        }
    }
    
    @ViewBuilder
    private func configRow(_ label: String, _ value: String) -> some View {
        GridRow {
            Text(label)
                .fontWeight(.semibold)
            Text(value)
        }
    }
}
