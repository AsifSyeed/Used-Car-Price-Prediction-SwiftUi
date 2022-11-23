//
//  ContentView.swift
//  AudiCarPricePrediction
//
//  Created by BS901 on 11/23/22.
//

import SwiftUI

struct ContentView: View {
    
    let mlModel = AudiCarPriceModel()
    
    static let modelName = ["A1", "A2", "A3", "A4", "A5", "A6", "A7", "Q1", "Q3", "Q5", "Q7"]
    static let fuelType = ["Petrol", "Diesel"]
    static let year = [2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020]
    static let transmissionType = ["Automatic", "Semi-Auto", "Manual"]
    
    @State private var nameSelection = 0
    @State private var fuelSelection = 0
    @State private var yearSelection = 0
    @State private var transmissionSelec = 0
    @State private var mileage: Double = 0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Model")
                        .fontWeight(.light)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
                Picker("Select your model", selection: $nameSelection) {
                    ForEach(0 ..< Self.modelName.count, id: \.self) { car in
                        Text("\(Self.modelName[car])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    Text("Fuel Type")
                        .fontWeight(.light)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
                Picker("Select fuel type", selection: $fuelSelection) {
                    ForEach(0 ..< Self.fuelType.count, id: \.self) { car in
                        Text("\(Self.fuelType[car])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    Text("Transmission Type")
                        .fontWeight(.light)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                }
                Picker("Select transmission type", selection: $transmissionSelec) {
                    ForEach(0 ..< Self.transmissionType.count, id: \.self) { car in
                        Text("\(Self.transmissionType[car])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                VStack {
                    Spacer()
                    HStack {
                        Text("Manufactured Year")
                            .fontWeight(.light)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    Picker("Select manufactured year", selection: $yearSelection) {
                        ForEach(0 ..< Self.year.count, id: \.self) { car in
                            Text(String("\(Self.year[car])"))
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    HStack {
                        Text("Mileage")
                            .fontWeight(.light)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                        Spacer()
                    }
                    
                    Slider(value: $mileage, in: 0...100000)
                        .padding(20)
                    Text("\(mileage, specifier: "%.2f") miles")
                        .foregroundColor(.black)
                        .fontWeight(.light)
                        .font(.largeTitle)
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
