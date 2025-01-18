# Hot Prospects App  

<p align="center">  
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Hot%20Prospects/Screenshot/Everyone.png" alt="Everyone Tab" width="300"/>  
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Hot%20Prospects/Screenshot/connected.png" alt="Contacted Tab" width="300"/>  
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Hot%20Prospects/Screenshot/unconnectedpng.png" alt="Uncontacted Tab" width="300"/>  
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Hot%20Prospects/Screenshot/me.png" alt="QR Code Sharing" width="300"/>  
   <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Hot%20Prospects/Screenshot/edit.png" alt="QR Code Sharing" width="300"/>  
    <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/refs/heads/main/Hot%20Prospects/Screenshot/share.png" alt="QR Code Sharing" width="300"/>  
</p>  

## Overview  
Hot Prospects is a SwiftUI-based iOS application that simplifies contact management. It allows users to scan QR codes, add prospects, and organize them into contacted and uncontacted categories. Users can also generate and share their own QR codes containing personal contact information.  

## Features  
- **QR Code Scanning:** Quickly scan QR codes to add prospects with name and email.  
- **Contact Categorization:** Organize prospects into contacted and uncontacted tabs.  
- **Status Icons:** Visual indicators show the contact status of each prospect.  
- **Edit Prospects:** Update the name and email address of scanned contacts.  

- **QR Code Sharing:** Share personal QR codes containing your name and email.  

## Requirements  
- **Platform:** iOS 16.0+  
- **Language:** Swift  
- **Frameworks:** SwiftUI, CodeScanner  

## Usage  
1. Open the app and navigate between the tabs: Everyone, Contacted, and Uncontacted.  
2. Use the **Scan** button to add new prospects by scanning QR codes.  
3. View and edit prospect details by tapping on any contact.  
4. Use the **Me** tab to generate and share your personal QR code.  

## Data Storage  
**SwiftData:** Persistent storage for managing prospects and their details.  

## Key Components  
### Models  
- **Prospect:** Represents a contact with attributes for name, email, and contact status.  

### Views  
- **Everyone Tab:** Displays all contacts with their status icons.  
- **Contacted & Uncontacted Tabs:** Filtered views of prospects by contact status.  
- **Me Tab:** Allows users to manage personal details and generate QR codes.  

## Future Enhancements  
- Enable iCloud syncing for cross-device data management.  
- Add reminders for follow-ups with uncontacted prospects.  
- Implement advanced filters and search functionality for contacts.  
