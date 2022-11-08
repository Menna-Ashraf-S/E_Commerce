import 'package:flutter/material.dart';
import 'package:flutter_pro/Model_products/products.dart';
import 'package:flutter_pro/network/api.getProducts.dart';


class Products extends StatefulWidget {
  const Products({ Key? key }) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
            title: Text('product',
            style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
            
            
            ) ,
            centerTitle: true,
            backgroundColor: Colors.grey,
          ),


            body: FutureBuilder<List<ProductsData>>(


              future:  Api_products().my_api() ,
              builder: (context,snapshot)
              
              {
               print(snapshot.data);



               if(!snapshot.hasData){
        return CircularProgressIndicator();}

        else{

       



          return GridView.builder(


            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            mainAxisSpacing: 5 ,
            crossAxisSpacing: 20
        
            
            
            ),
            itemCount:  snapshot.data!.length,
            
          
              itemBuilder: (context,index)
              {
                   ProductsData product = snapshot.data![index];

              return GestureDetector(

                       
                        child: Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                             
                             // mainAxisSize: MainAxisSize.min,
                              
                              
                              children: [
                               
                               
                                  
                                     Container(
                                     height: 90,
                                     width: 180,
                                   
                                    decoration: BoxDecoration(
                                       


                                       borderRadius: BorderRadius.circular(10),
                                      image:DecorationImage(
                                       fit: BoxFit.cover,
                                                          
                                       image:NetworkImage(product.image!))
                                               
                                                                 )
                                                                 ),
                                  
                               
                          
                               Padding(
                                 padding: const EdgeInsets.all(4.0),
                                 child: Text(product.title,
                                 style: TextStyle (
                                     
                                   
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.grey,
                                    
                          
                                 ),
                                 
                                 
                                 ),
                               ),
                               
                                        
                             Text('${product.price}',
                                 style: TextStyle (
                                     
                                   
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black
                                    
                          
                                 ),
                                 
                                 
                                 ),
                                        
                                        
                                        
                                        
                                        
                                        
                              ]),
                          ),
                        ),
                      
                    

                              
                 onTap: ()  async{
                  

                 
                  
                    
                  
                  setState(() {
                    
                  });
                 },

                );


                

                 




                
              }
       
        
        
        );
               
              }
              }
            
              
              
              
              
               ),
              
      
    );
  }
}


    
                 