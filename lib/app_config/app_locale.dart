import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

class BumacoLocale extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // --core--
          'app_name': appNameEN,
          'app_title': appTitleEN,
          'alert': 'Alert',
          'error': 'Error',
          'ok': 'OK',
          'or': 'or',
          'yes': 'Yes',
          'no': 'No',
          // --Splash/Onboard--
          'hello': 'Hello',
          'wecome_message': 'Welcome to ' + appNameEN,
          'skip_and_continue': 'Skip for now',
          'signin_with_email_or_mobile': 'Continue with Email or mobile',
          'signin_with_google': 'Continue with Google',
          'signin_with_facebook': 'Continue with Facebook',
          // --Login/OTP--
          'loading_please_wait': 'Loading, Please wait',
          'otp': 'OTP',
          'seconds': 'Seconds',
          'please_wait_for': 'Please wait for',
          'resend_otp': 'Resend OTP',
          'in': 'in',
          'login': 'Login',
          'register': 'Register',
          'mobile_no': 'Mobile Number',
          'submit': 'Submit',
          'proceed': 'Proceed',
          // --Home/Shopping/Dashboard--
          'home': 'Home',
          'category': 'Category',
          'product': 'Product',
          'account': 'Account',
          // --Cart/Checkout/Payment--
          'address': 'Address',
          'total': 'Total',
          'tax': 'Tax',
          'discount': 'Discount',
          'shipping': 'Shipping',
          'payable': 'Payable',
          'continue': 'Continue',
          'cart': 'Cart',
          'quantity_updated': 'quantity updated',
          'allowed_max_5_qua': 'Allowed max 5 quantity',
          'checkout': 'Checkout',
          '': '',
          '': '',
          // --History/Orders--
          // --Countries--
          'choose_country': 'Choose Country',
          'egypt': 'EGYPT',
          'ksa': 'KSA',
          'quatar': 'QUATAR',
          'uae': 'UAE',
          'bahrain': 'BAHRAIN',
          'oman': 'OMAN',
          'kuwait': 'KUWAIT',
          'germany': 'GERMANY',
          'france': 'FRANCE',
          // --Home View--
          'search': 'Search',
          'share': 'Share',
          'wishlist': 'Wish list',
          'view_cart_item': 'View Cart Item',
          'loading_data': 'Loading data...',
          'new_arrival_products': 'New arrival products',
          'trending_products': 'Trending Products',
          'best_sellers': 'Best Sellers',
          'popular_products': 'Popular Products',

          'new_category': 'New Category',
          'category_based_on_profile': 'Category based on your profile',
          'add_to_cart': 'Add to Cart',
          'added_to': 'Added to ',
          'removed_from': 'Removed From ',
          'already': 'Already',
          'list_item': 'List Item',
          'grid_item': 'Grid Item',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          // --Category View--
          // --Product View--
          // --Account View--
          'notification': 'Notification',
          'profile': 'Profile',
          'order': 'Order',
          'shipping_address': 'Shipping Address',
          'blog': 'Blog',
          'offer': 'Offer',
          'faq': 'FAQ',
          'logout': 'Logout',
          'version': 'version',
          'loggedin_via': 'Logged in via',
          '': '',
        },
        'ar_AE': {
          // --core--
          'app_name': appNameAE,
          'app_title': appTitleAE,
          'alert': 'إنذار',
          'error': 'خطأ',
          'ok': 'نعم',
          'or': 'أو',
          'yes': 'نعم',
          'no': 'لا',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          // --Splash/Onboard--
          'hello': 'أهلا',
          'wecome_message': 'مرحبا بكم في ' + appNameAE,
          'skip_and_continue': 'تخطي والمتابعة',
          'signin_with_email_or_mobile':
              'تابع مع البريد الإلكتروني أو الهاتف المحمول',
          'signin_with_google': 'الدخول مع جوجل',
          'signin_with_facebook': 'تسجيل الدخول باستخدام الفيسبوك',
          // --Login/OTP--
          'loading_please_wait': 'جاري التحميل انتظر من فضلك',
          'otp': 'دبوس مرة واحدة',
          'seconds': 'ثواني',
          'please_wait_for': 'من فضلك انتظر',
          'resend_otp': 'أعد إرسال كلمة المرور لمرة واحدة بتنسيق',
          'in': 'في',
          'login': 'تسجيل الدخول',
          'register': 'تسجيل',
          'mobile_no': 'رقم الهاتف المحمول',
          'submit': 'يقدم',
          'proceed': 'تقدم',
          // --Home/Shopping/Dashboard--
          'home': 'الصفحة الرئيسية',
          'category': 'فئة',
          'product': 'المنتج',
          'account': 'حساب',
          // --Cart/Checkout/Payment--
          'address': 'عنوان',
          'total': 'المجموع',
          'tax': 'ضريبة',
          'discount': 'خصم',
          'shipping': 'شحن',
          'payable': 'مستحق الدفع',
          'continue': 'يكمل',
          'cart': 'عربة التسوق',
          'quantity_updated': 'تم تحديث الكمية',
          'allowed_max_5_qua': 'الحد الأقصى المسموح به 5 كمية',
          'checkout': 'الدفع',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          // --History/Orders--
          // --Countries--
          'choose_country': 'اختر الدولة',
          'egypt': 'مصر',
          'ksa': 'المملكة العربية السعودية',
          'quatar': 'دولة قطر',
          'uae': 'الإمارات العربية المتحدة',
          'bahrain': 'البحرين',
          'oman': 'سلطنة عمان',
          'kuwait': 'الكويت',
          'germany': 'ألمانيا',
          'france': 'فرنسا',
          // --Home View--
          'search': 'بحث',
          'share': 'يشارك',
          'wishlist': 'قائمة الرغبات',
          'view_cart_item': 'عرض عنصر عربة التسوق',
          'loading_data': 'تحميل البيانات...',
          'new_arrival_products': 'منتجات قادمة جديدة',
          'trending_products': 'تتجه المنتجات',
          'best_sellers': 'أفضل البائعين',
          'popular_products': 'المنتجات الشعبية',
          'new_category': 'فئة جديدة',
          'category_based_on_profile': 'فئة بناء على ملف التعريف الخاص بك',
          'add_to_cart': 'أضف إلى السلة',
          'added_to': ' مضاف إلى',
          'removed_from': ' تمت إزالته من',
          'already': 'بالفعل',
          'list_item': 'قائمة الاغراض',
          'grid_item': 'عنصر الشبكة',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          '': '',
          // --Category View--
          // --Product View--
          // --Account View--
          'notification': 'تنبيه',
          'profile': 'الملف الشخصي',
          'order': 'ترتيب',
          'shipping_address': 'عنوان الشحن',
          'blog': 'ب',
          'offer': 'يعرض',
          'faq': 'التعليمات',
          'logout': 'تسجيل خروج',
          'version': 'إصدار',
          'loggedin_via': 'تم تسجيل الدخول عبر',
          '': '',
        },
      };
}
