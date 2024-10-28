//
//  AddressView.swift
//  Cupcake Corner
//
//  Created by mac on 26/10/24.
//
import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    @State private var savedAddress = false
    @State private var showingSavedAddresses = false
    
    
    var body: some View {
     
        Form {
            
            Section {
                TextField("Name", text: $order.address.name)
                TextField("Street Address", text: $order.address.streetAddress)
                TextField("City", text: $order.address.city)
                TextField("Zip", text: $order.address.zipCode)
            }
            Section {
                
                Toggle("Save this address", isOn: $savedAddress)
                                       
                
                Section {
                    NavigationLink("Check out"){
                        Checkout(order: order).onAppear(){
                            if savedAddress && order.hasValidAddress {
                                
                                order.addAddress(Address(id: UUID(), name: order.address.name, streetAddress: order.address.streetAddress, city: order.address.city, zipCode: order.address.zipCode))
                            }
                        }
                    }
                    
                }.disabled(order.hasValidAddress==false)
                
                Section {
                    NavigationLink("Saved Addresses"){
                        SavedAddressesView(onSelectAddress: { selectedAddress in
                            order.setAddress(selectedAddress) // Set selected address directly

                        })
                    }
                    
                }
            }.onAppear(){
                print("Dsdsd")
                print(order.address)
            }
            .navigationTitle("Delivery details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

