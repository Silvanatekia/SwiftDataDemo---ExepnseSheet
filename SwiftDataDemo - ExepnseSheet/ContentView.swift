//
//  ContentView.swift
//  SwiftDataDemo - ExepnseSheet
//
//  Created by Silvana Tekia on 27/02/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Query(sort: \Expense.date) var expenses: [Expense]
    @State private var isShowingItemSheet = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses) { expense in ExpenseCell(expense: expense)
                }
            }
            .navigationTitle("Expenses")
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $isShowingItemSheet) { AddExpenseSheet() }
            .toolbar {
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            
            .overlay {
                
                if expenses.isEmpty {
                    VStack {
                        ContentUnavailableView(
                            label: { Label("No Expense", systemImage: "list.bullet.rectangle.portrait") },
                            description: { Text("Start adding expenses to see your list") },
                            actions: {
                                Button("Add Expenses") { isShowingItemSheet = true }
                            })
                        .offset(y: -60)
                        
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}


