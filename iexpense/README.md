

# iExpenses

iExpenses is a simple expense tracking app built using SwiftUI. It allows users to add, categorize, and delete expenses, with data persistence using `UserDefaults`.

<p align="center">
  <img src="https://raw.githubusercontent.com/ashut08/100daysSwiftUIChallenge/main/iexpense/iExpenses.png" alt="unitconverter" width="300"/>
</p>

## Features

- Add expenses with name, category (Personal or Business), and amount.
- Expenses are categorized into two sections: **Personal** and **Business**.
- Apply different styling to expenses based on their amount:
  - **Under $10** ➡️ Green
  - **Under $100** ➡️ Orange
  - **Over $100** ➡️ Red
- Data persistence using `UserDefaults`.

## How It Works

- **ExpenseItem**: Stores individual expense details (`name`, `type`, `amount`), conforming to `Identifiable` and `Codable`.
- **Expenses**: An `ObservableObject` that manages and saves expense items to `UserDefaults`.
- **ContentView**: Displays expenses in two sections (Personal/Business) and handles addition and deletion of expenses.
- **AddView**: A form view that allows users to input a new expense and save it to the list.



This `README.md` provides a brief overview of the app, its features, how it works, and installation instructions. Let me know if you need any changes!