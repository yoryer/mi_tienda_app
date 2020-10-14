import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/featured_products_bloc.dart';
import '../widgets/featured_product_item_widget.dart';

import '../../../../injection_container.dart';

class FeaturedProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _FeaturedProducts();
  }
}

class _FeaturedProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedProductsBloc, FeaturedProductsState>(
      builder: (context, state) {
        if (state is Empty) {
          context.bloc<FeaturedProductsBloc>().add(RetrieveFeaturedProducts());
        }

        if (state is Loading) {
          return CircularProgressIndicator();
        }

        if (state is Loaded) {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: state.products.length,
            mainAxisSpacing: 0.0,
            crossAxisSpacing: 0.0,
            padding: EdgeInsets.zero,
            staggeredTileBuilder: (_) => StaggeredTile.fit(1),
            itemBuilder: (BuildContext context, int index) => FeaturedProductItemWidget(
              product: state.products[index],
            ),
          );
        }

        if (state is Error) {
          return Text(state.message);
        }

        return SizedBox(
          width: 0,
          height: 0,
        );
      },
    );
  }
}
