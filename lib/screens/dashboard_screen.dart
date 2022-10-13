import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tlcn_project/resoures/colors.dart';
import 'package:tlcn_project/widgets/dashboard/row_util.dart';
import 'package:tlcn_project/widgets/dashboard/table_widget.dart';
import 'package:tlcn_project/widgets/dashboard/total_util.dart';
import 'package:tlcn_project/widgets/dashboard/total_widget.dart';
import 'package:tlcn_project/widgets/drawer/drawer_utils.dart';
import 'package:tlcn_project/widgets/drawer/drawer_widget.dart';
import 'package:tlcn_project/widgets/paging/paging_widget.dart';

class DashBoardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';

  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  DrawerTopList getDrawerTopList() {
    return DrawerTopList(
      'Bubble tea',
      const AssetImage('assets/images/icon_logo.png'),
    );
  }

  List<DrawerListItem> getDrawerListItems() {
    return [
      DrawerListItem(
        DrawerHead('Dashboard'),
        [
          DrawerItem('Dashboard', Icons.dashboard_rounded),
          DrawerItem('Products', Icons.emoji_food_beverage),
          DrawerItem('Member', Icons.group),
        ],
      ),
      DrawerListItem(
        DrawerHead('Settings'),
        [
          DrawerItem('Change Settings', Icons.dashboard_rounded),
        ],
      ),
    ];
  }

  List<TotalUtils> getTotalList() {
    var format = DateFormat('dd/MM/yyyy');
    return [
      TotalUtils(
        'BRONZE',
        'assets/images/icon_bronze.png',
        const Color(0xFFAD6239).withAlpha(100),
        100,
        0.25,
        format.format(
          DateTime.now(),
        ),
      ),
      TotalUtils(
        'SLIVER',
        'assets/images/icon_sliver.png',
        const Color(0xFFD3E0E3).withAlpha(100),
        100,
        0.25,
        format.format(
          DateTime.now(),
        ),
      ),
      TotalUtils(
        'GOLD',
        'assets/images/icon_gold.png',
        const Color(0xFFF5D142).withAlpha(100),
        100,
        0.25,
        format.format(
          DateTime.now(),
        ),
      ),
      TotalUtils(
        'DIAMOND',
        'assets/images/icon_diamond.png',
        const Color(0xFFAF3BF7).withAlpha(100),
        100,
        0.25,
        format.format(
          DateTime.now(),
        ),
      ),
    ];
  }

  ListRow getListRow() {
    var header = RowHeader(["MEMBER", 'PHONE', 'MEMBER TYPE']);
    var rows = <MemberRow>[
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
      MemberRow(
        Member(
          name: 'Phan Trung Tin',
          image: 'assets/images/icon_logo.png',
        ),
        '0868754872',
        MemberType.diamond,
      ),
    ];
    var rate = <int>[2, 1, 1];
    var table = ListRow(header: header, rows: rows, rate: rate);
    return table;
  }

  @override
  Widget build(BuildContext context) {
    var utils = getTotalList();
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            DrawerWidget(
              duration: const Duration(milliseconds: 400),
              maxWidth: 250,
              minWidth: 64,
              list: getDrawerListItems(),
              title: getDrawerTopList(),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        children: [
                          Container(
                            color: Color(colors['light']!),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                              child: Row(
                                children: [
                                  const SizedBox(width: 24),
                                  const Text(
                                    'Member',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const Spacer(),
                                  const SizedBox(
                                    width: 300,
                                    height: 48,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        labelText: 'Search',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(16),
                                            topLeft: Radius.circular(16),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 48,
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                      ),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.search),
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 32,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.asset(
                                      'assets/images/icon_logo.png',
                                      height: 36,
                                      width: 36,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    'Phan Trung Tin',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: IntrinsicHeight(
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: utils
                                                .map(
                                                  (util) => Expanded(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: TotalWidget(
                                                          util: util),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                        // Expanded(child: Container()),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        left: 32, right: 32, top: 16),
                                    child: TableWidget(
                                      table: getListRow(),
                                    ),
                                  ),
                                ),
                                const PagingWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
