# DlumeBiz Dashboard

A modern, responsive business management dashboard built with Flutter. This application provides a comprehensive interface for managing various aspects of your business operations.

## Features

- 📱 Responsive design that works on desktop, tablet, and mobile devices
- 📊 Interactive dashboard with sales and purchase analytics
- 💼 Customer management system
- 📈 Sales and purchase tracking
- 🏦 Banking integration
- ⏱️ Time tracking capabilities
- 📝 Document management
- 💰 Payroll management
- 📋 Reports generation

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/dlumebiz_dashboard.git
```

2. Navigate to the project directory:
```bash
cd dlumebiz_dashboard
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the application:
```bash
flutter run
```

## Project Structure

```
lib/
├── constants/
│   └── app_strings.dart    # Centralized string management
├── screens/
│   └── dashboard_screen.dart
├── widgets/
│   ├── invoice_card.dart
│   ├── sidebar.dart
│   ├── topbar.dart
│   └── top_selling_chart.dart
└── main.dart
```

## Key Components

- **Dashboard Screen**: Main interface showing business overview
- **Sidebar**: Navigation menu with all major business functions
- **Invoice Cards**: Display purchase and sales information
- **Top Selling Chart**: Visual representation of product performance

## Responsive Design

The application is designed to work seamlessly across different screen sizes:
- Desktop (>900px): Full sidebar with text labels
- Tablet (600px-900px): Compact layout
- Mobile (<600px): Optimized for smaller screens with hamburger menu

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For any queries or support, please contact:
- Email: info@dlume.com
- Website: [www.dlume.com](https://www.dlume.com)

## Acknowledgments

- Flutter team for the amazing framework
- All contributors who have helped shape this project
