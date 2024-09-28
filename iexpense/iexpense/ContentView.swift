import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID() // Automatically generates a unique ID
    let name: String
    let type: String
    let amount: Double
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            // Save to UserDefaults whenever the items array changes
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        // Load saved items from UserDefaults if available
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        

        items = []
    }
}

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
    var personalExpenses: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
       }

       var businessExpenses: [ExpenseItem] {
           expenses.items.filter { $0.type == "Business" }
       }

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    
                    if(!personalExpenses.isEmpty) {  Section("Personal Expenses"){
                        ForEach(personalExpenses) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                Text(item.amount, format: .currency(code: currencyCode)).foregroundColor(returnColr(item.amount))
                            }
                        }
                        .onDelete { offsets in
                                                   removeItems(from: personalExpenses, at: offsets)
                                               }
                    }
                    }
                    
                    
                    if(!businessExpenses.isEmpty) {     Section("Buisness Expenses"){
                        ForEach(businessExpenses) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                Text(item.amount, format: .currency(code: currencyCode)).foregroundColor(returnColr(item.amount))
                            }
                        }
                        .onDelete { offsets in
                                                   removeItems(from: businessExpenses, at: offsets)
                                               }
                    }
                    }
                }
            }
            .toolbar {
                // Add Expense button
                Button {
                    showingAddExpense = true
                } label: {
                    Label("Add Expense", systemImage: "plus")
                }
            }
            .navigationTitle("iExpenses")
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    

    // Remove items from the list, carefully handling different sections
        func removeItems(from category: [ExpenseItem], at offsets: IndexSet) {
            for offset in offsets {
                if let index = expenses.items.firstIndex(where: { $0.id == category[offset].id }) {
                    expenses.items.remove(at: index)
                }
            }
        }
    func returnColr(_ amount:Double) -> Color {
        if amount < 100 {
                    return .green
                } else if amount < 1000 {
                    return .yellow
                } else {
                    return .red
                }
        
    }
    
   
}

#Preview {
    ContentView()
}
