// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, avoid_print, sized_box_for_whitespace, non_constant_identifier_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Models/CoffePack_data_models.dart';
import 'Alert_views.dart';

List<Packmodel> coffeeAsPackModels = pack.map((coffeeModel) {
  return Packmodel(
    name: coffeeModel.name,
    image: coffeeModel.image,
    type: coffeeModel.type,
    price: coffeeModel.price,
    info: coffeeModel.info,
    origin: coffeeModel.origin,
    taste: coffeeModel.taste,
  );
}).toList();

class CoffeePage extends StatelessWidget {
  final List<Packmodel> pack;

  CoffeePage({required this.pack});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          pack.length,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _coffe_pack(pack[index], context),
          ),
        ),
      ),
    );
  }

  Container _coffe_pack(Packmodel modelpack, BuildContext context) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 201, 201, 201).withOpacity(.12),
            blurRadius: 30,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              '${modelpack.image}',
              width: 170,
              height: 170,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            modelpack.name,
            style: GoogleFonts.tiltNeon(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Color(0xFF372E1D),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          RichText(
            text: TextSpan(
              text: "${modelpack.type.join(', ')}",
              style: GoogleFonts.tiltNeon(fontSize: 14, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  "${modelpack.price}",
                  style: GoogleFonts.tiltNeon(
                    color: Color(0xFF372E1D),
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _showCustomModalBottomSheet(context, modelpack);
                },
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showCustomModalBottomSheet(BuildContext context, Packmodel modelpack) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            width: 400,
            height: 700,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(14),
                topRight: const Radius.circular(14),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.asset(
                    '${modelpack.image}',
                    width: 350,
                    height: 350,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              Text(
            modelpack.name,
            style: GoogleFonts.tiltNeon(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF372E1D),
            )),
            const SizedBox(
                  height: 10,
                ),
              Text(
            modelpack.origin,
            style: GoogleFonts.tiltNeon(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF372E1D),
            )),const SizedBox(
                  height: 20,
                ),
         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              modelpack.taste,
              style: GoogleFonts.tiltNeon(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF372E1D),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              modelpack.info,
              style: GoogleFonts.tiltNeon(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF372E1D),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
           Container(
  width: double.infinity,
  height: 45,
  child: MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
  CustomAlertDialog.show(context, () {
    // Fungsi yang ingin dijalankan setelah pop-up ditutup
    print('Pop-up Alert ditutup!');});
    },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF372E1D),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Grab This",
            style: TextStyle(
              color: Color(0xffffffff),
            ),
          ),
        ),
      ),
    ),
  ),
),
          ],
        ),
              ],
            ),
          ),
        );
      },
    );
  }
}
