import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityHomeScreen extends StatefulWidget {
  const HighFidelityHomeScreen({super.key});

  @override
  State<HighFidelityHomeScreen> createState() => _HighFidelityHomeScreenState();
}

class _HighFidelityHomeScreenState extends State<HighFidelityHomeScreen> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = [
    'All Coffee',
    'Machiato',
    'Latte',
    'Americano'
  ];

  final List<Product> _products = [
    Product(
      imagePath: 'assets/images/I216_192_417_715.png',
      name: 'Caffe Mocha',
      description: 'Deep Foam',
      price: 4.53,
      rating: 4.8,
    ),
    Product(
      imagePath: 'assets/images/I216_208_417_717.png',
      name: 'Flat White',
      description: 'Espresso',
      price: 3.53,
      rating: 4.8,
    ),
    Product(
      imagePath: 'assets/images/I216_240_417_716.png',
      name: 'Mocha Fusi',
      description: 'Ice/Hot',
      price: 7.53,
      rating: 4.8,
    ),
    Product(
      imagePath: 'assets/images/I216_224_417_718.png',
      name: 'Caffe Panna',
      description: 'Ice/Hot',
      price: 5.53,
      rating: 4.8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: CustomScrollView(
        slivers: [
          _buildHeaderSliver(),
          _buildBodySliver(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  SliverAppBar _buildHeaderSliver() {
    return SliverAppBar(
      expandedHeight: 280.0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF111111), Color(0xFF313131)],
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLocationSection(),
                  const SizedBox(height: 24),
                  _buildSearchBar(),
                  const SizedBox(height: 24),
                  _buildPromoBanner(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: GoogleFonts.sora(color: const Color(0xFFA2A2A2), fontSize: 12),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              'Bilzen, Tanjungbalai',
              style: GoogleFonts.sora(
                color: const Color(0xFFD8D8D8),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(Icons.keyboard_arrow_down,
                color: Color(0xFFD8D8D8), size: 20),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFF292929),
              hintText: 'Search coffee',
              hintStyle: GoogleFonts.sora(
                  color: const Color(0xFFA2A2A2), fontSize: 14),
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Container(
          width: 52,
          height: 52,
          decoration: BoxDecoration(
            color: const Color(0xFFC67C4E),
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage('assets/images/216_258.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 13,
            left: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFED5151),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Promo',
                style: GoogleFonts.sora(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            bottom: 20,
            child: Text(
              'Buy one get one\nFREE',
              style: GoogleFonts.sora(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w600,
                height: 1.25,
                shadows: [
                  const Shadow(
                      blurRadius: 4.0,
                      color: Colors.black54,
                      offset: Offset(0, 2))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodySliver() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            const SizedBox(height: 24),
            _buildCategoryTabs(),
            const SizedBox(height: 24),
            _buildProductGrid(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(_categories.length, (index) {
          bool isSelected = _selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedCategoryIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFC67C4E)
                    : const Color(0xFFF3F3F3),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _categories[index],
                style: GoogleFonts.sora(
                  color: isSelected ? Colors.white : const Color(0xFF313131),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildProductGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: (156 / 238),
      ),
      itemCount: _products.length,
      itemBuilder: (context, index) => _buildProductCard(_products[index]),
    );
  }

  Widget _buildProductCard(Product product) {
    return GestureDetector(
      onTap: () => context.push('/high_fidelity_detail_item'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    product.imagePath,
                    height: 132,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFFBBE21), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          product.rating.toString(),
                          style: GoogleFonts.sora(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.name,
                            style: GoogleFonts.sora(
                                color: const Color(0xFF222222),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                        const SizedBox(height: 4),
                        Text(product.description,
                            style: GoogleFonts.sora(
                                color: const Color(0xFFA2A2A2), fontSize: 12)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$ ${product.price.toStringAsFixed(2)}',
                            style: GoogleFonts.sora(
                                color: const Color(0xFF030303),
                                fontSize: 18,
                                fontWeight: FontWeight.w600)),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                              color: const Color(0xFFC67C4E),
                              borderRadius: BorderRadius.circular(8)),
                          child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.add,
                                  color: Colors.white, size: 20),
                              onPressed: () {}),
                        ),
                      ],
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

  Widget _buildBottomNavBar(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();

    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavBarItem(
            Icons.home,
            isActive: currentRoute == '/high_fidelity_home',
            onTap: () {
              if (currentRoute != '/high_fidelity_home') {
                context.go('/high_fidelity_home');
              }
            },
          ),
          _buildNavBarItem(
              Icons.favorite_border, isActive: false, onTap: () {}),
          _buildNavBarItem(
            Icons.shopping_bag_outlined,
            isActive: currentRoute == '/high_fidelity_order',
            onTap: () => context.go('/high_fidelity_order'),
          ),
          _buildNavBarItem(
              Icons.notifications_none, isActive: false, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(IconData icon,
      {required bool isActive, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: isActive ? const Color(0xFFC67C4E) : const Color(0xFFA2A2A2),
              size: 28),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 6),
              height: 5,
              width: 10,
              decoration: BoxDecoration(
                color: const Color(0xFFC67C4E),
                borderRadius: BorderRadius.circular(18),
              ),
            ),
        ],
      ),
    );
  }
}

class Product {
  final String imagePath;
  final String name;
  final String description;
  final double price;
  final double rating;

  Product({
    required this.imagePath,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
  });
}