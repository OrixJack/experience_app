import 'package:experience_app/core/local_storage.dart';
import 'package:experience_app/features/create_prototype/data/models/product_model.dart';
import 'package:experience_app/features/create_prototype/presentation/views/cart_view.dart';
import 'package:experience_app/features/create_prototype/presentation/views/crud_products_view.dart';
import 'package:experience_app/features/create_prototype/presentation/views/ecommerce_dashboard_view.dart';
import 'package:experience_app/features/create_prototype/presentation/views/payment_view.dart';
import 'package:experience_app/features/users/presentation/views/login_view.dart';
import 'package:experience_app/features/create_prototype/presentation/views/personalize_experience.dart';
import 'package:experience_app/features/create_prototype/presentation/views/product_details_view.dart';
import 'package:experience_app/features/create_prototype/presentation/views/sales_history_view.dart';
import 'package:go_router/go_router.dart';

final localStorage = LocalStorage();

final router = GoRouter(
  redirect: (context, state) async {
    final session = await localStorage.getSession();
    final isLoggedIn = session != null;
    final isLoginRoute = state.matchedLocation == '/';

    if (isLoggedIn && isLoginRoute) {
      return '/ecommerce_dashboard';
    }

    if (!isLoggedIn && !isLoginRoute) {
      return '/';
    }

    return null;
  },
  routes: [
    GoRoute(
      name: Routes.login,
      path: '/',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      name: Routes.personalizeExperience,
      path: '/personalize_experience',
      builder: (context, state) => const PersonalizeExperience(),
    ),
    GoRoute(
      name: Routes.ecommerceDashboard,
      path: '/ecommerce_dashboard',
      builder: (context, state) => const EcommerceDashboardView(),
    ),
    GoRoute(
      name: Routes.productDetails,
      path: '/product_details',
      builder: (context, state) {
        final product = state.extra as ProductModel?;
        return ProductDetailsView(product: product);
      },
    ),
    GoRoute(
      name: Routes.cart,
      path: '/cart',
      builder: (context, state) {
        return const CartView();
      },
    ),
    GoRoute(
      name: Routes.payment,
      path: '/payment',
      builder: (context, state) {
        return const PaymentView();
      },
    ),
    GoRoute(
      name: Routes.crudProducts,
      path: '/crud_products',
      builder: (context, state) {
        return const CrudProductsView();
      },
    ),
    GoRoute(
      name: Routes.salesHistory,
      path: '/sales_history',
      builder: (context, state) {
        return const SalesHistoryView('success');
      },
    ),
    GoRoute(
      name: Routes.salesHistoryFailed,
      path: '/sales_history_failed',
      builder: (context, state) {
        return const SalesHistoryView('failed');
      },
    ),
  ],
);

abstract class Routes {
  static const String createPrototype = 'create_prototype';
  static const String personalizeExperience = 'personalize_experience';
  static const String ecommerceDashboard = 'ecommerce_dashboard';
  static const String productDetails = 'product_details';
  static const String cart = 'cart';
  static const String payment = 'payment';
  static const String login = 'login';
  static const String validateLogin = 'validate_login';
  static const String crudProducts = 'crud_products';
  static const String salesHistory = 'sales_history';
  static const String salesHistoryFailed = 'sales_history_failed';
}
