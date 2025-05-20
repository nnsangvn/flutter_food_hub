import 'package:flutter/material.dart';
import 'package:flutter_food_hub/common/widget/custom_appbar.dart';
import 'package:flutter_food_hub/core/configs/theme/app_colors.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> foodCategories = [
    {
      'name': 'Burger',
      'image': 'assets/images/category/bugger.png',
      'color': Color(0xFFFA6D35),
      'isSelected': true,
    },
    {
      'name': 'Donat',
      'image': 'assets/images/category/donat.png',
      'color': Color(0xFFFFFFFF),
      'isSelected': false,
    },
    {
      'name': 'Pizza',
      'image': 'assets/images/category/pizza.png',
      'color': Color(0xFFFFFFFF),
      'isSelected': false,
    },
    {
      'name': 'Mexican',
      'image': 'assets/images/category/mexican.png',
      'color': Color(0xFFFFFFFF),
      'isSelected': false,
    },
    {
      'name': 'Asian',
      'image': 'assets/images/category/asian.png',
      'color': Color(0xFFFFFFFF),
      'isSelected': false,
    },
  ];

  final List<Map<String, dynamic>> restaurants = [
    {
      'name': 'Burger King',
      'image': 'assets/images/restaurant/mc-donald.png',
      'rating': 4.5,
      'deliveryTime': '15-20 min',
      'deliveryFee': '\$2.99',
    },
    {
      'name': 'McDonald\'s',
      'image': 'assets/images/restaurant/mc-donald.png',
      'rating': 4.2,
      'deliveryTime': '20-30 min',
      'deliveryFee': '\$1.99',
    },
    {
      'name': 'Pizza Hut',
      'image': 'assets/images/restaurant/mc-donald.png',
      'rating': 4.7,
      'deliveryTime': '25-35 min',
      'deliveryFee': '\$3.50',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: CustomAppBar(
        isMenu: true,
        actionType: ActionType.avatar,
        onMenuPressed: () {
          print('menu pressed');
        },
        customTitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Deliver to',
                  style: TextStyle(
                    color: Color(0xFF8C9099),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF8C9099),
                  size: 20,
                ),
              ],
            ),
            Text(
              '4102 Pretty View Lane',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 24, bottom: 30),
                child: Text(
                  'What would you like to order',
                  style: TextStyle(
                    color: AppColors.textDarkColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
            SliverStickyHeader(
              // header sẽ dính lại khi scroll
              header: Container(
                color: AppColors.lightBackground,
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          suffixIcon: Icon(
                            Icons.close,
                            color: Colors.grey,
                          ),
                          hintText: 'Find for food or restaurant...',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          filled: true,
                          fillColor: Color(0xFFFCFCFD),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0XFFEFEFEF),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Color(0XFFEFEFEF),
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 24),
                    Container(
                      width: 50,
                      height: 50,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/option.svg',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),

              // Phần scroll bên dưới
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Danh mục món ăn
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foodCategories.length,
                        itemBuilder: (context, index) {
                          final category = foodCategories[index];
                          return Container(
                            width: 80,
                            height: 98,
                            margin: EdgeInsets.only(right: 12, bottom: 4),
                            padding: EdgeInsets.only(top: 6),
                            decoration: BoxDecoration(
                              color: category['isSelected'] ? AppColors.primary : AppColors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Column(
                              children: [
                                // Ảnh món ăn
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: category['isSelected']
                                        ? [
                                            BoxShadow(
                                              color: category['color'].withOpacity(0.3),
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            )
                                          ]
                                        : null,
                                  ),
                                  child: Image.asset(
                                    '${category['image']}',
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                // Tên món ăn
                                Text(
                                  category['name'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: category['isSelected']
                                        ? AppColors.lightBackground
                                        : AppColors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    SizedBox(height: 30),

                    // Tiêu đề nhà hàng nổi bật
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Featured Restaurants',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textDarkColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'View All',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.primary,
                                size: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Featured Restaurant Cards
                    SizedBox(
                      height: 229,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: restaurants.length,
                        separatorBuilder: (context, index) => SizedBox(width: 16),
                        itemBuilder: (context, index) {
                          final restaurant = restaurants[index];
                          return Stack(
                            children: [
                              // Card restaurant
                              Container(
                                width: 266,
                                height: 229,
                                decoration: BoxDecoration(
                                  color: AppColors.lightBackground,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.shadowColor,
                                      blurRadius: 30,
                                      offset: Offset.zero,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Ảnh nhà hàng
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      child: Image.asset(restaurant['image']),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Tên nhà hàng
                                          Row(
                                            children: [
                                              Text(
                                                restaurant['name'],
                                                style: TextStyle(
                                                  color: AppColors.textDarkColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(width: 4),
                                              Icon(
                                                Icons.check_circle,
                                                color: AppColors.bgVerifyIcon,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4),

                                          // Free delivery và thời gian giao hàng
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/bike.svg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    'Free delivery',
                                                    style: TextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 16),
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    'assets/icons/timer.svg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(width: 4),
                                                  Text(
                                                    restaurant['deliveryTime'],
                                                    style: TextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 10),

                                          // Category
                                          SizedBox(
                                            height: 22,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 3,
                                              itemBuilder: (context, index) {
                                                final category = foodCategories[index];
                                                return Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 4, vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: AppColors.grey.withValues(alpha: 0.1),
                                                    borderRadius: BorderRadius.circular(5),
                                                  ),
                                                  child: Text(
                                                    category['name'].toString().toUpperCase(),
                                                    style: TextStyle(
                                                      color: AppColors.grey,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                );
                                              },
                                              separatorBuilder: (context, index) =>
                                                  SizedBox(width: 4),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Rating and love
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 32,
                                      padding: EdgeInsets.symmetric(horizontal: 4),
                                      decoration: BoxDecoration(
                                        color: AppColors.lightBackground,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            restaurant['rating'].toString(),
                                            style: TextStyle(
                                              color: AppColors.textDarkColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: AppColors.cFFC529,
                                          ),
                                          Text(
                                            '(25+)',
                                            style: TextStyle(
                                              color: AppColors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Positioned(
                                top: 10,
                                right: 10,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.favorite,
                                        color: AppColors.lightBackground,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
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
