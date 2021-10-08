import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:bumaco_aios/ui/bindings/bindings.dart';
import 'package:bumaco_aios/ui/bindings/category_binding.dart';
import 'package:bumaco_aios/ui/login/temp_view.dart';
import 'package:bumaco_aios/ui/news/news_headline.dart';
import 'package:bumaco_aios/ui/news/news_detail.dart';
import 'package:bumaco_aios/ui/rating/rating_view.dart';
import 'package:bumaco_aios/ui/shopping/all_product_view.dart';
import 'package:bumaco_aios/ui/shopping/staggered_img_view.dart';
import 'package:bumaco_aios/ui/views/home/c_product_view.dart';
import 'package:bumaco_aios/ui/views/views.dart';
import 'package:get/get.dart';

const kTransitionDuration = Duration(milliseconds: 500);
List<GetPage<dynamic>> get setRoute => [
      GetPage(
        name: initialRoute,
        page: () => SplashView(),
        transition: Transition.fade,
        transitionDuration: kTransitionDuration,
        bindings: [],
      ),
      GetPage(
          name: onboardRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => OnboardingView()),
      GetPage(
          name: landingRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => LandingView()),
      GetPage(
          name: loginRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => LoginView()),
      GetPage(
          name: authRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => AuthView()),
      GetPage(
          name: profileRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => ProfileUI2()),
      GetPage(
          name: otpRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => OTPView()),
      GetPage(
          name: shoppingRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => ShoppingPage()),
      GetPage(
          name: staggerdImgRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => StaggeredImg()),
      GetPage(
          name: productsRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => CProductView()),
      GetPage(
          name: allProductsRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => AllProducts()),
      GetPage(
          name: catalogRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => CatalogView()),
      GetPage(
          name: productDetailRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => ProductDetailView()),
      GetPage(
          name: wishlistRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => WishlistView()),
      GetPage(
          name: offerRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => OfferView()),
      GetPage(
          name: ratingRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => RatingView(title: 'Rating')),
      GetPage(
          name: shrinkRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => ShrinkTopListView()),
      GetPage(
          name: newsRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => NewsHeadline()),
      GetPage(
          name: newsDetailRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => NewsDetail()),
      GetPage(
          name: settingRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => SettingView()),
      GetPage(
          name: expansionRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => ExpansionView()),
      GetPage(
          name: googleSigninDemoRoute,
          transition: Transition.fade,
          transitionDuration: kTransitionDuration,
          page: () => SignInDemo()),
      GetPage(
        name: dashboardRoute,
        transition: Transition.fade,
        transitionDuration: kTransitionDuration,
        page: () => DashboardView(),
        binding: DashboardBinding(),
      ),
      GetPage(
        name: categoryRoute,
        transition: Transition.fade,
        transitionDuration: kTransitionDuration,
        page: () => CategoryView(),
        binding: CategoryBinding(),
      ),
      GetPage(
        name: childCategoryRoute,
        transition: Transition.fade,
        transitionDuration: kTransitionDuration,
        page: () => ChildCategoryView(),
        binding: CategoryBinding(),
      ),
      GetPage(
        name: subCategoryRoute,
        transition: Transition.fade,
        transitionDuration: kTransitionDuration,
        page: () => SubCategoryView(),
        binding: CategoryBinding(),
      ),
    ];
