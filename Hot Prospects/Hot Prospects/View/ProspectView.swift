import SwiftData
import SwiftUI
import CodeScanner

struct ProspectView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    @Environment(\.dismiss) var dismiss
    @State private var isShowingScanner = false

    let filter: FilterType

    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }

    var body: some View {
        NavigationStack {
            List(prospects) { prospect in
                NavigationLink(destination: EditProspectiveView(prospect: prospect)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundStyle(.secondary)
                        }
                        Spacer()
                        if title == "Everyone" {
                            if prospect.isContacted {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            } else {
                                Image(systemName: "questionmark.diamond")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .swipeActions {
                    Button("Delete", role: .destructive) {
                        modelContext.delete(prospect)
                    }
                    
                    if prospect.isContacted {
                        Button("Mark as Uncontacted") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.blue)
                    } else {
                        Button("Mark Contacted") {
                            prospect.isContacted.toggle()
                        }
                        .tint(.green)
                    }
                }
            }
            .navigationTitle(title)
            .toolbar {
                Button {
                    isShowingScanner = true
                } label: {
                    Label("Scan", systemImage: "qrcode.viewfinder")
                }
            }
            .sheet(isPresented: $isShowingScanner) {
                CodeScannerView(codeTypes: [.qr], completion: handleScan)
            }
        }
    }

    init(filter: FilterType) {
        self.filter = filter
        if filter != .none {
            let showConnectedOnly = filter == .contacted
            _prospects = Query(filter: #Predicate {
                $0.isContacted == showConnectedOnly
            }, sort: [SortDescriptor(\Prospect.name)])
        }
    }

    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }

            let person = Prospect(name: details[0], emailAddress: details[1], isContacted: false)

            modelContext.insert(person)
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
}
