
import SwiftUI
struct SavedAddressesView: View {
    @Environment(\.dismiss) var dismiss
    @State private var order = Order()
    var onSelectAddress: (Address) -> Void // Callback to send selected address

    

    var body: some View {
        
        NavigationStack {
         
            if order.addressList.isEmpty{Text("No Addresses Saved")} else{ List(order.addressList) { address in
                VStack(alignment: .leading) {
                    HStack{
                        Text("Name:")
                        Text(address.name)
                            .font(.headline)
                    }
                    HStack{
                     Text("Street Address:")
                        Text(address.streetAddress)
                            .font(.subheadline)
                    }
                    HStack{
                        Text("City:")
                        Text(address.city)
                    }
                             HStack{
                            Text("ZipCode:")
                            Text("\(address.zipCode)")
                        }
                             
                   
                }.onTapGesture {
                    onSelectAddress(address)
                    dismiss()
                
                }
                .swipeActions {
                    Button(role: .destructive) {
                        order.deleteAddress(by: address.id)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .navigationTitle("Saved Addresses")
            
            } }.onAppear(){
            order.loadAddressList()
        }
    }

    
}
