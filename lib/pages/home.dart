



import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/artical_model.dart';
import 'package:newsapp/model/category_model.dart';
import 'package:newsapp/model/slider_model.dart';
import 'package:newsapp/pages/article_veiw.dart';
import 'package:newsapp/pages/category_news.dart';
import 'package:newsapp/services/data.dart';
import 'package:newsapp/services/news.dart';
import 'package:newsapp/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
   List<SliderModel> slider = [];
   List<ArticleModel> Articles = [];
   bool _loading = true;
   
   int activeIndex=0;
  @override
  void initState() {
    categories = getcategories();
   slider= getSliders();
    getNews();
    super.initState();
  }

  getNews()async{
    News newsclass=News();
    await newsclass.getNews();
    Articles=newsclass.news;
    setState(() {
      _loading=false;
    });
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("SATYAM ",
            style: TextStyle(color: Color.fromARGB(255, 11, 11, 11), fontWeight: FontWeight.bold)),
            Text(
              "NEWS",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:_loading? const Center(child: CircularProgressIndicator()) :SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                height: 70,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        image: categories[index].Image,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),
              const SizedBox(height: 30.0,),
              const Padding(
                padding: EdgeInsets.only(left:10.0,right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Breaking News!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.0),),
                     Text("Veiw All",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500,fontSize: 16.0),),
                  ],
                ),
              ),
              const SizedBox(height: 20.0,),
              CarouselSlider.builder(itemCount: slider.length,
               itemBuilder: (context, index, realIndex) {
    String? res = slider[index].image;
    String? res1 = slider[index].name;

    // Check if res or res1 is null
    

    // If both are not null, proceed to build the image
    return buildImage(res!, index, res1!);
  },
               options: CarouselOptions(
                height: 250,
               enlargeCenterPage: true,
               autoPlayInterval: const Duration(seconds: 4),
              autoPlay: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              onPageChanged: (index,reason) {
                setState(() {
                  activeIndex=index;
                });
        
              })),
              const SizedBox(height: 30.0,),
              Center(child: buildIndicator()),
              const SizedBox(height: 30.0,),
              const Padding(
                padding: EdgeInsets.only(left:10.0,right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Trending News!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16.0),),
                     Text("Veiw All",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500,fontSize: 16.0),),
                  ],
                ),
              ),
              // first containers
 
    
             const SizedBox(
              height: 10.0,
             ),
             Container(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: Articles.length,
                itemBuilder: (context,index){
                return BlogTile
                (url: Articles[index].url!,
                  desc: Articles[index].description!, imageUrl: Articles[index].urlToImage!, title: Articles[index].title!);
              }),
             )
             //second containers sizebox se leke padding tak ek contaier h
       
             //third containers
      
             
        
          ],
          ),
        ),
      ),
    );
  }
   Widget buildImage(String image,int index,String name)=>Container(
   margin: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Stack(
      children: [
  ClipRRect(
        borderRadius:BorderRadius.circular(10) ,
        child: Image.asset(
          image,
          height: 250, 
          fit: BoxFit.cover,
           width: MediaQuery.of(context).size.width, 
           ),
      ),
      Container(
        height: 250,
        padding: const EdgeInsets.only(left: 10.0),
        margin: const EdgeInsets.only(top: 120.0),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
        child: Text(maxLines: 2,
          name,style: const TextStyle(color:Colors.white, 
        fontSize: 18.0,fontWeight:FontWeight.bold),
      ),
    
  )
  ])
  );

 Widget buildIndicator() => AnimatedSmoothIndicator(activeIndex: activeIndex, count:slider.length,
 effect: const SlideEffect(dotWidth: 08,dotColor: Colors.black , dotHeight: 08),
  );
}


class CategoryTile extends StatelessWidget {
  final image,categoryName;
   const CategoryTile({super.key,this.image,this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (context)=>CategoryNews(name: categoryName)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child:Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.asset(image,
              height: 60, fit :BoxFit.cover,  width: 120,),
            ),
            Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
              color: Colors.black38),
               
              child: Center(child: Text(categoryName,style: const TextStyle(color:Colors.white,fontSize: 16, fontWeight: FontWeight.bold),))
            )
          ],
        )
      ),
    );
  }
  
}
// BlogTile
class BlogTile extends StatelessWidget {
 String imageUrl, title, desc,url;
 BlogTile({super.key, required this.desc,required this.imageUrl,required this.title,required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>ArticleVeiw(blogUrl: url)));
      
        },
        
        
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10.0),
                    child: Material(
                      elevation: 3.0, 
                      borderRadius: BorderRadius.circular(10),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
                        child: Row(
                          crossAxisAlignment:CrossAxisAlignment.start ,
                          children: [
                          Container(
                           child:  ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: CachedNetworkImage(  
                            imageUrl:imageUrl,
                            height: 100,  //ye string nhi hoga maybe
                            width: 100,
                            fit: BoxFit.cover,
                            ))),
                            const SizedBox(width: 10.0,),
                            Expanded(
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/1.45,
                                    child:  Text(
                                    title,
                                    maxLines: 2,
                                      style:  const TextStyle(color: Colors.black,fontWeight: FontWeight.w500,
                                      fontSize: 17.0),
                                      )
                                      ),
                                                  
                                       const SizedBox(height: 5.0,),
                                       SizedBox(
                                    width: MediaQuery.of(context).size.width/1.45,
                                    child: Text(
                                     desc,
                                     maxLines: 3,
                                      style:  const TextStyle(color: Colors.black38,fontWeight: FontWeight.w500,
                                      fontSize: 17.0),
                                      )
                                      ),
                                ],
                              ),
                            ),
                          
                                 ],
                               ),
                      ),
          
              ),
             
            ),
        )
          
      
        ),
    );
      
   
  }
}
