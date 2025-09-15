import 'package:boycott_app/modules/home/model/models.dart';

final List<Product> localProducts = [
  Product(
    id: "0014e073-f070-46f6-a332-26428f937044",
    name: "Milo (drink)",
    description:
        "is a chocolate-flavoured malted powder product produced by Nestlé...",
    type: "supports-israel",
    website: "https://milo.com.au/",
    logo: Logo(
      type: "image/svg+xml",
      url:
          "https://api.boycottisraeli.biz/logos/b8c27f88-6568-41d2-8123-ccf7fc283d62",
    ),
    categories: [
      Category(
        id: "8d05a1fd-06fb-4b1b-a70f-e4e88427143a",
        name: "Food & Beverage",
        slug: "food-and-beverage",
      ),
    ],
    alternatives: [
      Alternative(
        id: "6919667f-b289-448d-a34f-e3f0531cc06f",
        name: "Horlicks",
        description: "Horlicks is a sweet malted milk hot drink powder...",
        website: "https://www.horlicks.in/",
        logo: Logo(
          type: "image/png",
          url:
              "https://api.boycottisraeli.biz/logos/6fce550c-6781-4abb-87a5-000e70f04543",
        ),
      ),
    ],
  ),
];
