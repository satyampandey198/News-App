import 'package:newsapp/model/category_model.dart';

List<CategoryModel> getcategories(){
  List<CategoryModel> category=[];
  CategoryModel categoryModel= CategoryModel();

  categoryModel.categoryName="Buisness";
  categoryModel.Image="images/buisess.jpg";
  category.add(categoryModel);
  categoryModel= CategoryModel();

   categoryModel.categoryName="Entertainment";
  categoryModel.Image="images/entertaiment.jpg";
  category.add(categoryModel);
  categoryModel= CategoryModel();

   categoryModel.categoryName="General";
  categoryModel.Image="images/general.jpg";
  category.add(categoryModel);
  categoryModel= CategoryModel();

   categoryModel.categoryName="Health";
  categoryModel.Image="images/health.jpg";
  category.add(categoryModel);
  categoryModel= CategoryModel();

   categoryModel.categoryName="Science";
  categoryModel.Image="images/science.jpg";
  category.add(categoryModel);
  categoryModel= CategoryModel();

   categoryModel.categoryName="Sports";
  categoryModel.Image="images/sports.jpg";
  category.add(categoryModel);
  categoryModel= CategoryModel();

  return category ;
}