import 'package:get/get.dart';
import 'package:kolica/ui/MainPage.dart';
import 'package:kolica/ui/auth/Authentication.dart';
import 'package:kolica/ui/auth/ForgotPassword.dart';
import 'package:kolica/ui/LocationPermission.dart';
import 'package:kolica/ui/SearchLocation.dart';
import 'package:kolica/ui/auth/TakePhoneNumber.dart';
import 'package:kolica/ui/onBoarding/OnBoarding.dart';
import 'package:kolica/ui/checkout/checkout_screen.dart';
import 'package:kolica/ui/checkout/cart_summary/cart_summary_screen.dart';
import 'package:kolica/ui/cart/cart_screen.dart';
import 'package:kolica/ui/splash/splash_screen.dart';
import 'package:kolica/ui/notification/notification_screen.dart';
import 'package:kolica/ui/profile/profile_screen.dart';
import 'package:kolica/ui/profile/recipients_details/recipients_details_screen.dart';
import 'package:kolica/ui/profile/recipients_details_edit/recipients_details_screen_edit.dart';
import 'package:kolica/ui/voucher/voucher_screen.dart';
import 'package:kolica/ui/profile/my_voucher/my_voucher_screen.dart';
import 'package:kolica/ui/profile/my_voucher_all/my_voucher_all_screen.dart';
import 'package:kolica/ui/profile/followed_shop/followed_shop_screen.dart';
import 'package:kolica/ui/profile/change_password/change_password_screen.dart';
import 'package:kolica/ui/settings/settings_screen.dart';
import 'package:kolica/ui/order/order_track/order_track_screen.dart';
import 'package:kolica/ui/order/order_history/order_history_screen.dart';
import 'package:kolica/ui/order/track_your_location/track_your_location_screen.dart';
import 'package:kolica/ui/search/search_screen.dart';
import 'package:kolica/ui/category/category_screen.dart';
import 'package:kolica/ui/favorite_items/favorite_items_screen.dart';
import 'package:kolica/ui/message/message_screen.dart';
import 'package:kolica/ui/message_2/message_screen2.dart';
import 'package:kolica/ui/RootPage.dart';
import 'package:kolica/ui/category/trendings_item/trending_items_screen.dart';
import 'package:kolica/ui/category/recommemded_Items/recommended_items_screen.dart';
import 'package:kolica/ui/category/Items_details/item_details_screen.dart';
import 'package:kolica/ui/category/shop_details/shop_details_screen.dart';
import 'package:kolica/ui/category/todays_deal/todays_deal_screen.dart';
import 'package:kolica/ui/category/todays_deal_details/todays_deal_details_screen.dart';
import 'package:kolica/ui/category/trending_shop/trending_shop_screen.dart';
import 'package:kolica/ui/category/all_shop/all_shop_screen.dart';
import 'package:kolica/ui/category/favorite_items_with_header/favorite_items_with_header_screen.dart';
import 'package:kolica/ui/filter/filter_screen.dart';
import 'package:kolica/ui/add_location/add_location_screen.dart';
import 'package:kolica/ui/help_center/help_center_screen.dart';
import 'package:kolica/ui/terms_and_condition/terms_and_condition_screen.dart';
import 'package:kolica/ui/checkout/add_new_card/add_new_card_screen.dart';

const String Main = "Home";
const String MAIN_PAGE = "Main Page";
const String ON_BOARDING = "OnBoarding";
const String LOCATION_PERMISSION = "Location Permission";
const String SPLASH_SCREEN = "splash_screen";
const String SEARCH_LOCATION = "Search Location";
const String TAKE_PHONE_NUMBER = "Take phone number";
const String AUTHENTICATION = "Authentication";
const String FORGOT_PASSWORD = "Forgot Password";
const String CHECKOUT_SCREEN = "Checkout Screen";
const String CART_SCREEN = "Cart Screen";
const String CART_SUMMARY_SCREEN = "Cart Summary Screen";
const String NOTIFICATION_SCREEN = "Notification Screen";
const String PROFILE_SCREEN = "Profile Screen";
const String RECIPIENTS_DETAILS_SCREEN = "Recipients Details Screen";
const String RECIPIENTS_DETAILS_SCREEN_EDIT = "Recipients Details Screen Edit";
const String VOUCHER_SCREEN = "Voucher Screen";
const String MY_VOUCHER_SCREEN = "My Voucher Screen";
const String MY_VOUCHER_ALL_SCREEN = "My Voucher All Screen";
const String FOLLOWED_SHOP_SCREEN = "Followed Shop Screen";
const String CHANGE_PASSWORD_SCREEN = "Change Password Screen";
const String SETTINGS_SCREEN = "Settings Screen";
const String ORDER_TRACK_SCREEN = "Order Track Screen";
const String ORDER_HISTORY_SCREEN = "Order History Screen";
const String TRACK_YOUR_LOCATION_SCREEN = "Track Your Location Screen";
const String SEARCH_SCREEN = "Search Screen";
const String CATEGORY_SCREEN = "Category Screen";
const String FAVORITE_SCREEN = "Favorite Screen";
const String MESSAGE_SCREEN = "Message Screen";
const String MESSAGE_SCREEN_2 = "Message Screen 2";
const String ROOT_PAGE = "Root Page";
const String TRENDING_ITEM_SCREEN = "Trending Items Screen";
const String RECOMMENDED_ITEM_SCREEN = "Recommended Items Screen";
const String ITEM_DETAILS_SCREEN = "Item Details Screen";
const String SHOP_DETAILS_SCREEN = "Shop Details Screen";
const String TODAYS_DEAL_SCREEN = "Todays Deal Screen";
const String TODAYS_DEAL_DETAILS_SCREEN = "Todays Deal Details Screen";
const String TRENDING_SHOP_SCREEN = "Trending Shop Screen";
const String ALL_SHOP_SCREEN = "All Shop Screen";
const String FAVORITE_ITEM_WITH_HEADER_SCREEN = "Favorite Items With Header Screen";
const String FILTER_SCREEN = "Filter Screen";
const String ADD_LOCATION_SCREEN = "Add Location Screen";
const String HELP_CENTER_SCREEN = "Help Center Screen";
const String TERMS_AND_CONDITION_SCREEN = "Terms and Condition Screen";
const String ADD_NEW_CARD_SCREEN = "Add New Card Screen";

