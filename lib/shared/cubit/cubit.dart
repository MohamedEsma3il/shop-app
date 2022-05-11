import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/states.dart';

class ShopMainCubit extends Cubit<ShopMainStates> {
  ShopMainCubit() : super(ShopInitialState());

  static ShopMainCubit get(context) => BlocProvider.of(context);
}
