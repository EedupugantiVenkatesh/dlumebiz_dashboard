import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

enum SidebarTab {
  home,
  items,
  banking,
  sales,
  purchases,
  timeTracking,
  accountant,
  reports,
  documents,
  payroll,
}

class Sidebar extends StatelessWidget {
  final SidebarTab selectedTab;
  final ValueChanged<SidebarTab>? onTabSelected;
  final bool showText;
  const Sidebar({
    Key? key,
    this.selectedTab = SidebarTab.home,
    this.onTabSelected,
    this.showText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final fontSize = isMobile ? 11.0 : 14.0;
    final iconSize = isMobile ? 16.0 : 20.0;
    return Container(
      width: isMobile ? 64 : 200,
      color: const Color(0xFFFAFBFC),
      child: Column(
        children: [
          // const Divider(),
          _SidebarItem(
            icon: Icons.home,
            label: AppStrings.home,
            selected: selectedTab == SidebarTab.home,
            onTap: () => onTabSelected?.call(SidebarTab.home),
            fontSize: fontSize,
            iconSize: iconSize,
            isMobile: isMobile,
            showText: showText,
            trailing: null,
          ),
          _SidebarItem(
            icon: Icons.list_alt,
            label: AppStrings.items,
            selected: selectedTab == SidebarTab.items,
            onTap: () => onTabSelected?.call(SidebarTab.items),
            fontSize: fontSize,
            iconSize: iconSize,
            isMobile: isMobile,
            showText: showText,
            trailing: null,
          ),
          _SidebarItem(
            icon: Icons.account_balance,
            label: AppStrings.banking,
            selected: selectedTab == SidebarTab.banking,
            onTap: () => onTabSelected?.call(SidebarTab.banking),
            fontSize: fontSize,
            iconSize: iconSize,
            isMobile: isMobile,
            showText: showText,
            trailing: Icon(Icons.chevron_right, size: iconSize, color: Colors.grey[400]),
          ),
          _SidebarItem(
            icon: Icons.shopping_cart,
            label: AppStrings.sales,
            selected: selectedTab == SidebarTab.sales,
            onTap: () => onTabSelected?.call(SidebarTab.sales),
            fontSize: fontSize,
            iconSize: iconSize,
            isMobile: isMobile,
            showText: showText,
            trailing: Icon(Icons.chevron_right, size: iconSize, color: Colors.grey[400]),
          ),
          _SidebarItem(
            icon: Icons.receipt,
            label: AppStrings.purchases,
            selected: selectedTab == SidebarTab.purchases,
            onTap: () => onTabSelected?.call(SidebarTab.purchases),
            fontSize: fontSize,
            iconSize: iconSize,
            isMobile: isMobile,
            showText: showText,
            trailing: Icon(Icons.chevron_right, size: iconSize, color: Colors.grey[400]),
          ),
          _SidebarItem(
            icon: Icons.access_time,
            label: AppStrings.timeTracking,
            selected: selectedTab == SidebarTab.timeTracking,
            onTap: () => onTabSelected?.call(SidebarTab.timeTracking),
            fontSize: fontSize,
            iconSize: iconSize,
            isMobile: isMobile,
            showText: showText,
            trailing: Icon(Icons.chevron_right, size: iconSize, color: Colors.grey[400]),
          ),
          _SidebarItem(
            icon: Icons.account_box,
            label: AppStrings.accountant,
            selected: selectedTab == SidebarTab.accountant,
            onTap: () => onTabSelected?.call(SidebarTab.accountant),
            fontSize: fontSize,
            iconSize: iconSize,
            isMobile: isMobile,
            showText: showText,
            trailing: Icon(Icons.chevron_right_rounded, size: iconSize, color: Colors.grey[400]),
          ),
          _SidebarItem(
            icon: Icons.bar_chart,
            label: AppStrings.reports,
            selected: selectedTab == SidebarTab.reports,
            onTap: () => onTabSelected?.call(SidebarTab.reports),
            fontSize: fontSize,
            iconSize: iconSize,
            isMobile: isMobile,
            showText: showText,
            trailing: null,
          ),
          _SidebarItem(
            icon: Icons.description,
            label: AppStrings.documents,
            selected: selectedTab == SidebarTab.documents,
            onTap: () => onTabSelected?.call(SidebarTab.documents),
            fontSize: fontSize,
            iconSize: iconSize,
            isMobile: isMobile,
            showText: showText,
            trailing: null,
          ),
          _SidebarItem(
            icon: Icons.payments,
            label: AppStrings.payroll,
            selected: selectedTab == SidebarTab.payroll,
            onTap: () => onTabSelected?.call(SidebarTab.payroll),
            fontSize: fontSize,
            iconSize: iconSize,
            isMobile: isMobile,
            showText: showText,
            trailing: null,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap;
  final double fontSize;
  final double iconSize;
  final bool isMobile;
  final bool showText;
  final Widget? trailing;
  const _SidebarItem({
    required this.icon,
    required this.label,
    this.selected = false,
    this.onTap,
    required this.fontSize,
    required this.iconSize,
    required this.isMobile,
    this.showText = true,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left:6,top: 6,),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? Colors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          dense: isMobile,
          minLeadingWidth: 0,
          contentPadding: EdgeInsets.symmetric(
            horizontal: isMobile ? 8 : 12,
            vertical: 0,
          ),
          leading: Icon(
            icon,
            color: selected ? Colors.white : Colors.black54,
            size: iconSize,
          ),
          title: showText
              ? Text(
                  label,
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black87,
                    fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                    fontSize: fontSize,
                  ),
                )
              : null,
          trailing: trailing,
          onTap: onTap,
        ),
      ),
    );
  }
}