List<GetPage> appRoutes() => [
      GetPage(name: MAIN_PAGE, page: () => MainPage()),
      GetPage(name: SPLASH_SCREEN, page: () => SplashScreen()),
      GetPage(name: ON_BOARDING, page: () => OnBoarding()),
      GetPage(name: LOCATION_PERMISSION, page: () => LocationPermission()),
      GetPage(name: SEARCH_LOCATION, page: () => SearchLocation()),
      GetPage(name: TAKE_PHONE_NUMBER, page: () => TakePhoneNumber()),
      GetPage(name: AUTHENTICATION, page: () => Authentication()),
      GetPage(name: FORGOT_PASSWORD, page: () => ForgotPassword()),
      GetPage(name: CHECKOUT_SCREEN, page: () => CheckoutScreen()),
      GetPage(name: CART_SCREEN, page: () => CartScreen()),
      GetPage(name: CART_SUMMARY_SCREEN, page: () => CartSummaryScreen()),
      GetPage(name: NOTIFICATION_SCREEN, page: () => NotificationScreen()),
      GetPage(name: PROFILE_SCREEN, page: () => ProfileScreen()),
      GetPage(
          name: RECIPIENTS_DETAILS_SCREEN,
          page: () => RecipientsDetailsScreen()),
      GetPage(
          name: RECIPIENTS_DETAILS_SCREEN_EDIT,
          page: () => RecipientsDetailsScreenEdit()),
      GetPage(name: VOUCHER_SCREEN, page: () => VoucherScreen()),
      GetPage(name: MY_VOUCHER_SCREEN, page: () => MyVoucherScreen()),
      GetPage(name: MY_VOUCHER_ALL_SCREEN, page: () => MyVoucherAllScreen()),
      GetPage(name: FOLLOWED_SHOP_SCREEN, page: () => FollowedShopScreen()),
      GetPage(name: CHANGE_PASSWORD_SCREEN, page: () => ChangePasswordScreen()),
      GetPage(name: SETTINGS_SCREEN, page: () => SettingsScreen()),
      GetPage(name: ORDER_TRACK_SCREEN, page: () => OrderTrackScreen()),
      GetPage(name: ORDER_HISTORY_SCREEN, page: () => OrderHistoryScreen()),
      GetPage(
          name: TRACK_YOUR_LOCATION_SCREEN,
          page: () => TrackYourLocationScreen()),
      GetPage(name: SEARCH_SCREEN, page: () => SearchScreen()),
      GetPage(name: CATEGORY_SCREEN, page: () => CategoryScreen()),
      GetPage(name: FAVORITE_SCREEN, page: () => FavoriteItemsScreen()),
      GetPage(name: MESSAGE_SCREEN, page: () => MessageScreen()),
      GetPage(name: MESSAGE_SCREEN_2, page: () => MessageScreen2()),
      GetPage(name: ROOT_PAGE, page: () => RootPage()),
      GetPage(name: TRENDING_ITEM_SCREEN, page: () => TrendingItemsScreen()),
      GetPage(
          name: RECOMMENDED_ITEM_SCREEN, page: () => RecommendedItemsScreen()),
      GetPage(name: ITEM_DETAILS_SCREEN, page: () => ItemDetailsScreen()),
      GetPage(name: SHOP_DETAILS_SCREEN, page: () => ShopDetailsScreen()),
      GetPage(
          name: TODAYS_DEAL_DETAILS_SCREEN,
          page: () => TodaysDealDetailsScreen()),
      GetPage(name: TODAYS_DEAL_SCREEN, page: () => TodaysDealScreen()),
      GetPage(name: TRENDING_SHOP_SCREEN, page: () => TrendingShopScreen()),
      GetPage(name: ALL_SHOP_SCREEN, page: () => AllShopScreen()),
      GetPage(
          name: FAVORITE_ITEM_WITH_HEADER_SCREEN,
          page: () => FavoriteItemsWithHeaderScreen()),
      GetPage(name: FILTER_SCREEN, page: () => FilterScreen()),
      GetPage(name: ADD_LOCATION_SCREEN, page: () => AddLocationScreen()),
      GetPage(name: HELP_CENTER_SCREEN, page: () => HelpCenterScreen()),
      GetPage(
          name: TERMS_AND_CONDITION_SCREEN,
          page: () => TermsAndConditionScreen()),
      GetPage(name: ADD_NEW_CARD_SCREEN, page: () => AddNewCardScreen()),
    ];
