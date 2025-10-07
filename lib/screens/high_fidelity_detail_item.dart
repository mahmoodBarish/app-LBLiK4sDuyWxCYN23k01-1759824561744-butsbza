import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityDetailItem extends StatefulWidget {
  const HighFidelityDetailItem({super.key});

  @override
  State<HighFidelityDetailItem> createState() => _HighFidelityDetailItemState();
}

class _HighFidelityDetailItemState extends State<HighFidelityDetailItem> {
  String _selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFAFA),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductImage(),
                      const SizedBox(height: 20),
                      _buildProductInfo(),
                      const SizedBox(height: 20),
                      const Divider(color: Color(0xFFE2E2E2), thickness: 1),
                      const SizedBox(height: 20),
                      _buildDescription(),
                      const SizedBox(height: 20),
                      _buildSizeSelector(),
                      const SizedBox(height: 120), // Space for the bottom bar
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: _buildBottomBar(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon:
                  const Icon(Icons.arrow_back_ios_new, color: Color(0xFF232323)),
              onPressed: () {
                context.pop();
              },
            ),
            Text(
              'Detail',
              style: GoogleFonts.sora(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF232323),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Color(0xFF232323)),
              onPressed: () {
                // Handle favorite action
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        'assets/images/I219_424_417_715.png',
        width: double.infinity,
        height: 226,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Caffe Mocha',
                    style: GoogleFonts.sora(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF232323),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ice/Hot',
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      color: const Color(0xFFA2A2A2),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                _buildFeatureIcon('assets/images/I219_420_418_971.png'),
                const SizedBox(width: 12),
                _buildFeatureIcon('assets/images/I219_422_418_967.png'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Icon(Icons.star, color: Color(0xFFFBBE21), size: 20),
            const SizedBox(width: 4),
            RichText(
              text: TextSpan(
                style: GoogleFonts.sora(
                  fontSize: 16,
                  color: const Color(0xFF232323),
                ),
                children: [
                  const TextSpan(
                    text: '4.8 ',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: '(230)',
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      color: const Color(0xFFA2A2A2),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureIcon(String assetPath) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Image.asset(
        assetPath,
        width: 24,
        height: 24,
        color: const Color(0xFFC67C4E),
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF232323),
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: GoogleFonts.sora(
              fontSize: 14,
              color: const Color(0xFFA2A2A2),
              height: 1.5,
            ),
            children: [
              const TextSpan(
                text:
                    'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ',
              ),
              TextSpan(
                text: 'Read More',
                style: GoogleFonts.sora(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFC67C4E),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSizeSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Size',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF232323),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSizeChip('S'),
            _buildSizeChip('M'),
            _buildSizeChip('L'),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeChip(String size) {
    final bool isSelected = _selectedSize == size;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedSize = size;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFFFFF5EE) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? const Color(0xFFC67C4E)
                  : const Color(0xFFDEDEDE),
            ),
          ),
          child: Center(
            child: Text(
              size,
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? const Color(0xFFC67C4E)
                    : const Color(0xFF2F2D2C),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          24.0, 16.0, 24.0, MediaQuery.of(context).padding.bottom + 16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: GoogleFonts.sora(
                  fontSize: 14,
                  color: const Color(0xFF909090),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '\$ 4.53',
                style: GoogleFonts.sora(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFFC67C4E),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/high_fidelity_order');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC67C4E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 70, vertical: 16),
            ),
            child: Text(
              'Buy Now',
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}