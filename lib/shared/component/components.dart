//import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/shared/styles/colors.dart';
//import 'package:news_aap/modules/web_view/web_view_screen.dart';
//import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
//import 'package:test_app/shared/cubit/cubit.dart';

//******************BUTTON CUSTOM WIDGET************************

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  double radius = 5.0,
  bool isUpperCase = true,
  required VoidCallback function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: background,
      ),
    );

//***********************END******************************

//**************FORM FIELD CUSTOM WIDGET************************
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  required String? Function(String? value) validate,
  VoidCallback? onTap,
  Function? onSubmit,
  Function(String)? onChange,
  bool isPassword = false,
  IconData? suffix,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      validator: validate,
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted:(s) {
        onSubmit!(s);
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(suffix),
              )
            : null,
        border: OutlineInputBorder(),
      ),
    );

//***********************END********************************

//***********************Build TAsk Item*********************

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      onDismissed: (dirrection) {
        //AppCubit.get(context).DeleteData(id: model['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                // //AppCubit.get(context)
                //     .updateData(status: 'done', id: model['id']);
              },
              icon: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                //AppCubit.get(context)
                //  .updateData(status: 'archive', id: model['id']);
              },
              icon: const Icon(
                Icons.archive,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );

//***********************END********************************

// ********************************************

// Widget taskBuilder(
//     {
//       required List<Map> tasks,
//     }) =>
//     ConditionalBuilder(
//       condition: tasks.length > 0,
//       builder: (BuildContext context) => ListView.separated(
//         itemBuilder: (context, index) => buildTaskItem(tasks[index], context),
//         separatorBuilder: (context, index) => Container(
//           width: double.infinity,
//           height: 1.0,
//           color: Colors.grey,
//         ),
//         itemCount: tasks.length,
//       ),
//       fallback: (BuildContext context) => Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Icon(
//               Icons.menu,
//               size: 100.0,
//               color: Colors.grey,
//             ),
//             Text(
//               'No Tasks Yet ,Please Add Some Tasks',
//               style: TextStyle(
//                   fontSize: 16.0,
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold),
//             )
//           ],
//         ),
//       ),
//     );
// ***********************END********************************

// ********************* buildArticleItem***********************

// Widget buildArticleItem(article, context) => InkWell(
//   onTap: ()
//   {
//     navigateTo(context, WebViewScreen(article['url']));
//   },
//   child:   Padding(
//
//         padding: const EdgeInsets.all(20.0),
//
//         child: Row(
//
//           children: [
//
//             Container(
//
//               width: 120.0,
//
//               height: 120.0,
//
//               decoration: BoxDecoration(
//
//                 borderRadius: BorderRadius.circular(10.0),
//
//                 image: DecorationImage(
//
//                   image: NetworkImage('${article['urlToImage']}'),
//
//                   fit: BoxFit.cover,
//
//                 ),
//
//               ),
//
//             ),
//
//             const SizedBox(
//
//               width: 20.0,
//
//             ),
//
//             Expanded(
//
//               child: Container(
//
//                 height: 120.0,
//
//                 child: Column(
//
//                   mainAxisAlignment: MainAxisAlignment.start,
//
//                   crossAxisAlignment: CrossAxisAlignment.start,
//
//                   children: [
//
//                     Expanded(
//
//                       child: Text(
//
//                         '${article['title']}',
//
//                         style: Theme.of(context).textTheme.bodyText1,
//
//                         maxLines: 3,
//
//                         overflow: TextOverflow.ellipsis,
//
//                         textAlign: TextAlign.start,
//
//                         textDirection: TextDirection.rtl,
//
//                       ),
//
//                     ),
//
//                     Text(
//
//                       '${article['publishedAt']}',
//
//                       style: TextStyle(
//
//                         color: Colors.grey,
//
//                       ),
//
//                     ),
//
//                   ],
//
//                 ),
//
//               ),
//
//             ),
//
//           ],
//
//         ),
//
//       ),
// );

//************************end****************************

//***********************myDivider********************************

Widget myDivider() {
  return Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey,
  );
}

//***********************END********************************

//***********************articleBuilder********************************

// Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
//     condition: list.length > 0,
//     builder: (context) => ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: list.length),
//     fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()));

//***********************END********************************

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

//***********************END********************************

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

//***********************END********************************

Widget defaultTextButton(
{
  required VoidCallback function,
  required String text,
}) =>TextButton(
    onPressed: function,
    child: Text(text.toUpperCase()));

//==================================================================

void showToast ({
  required String text,
  required ToastStates state,
})=> Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: Colors.white,
    fontSize: 16.0
);

//enum
enum ToastStates{SUCCESS,ERORR,WARNING}

Color chooseToastColor(ToastStates state)
{
  Color color;

  switch(state)
  {
    case ToastStates.SUCCESS:
      color =Colors.green;
      break;
    case ToastStates.ERORR:
      color =Colors.red;
      break;
    case ToastStates.WARNING:
      color =Colors.amber;
      break;
  }
  return color;
}
//-----------------------------------------------------------------

Widget buildProductList( model,context,{bool isOldPrice=true})=> Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    height: 120.0,
    child: Row(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image(
              image: NetworkImage('${model.product!.image}'),
              width: 120.0,
              height: 120.0,
            ),
            if (model.product!.discount != 0 && isOldPrice)
              Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    'DISCOUNT',
                    style: TextStyle(fontSize: 8.0, color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model.product!.name}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.0,
                  height: 1.3,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '${model.product!.price.round()}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: defaultColor,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  if (model.product!.discount != 0 && isOldPrice)
                    Text(
                      '${model.product!.oldPrice.round()}',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  Spacer(),
                  IconButton(
                      onPressed: ()
                      {
                        ShopCubit.get(context).changeFavorites(model.product!.id!);
                      },
                      icon: CircleAvatar(
                        radius: 15.0,
                        backgroundColor: ShopCubit.get(context).favorites[model.product!.id]!
                            ? defaultColor : Colors.grey ,
                        child: Icon(
                          Icons.favorite_border,
                          size: 14.0,),
                      )
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);