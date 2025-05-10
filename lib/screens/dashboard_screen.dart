import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/topbar.dart';
import '../widgets/invoice_card.dart';
import '../widgets/top_selling_chart.dart';
import '../constants/app_strings.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  SidebarTab _selectedTab = SidebarTab.home;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 900;
    final isMobile = width < 600;
    return Scaffold(
      drawer: isWide
          ? null
          : SafeArea(
              child: SizedBox(
                width: width * 0.7, // 60% of screen width
                child: Sidebar(
                  selectedTab: _selectedTab,
                  onTabSelected: (tab) {
                    setState(() => _selectedTab = tab);
                    Navigator.of(context).pop();
                  },
                  showText: true,
                ),
              ),
            ),
      body: Column(
        children: [
          // Topbar always at the top, full width
          Stack(
            children: [
              Topbar(leftPadding: isMobile ? 44.0 : 0.0),
              if (isMobile)
                Positioned(
                  left: 0,
                  top: 35,
                  bottom: 0,
                  child: Center(
                    child: Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu, color: Colors.white),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        tooltip: 'Open menu',
                        padding: const EdgeInsets.all(12),
                        constraints: const BoxConstraints(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Row(
              children: [
                if (isWide)
                  Sidebar(
                    selectedTab: _selectedTab,
                    onTabSelected: (tab) => setState(() => _selectedTab = tab), showText: true,
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: _buildTabContent(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    
    switch (_selectedTab) {
      case SidebarTab.home:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dashboard heading
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppStrings.helloDlume,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.black87,
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, size: 32, color: Colors.grey[700])
                  ],
                ),
                const SizedBox(width: 16),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    AppStrings.userEmail,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Add Customer button above Sales Invoice
            Row(
              children: [
                const Spacer(),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.person_add, color: Colors.white, size: 18),
                  label: Text(AppStrings.addCustomer, style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Cards Row
            Row(
              children: [
                Expanded(
                  child: InvoiceCard(
                    title: AppStrings.purchaseInvoice,
                    leftLabel: AppStrings.dailySales,
                    leftValue: '2490 L',
                    rightLabel: AppStrings.overdue,
                    rightValue: '2490 L',
                    showNewButton: true,
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: InvoiceCard(
                    title: AppStrings.salesInvoice,
                    leftLabel: AppStrings.stockOverview,
                    leftValue: '',
                    rightLabel: AppStrings.outOfStock,
                    rightValue: '',
                    showNewButton: true,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Top Selling Product Chart
            const TopSellingChart(),
            const SizedBox(height: 32),
            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: isMobile ? 4 : 8),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.symmetric(vertical: isMobile ? 8 : 12),
                      ),
                      child: Text(
                        AppStrings.viewSalesHistory,
                        style: TextStyle(fontSize: isMobile ? 11 : 14),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: isMobile ? 4 : 8),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: EdgeInsets.symmetric(vertical: isMobile ? 8 : 12),
                      ),
                      child: Text(
                        AppStrings.viewPurchaseHistory,
                        style: TextStyle(fontSize: isMobile ? 11 : 14),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(height: 100, color: Colors.transparent),
          ],
        );
      default:
        return Center(
          child: Text(
            _selectedTab.toString().split('.').last.toUpperCase() + ' ' + AppStrings.page,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey,
            ),
          ),
        );
    }
  }
}
