import SwiftUI
import SwiftData

@Model
class ExpenseItem: Identifiable, Codable {
    var id: UUID
    var name: String
    var type: String
    var amount: Double

    // Initializer
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }

    // MARK: - Codable Conformance
    private enum CodingKeys: String, CodingKey {
        case id, name, type, amount
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.amount = try container.decode(Double.self, forKey: .amount)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(type, forKey: .type)
        try container.encode(amount, forKey: .amount)
    }
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
    @Environment(\.modelContext) var modelContext

    @Query var expenses: [ExpenseItem]
    @State private var showingAddExpense = false
    var currencyCode: String {
        Locale.current.currency?.identifier ?? "USD"
    }
    
    @Query(filter: #Predicate<ExpenseItem> { expense in
        expense.type == "Personal"
    },sort:  \ExpenseItem.amount) var personalExpenses: [ExpenseItem]

    @Query(filter: #Predicate<ExpenseItem> { expense in
        expense.type == "Business"
    },sort:  \ExpenseItem.amount) var businessExpenses: [ExpenseItem]

    
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
                    
                    
                    if(!businessExpenses.isEmpty) {
                        Section("Buisness Expenses"){
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
                AddView()
            }
        }
    }
    


    private func removeItems(from items: [ExpenseItem], at offsets: IndexSet) {
        for index in offsets {
            let item = items[index]
            modelContext.delete(item)
        }
        
        do {
            try modelContext.save()
        } catch {
            print("Failed to delete items: \(error.localizedDescription)")
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
