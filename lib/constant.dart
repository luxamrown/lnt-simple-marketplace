enum CategoryProduct {
  food,
  fashion,
  electronics,
  furniture,
  sports,
}

List<Map<String, String>> MasterCategories = [{
  "label": "Food",
  "code": "food"
},{
  "label": "Fashion",
  "code": "fashion"
},{
  "label": "Electronics",
  "code": "electronics"
},{
  "label": "Furniture",
  "code": "furniture"
},{
  "label": "Sports",
  "code": "sports"
}];

final String FIELD_NAME = 'name';
final String FIELD_DESC = 'desc';
final String FIELD_QUANTITY = 'quantity';
final String FIELD_PRICE = 'price';
final String FIELD_CATEGORY = 'category';