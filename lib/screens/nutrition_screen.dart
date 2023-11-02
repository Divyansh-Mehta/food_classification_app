import "package:flutter/material.dart";
import "package:food_classification_app/models/nutrition_detail.dart";
import "package:google_fonts/google_fonts.dart";

// ignore: must_be_immutable
class NutritionScreen extends StatelessWidget {
  String prediction;
  // ignore: use_key_in_widget_constructors
  NutritionScreen(this.prediction);
  final nd = NutritionDetail();
  @override
  Widget build(BuildContext context) {
    Nutrition? nt = nd.details[prediction];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nutritions",
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(50, 75, 80, 1),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Expanded(child: Image.asset(nt!.imgUrl as String)),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // Divider(
          //   thickness: 2,
          // ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      prediction,
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      "Nutritions values",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "100g",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      "${nt.calories}Kcal",
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          nutritionIndecator("Protien", nt.protien as double,
              "assets/icons/protien.png", Colors.green),
          const SizedBox(
            height: 20,
          ),
          nutritionIndecator("Carbs", nt.carbs as double,
              "assets/icons/carbs.png", const Color.fromRGBO(108, 195, 226, 1)),
          const SizedBox(
            height: 20,
          ),
          nutritionIndecator("Fat", nt.fat as double, "assets/icons/fat.png",
              const Color.fromRGBO(162, 153, 221, 1)),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget nutritionIndecator(
      String nutritionName, double amount, String iconPath, Color col) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(12.0)),
          padding: EdgeInsets.all(8),
          child: ImageIcon(
            AssetImage(iconPath),
            color: col,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    nutritionName,
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Text(
                    amount.toString(),
                    style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              Row(children: [
                Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(128, 128, 128, 0.3),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      height: 7,
                      width: 270,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: col,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      height: 7,
                      width: 270 * (amount / 100),
                    ),
                  ],
                ),
              ]),
            ],
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
