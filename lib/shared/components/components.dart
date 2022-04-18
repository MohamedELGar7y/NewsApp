import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  required Function function,
  required String text,
  bool isUpperCase = true,
  double radius = 0.0,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        onPressed: ()
        {
          function;
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

Widget defaultFormFailed({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  Function? onSubmit,
  Function? onChanged,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function? suffixPressed,
  Function? onTap,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      enabled: isClickable,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s){
        onSubmit;
      },
      onChanged: (s){
        onChanged!(s);
        },
      validator: (s){
        validate();
      },
      onTap: ()
      {
        onTap;
      },
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: (){
            suffixPressed;
          },
          icon: Icon(
            suffix,
          ),
        ),
      ),
    );


Widget buildArticleItem(article,context)=> InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']),);
  },
  child: Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

          width: 120.0,

          height: 120.0,

          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10.0,),

            image: DecorationImage(

              image: NetworkImage(

                '${article['urlToImage']}',

              ),

              fit: BoxFit.cover,

            ),

          ),

        ),

        const SizedBox(

          width: 20.0,

        ),

        Expanded(

          child: SizedBox(

            height: 120.0,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                Expanded(

                  child: Text(

                    '${article['title']}',

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                Text(

                  '${article['publishedAt']}',

                  style: const TextStyle(

                    color: Colors.grey,

                  ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);

Widget articleBuilder(list,context,{isSearch = false})=>ConditionalBuilder(
  condition: list.length > 0,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildArticleItem(list[index],context),
    separatorBuilder: (context, index) => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
    itemCount: list.length,
  ),
  fallback: (context) => isSearch ?Container() : const Center(child: CircularProgressIndicator()),
);


void navigateTo(context,widget)=>Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=>widget,
    ),
);


