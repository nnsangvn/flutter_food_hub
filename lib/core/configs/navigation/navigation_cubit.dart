import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_hub/core/configs/navigation/tab_item.dart';

class NavigationCubit extends Cubit<TabItem> {
  NavigationCubit() : super(TabItem.home);

  void selectTab(TabItem tab) => emit(tab);
}
