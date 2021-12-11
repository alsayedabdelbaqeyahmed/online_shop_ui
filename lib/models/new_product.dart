import 'package:online_shop_ui/constants/constant_data.dart';

class NewProductModel {
  String newprodtitle;
  String newproddesc;
  String newprodprice;
  String newprodnumber;
  List newprodcategories;
  String newproductId;
  NewProductModel({
    this.newprodcategories,
    this.newproddesc,
    this.newprodnumber,
    this.newprodprice,
    this.newprodtitle,
    this.newproductId,
  });

  factory NewProductModel.fromJason(Map<String, dynamic> map) {
    return NewProductModel(
      newprodcategories: map[connewprodCateg],
      newprodnumber: map[connewprodNumber],
      newproddesc: map[connewprodDesc],
      newprodtitle: map[connewprodTitle],
      newprodprice: map[connewprodprice],
      newproductId: map[connewprodId],
    );
  }

  Map<String, dynamic> toJason() {
    return {
      connewprodNumber: newprodnumber,
      connewprodDesc: newproddesc,
      connewprodTitle: newprodtitle,
      connewprodprice: newprodprice,
      connewprodCateg: newprodcategories,
      connewprodId: newproductId,
    };
  }
}
