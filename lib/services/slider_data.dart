import 'package:newsapp/model/slider_model.dart';

List <SliderModel> getSliders(){
  List<SliderModel>Slider=[];
  SliderModel CategoryModel = SliderModel();
  CategoryModel.image="images/buisess.jpg";
  CategoryModel.name="Click on above Category Bar to Veiw News";
  Slider.add(CategoryModel);
  CategoryModel=SliderModel();

  CategoryModel.image="images/entertaiment.jpg";
  CategoryModel.name="Click on above Category Bar to Veiw News";
  Slider.add(CategoryModel);
  CategoryModel=SliderModel();

 CategoryModel.image="images/general.jpg";
  CategoryModel.name="Click on above Category Bar to Veiw News";
  Slider.add(CategoryModel);
  CategoryModel=SliderModel();

  CategoryModel.image="images/health.jpg";
  CategoryModel.name="Click on above Category Bar to Veiw News";
  Slider.add(CategoryModel);
  CategoryModel=SliderModel();

  CategoryModel.image="images/science.jpg";
  CategoryModel.name="Click on above Category Bar to Veiw News";
  Slider.add(CategoryModel);
  CategoryModel=SliderModel();

  CategoryModel.image="images/sports.jpg";
  CategoryModel.name="Click on above Category Bar to Veiw News";
  Slider.add(CategoryModel);
  CategoryModel=SliderModel(); 
  return Slider;

}