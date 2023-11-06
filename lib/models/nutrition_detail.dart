class Nutrition {
  double? calories;
  double? protien;
  double? carbs;
  double? fat;
  String? imgUrl;
  Nutrition(this.calories, this.protien, this.carbs, this.fat, this.imgUrl);
}

class NutritionDetail {
  Map<String, Nutrition> details = {
    "biriyani": Nutrition(139, 15.9, 48.07, 9.82, "assets/food/biriyani.png"),
    "dosa": Nutrition(222, 2.7, 18.9, 5.2, "assets/food/dosa.png"),
    "bisibelebath":
        Nutrition(74.37, 10, 68, 12, "assets/food/bisibelebath.png"),
    "butternaan": Nutrition(336, 8.9, 50.1, 12.5, "assets/food/butternaan.png"),
    "chaat": Nutrition(144.4, 6.24, 53, 13, "assets/food/chaat.png"),
    "chappati": Nutrition(264, 9.61, 55.81, 1.5, "assets/food/chappati.png"),
    "dhokla": Nutrition(60, 13.4, 9.17, 1.54, "assets/food/dhokla.png"),
    "gulabjamun":
        Nutrition(323, 3.22, 17.67, 7.09, "assets/food/gulabjamun.png"),
    "halwa": Nutrition(352, 9, 78, 1, "assets/food/halwa.png"),
    "idly": Nutrition(191, 3.4, 28.6, 0.1, "assets/food/idly.png"),
    "kathiroll": Nutrition(305, 9.40, 43, 15, "assets/food/kathiroll.png"),
    "mendhuvada":
        Nutrition(309, 8.25, 25.3, 6.01, "assets/food/mendhuvada.png"),
    "noodles": Nutrition(137, 7.2, 25.01, 2.06, "assets/food/noodles.png"),
    "poori": Nutrition(296, 10, 62, 28, "assets/food/poori.png"),
    "samosa": Nutrition(308, 4.67, 32.21, 18, "assets/food/samosa.png"),
    "tandoorichicken":
        Nutrition(220, 31, 10.39, 3.6, "assets/food/tandoorichicken.png"),
    "upma": Nutrition(210, 8.11, 45.67, 3.78, "assets/food/upma.png"),
    "vadapav": Nutrition(230, 8.9, 27, 10.5, "assets/food/vadapav.png"),
    "venpongal": Nutrition(212, 5.5, 29, 14, "assets/food/venpongal.png")
  };
}
