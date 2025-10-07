import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HighFidelityOrderScreen extends StatelessWidget {
  const HighFidelityOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFAFAFA),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Color(0xFF2F2D2C)),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Order',
          style: GoogleFonts.sora(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2F2D2C),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              _buildOrderTypeSelector(),
              const SizedBox(height: 24),
              _buildDeliveryAddress(),
              const SizedBox(height: 20),
              const Divider(color: Color(0xFFEAEAEA), thickness: 1),
              const SizedBox(height: 20),
              _buildCheckoutItem(),
              const SizedBox(height: 20),
              Container(
                height: 4,
                color: const Color(0xFFF9F2ED),
              ),
              const SizedBox(height: 20),
              _buildDiscountSection(),
              const SizedBox(height: 20),
              _buildPaymentSummary(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          _buildBottomBar(context, () => context.go('/high_fidelity_home')),
    );
  }

  Widget _buildOrderTypeSelector() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEDEDED),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFFC67C4E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Deliver',
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Pick Up',
                    style: GoogleFonts.sora(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF232323),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Delivery Address',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF232323),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Jl. Kpg Sutoyo',
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF303030),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: GoogleFonts.sora(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFA2A2A2),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildActionButton(
                icon: Icons.edit_outlined, label: 'Edit Address'),
            const SizedBox(width: 8),
            _buildActionButton(
                icon: Icons.description_outlined, label: 'Add Note'),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({required IconData icon, required String label}) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 14, color: const Color(0xFF303030)),
      label: Text(
        label,
        style: GoogleFonts.sora(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF303030),
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        side: const BorderSide(color: Color(0xFFA2A2A2)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  Widget _buildCheckoutItem() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/I219_333_417_715.png',
            width: 54,
            height: 54,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Caffe Mocha',
              style: GoogleFonts.sora(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF232323),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Deep Foam',
              style: GoogleFonts.sora(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFA2A2A2),
              ),
            ),
          ],
        ),
        const Spacer(),
        _buildQuantitySelector(),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        _buildQuantityButton(icon: Icons.remove, onPressed: () {}),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            '1',
            style: GoogleFonts.sora(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF2A2A2A),
            ),
          ),
        ),
        _buildQuantityButton(icon: Icons.add, onPressed: () {}),
      ],
    );
  }

  Widget _buildQuantityButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFF9F2ED)),
        ),
        child: Icon(icon, size: 16, color: const Color(0xFF2A2A2A)),
      ),
    );
  }

  Widget _buildDiscountSection() {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFEDEDED)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            const Icon(Icons.discount_outlined, color: Color(0xFFC67C4E)),
            const SizedBox(width: 16),
            Text(
              '1 Discount is Applied',
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF303030),
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: Color(0xFF2A2A2A)),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentSummary() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Summary',
          style: GoogleFonts.sora(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF232323),
          ),
        ),
        const SizedBox(height: 16),
        _buildSummaryRow('Price', '\$ 4.53'),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Delivery Fee',
              style: GoogleFonts.sora(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF303030),
              ),
            ),
            Row(
              children: [
                Text(
                  '\$ 2.0',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF2A2A2A),
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '\$ 1.0',
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF232323),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildSummaryRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF303030),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.sora(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF232323),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context, VoidCallback onOrderPressed) {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 16, 24,
          MediaQuery.of(context).padding.bottom > 0 ? 34 : 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, -4),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.account_balance_wallet_outlined,
                  color: Color(0xFFC67C4E)),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cash/Wallet',
                    style: GoogleFonts.sora(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF232323),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$ 5.53',
                    style: GoogleFonts.sora(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFC67C4E),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF2A2A2A)),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onOrderPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFC67C4E),
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Order',
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}