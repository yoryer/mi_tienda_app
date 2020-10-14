import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_products_bloc.dart';
import '../widgets/search_product_item_widget.dart';

class SearchProductsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(12, 12, 12, 12),
      child: Column(
        children: [
          _SearchQueryInput(),
          SizedBox(height: 24),
          Expanded(
            child: BlocBuilder<SearchProductsBloc, SearchProductsState>(
              builder: (context, state) {
                if (state is Empty) {
                  return Text('Utilice el campo de arriba para empezar a buscar un producto');
                }

                if (state is Loading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is Loaded) {
                  return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) => SearchProductItemWidget(
                      product: state.products[index],
                    ),
                  );
                }

                if (state is Error) {
                  return Text(state.message);
                }

                return SizedBox(width: 0, height: 0);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchQueryInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchProductsBloc, SearchProductsState>(
      buildWhen: (previous, current) => previous.props != current.props,
      builder: (context, state) {
        return TextField(
          onChanged: (value) => context.bloc<SearchProductsBloc>().add(SearchQueryChanged(query: value)),
          decoration: InputDecoration(
            labelText: 'Buscar',
          ),
        );
      },
    );
  }
}
