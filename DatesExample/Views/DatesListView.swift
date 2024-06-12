//
//  DatesListView.swift
//  DatesExample
//
//  Created by Russell Gordon on 2024-06-12.
//

import SwiftUI

struct DatesListView: View {
    
    // MARK: Stored properties
    
    // Tracks data provided by the user
    @State private var firstName: String = ""
    @State private var providedDate: Date = Date()
    
    // Tracks a list of names provided by the user, along with a date they picked
    @State private var people: [Person] = examplePeople
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            
            VStack {
                VStack {
                    TextField("What's your name?", text: $firstName)
                    DatePicker("Pick a date", selection: $providedDate)
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            // Add a new person and a date they selected
                            let newPerson = Person(
                                firstName: firstName,
                                providedDate: providedDate
                            )
                            people.insert(newPerson, at: 0) // Add new person at top of list
                        } label: {
                            Text("Add")
                        }
                        .padding(.top, 10)
                    }

                }
                .padding()
                
                List(people) { currentPerson in
                    VStack(alignment: .leading) {
                        Text(currentPerson.firstName)
                            .bold()
                        Text("\(currentPerson.providedDate.formatted(date: .long, time: .standard))")
                    }
                }
            }
            .navigationTitle("Dates Example")
        }
    }
}

#Preview {
    DatesListView()
}
