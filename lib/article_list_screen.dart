import 'package:bloc_pattern/bloc/article_list_bloc.dart';
import 'package:bloc_pattern/bloc/bloc_provider.dart';
import 'package:bloc_pattern/ui/article_list_item.dart';
import 'package:flutter/material.dart';

import 'data/article.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ArticleListBloc>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Articles')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search ...',
              ),
              onChanged: bloc.searchQuery.add,
            ),
          ),
          Expanded(
            // 3
            child: _buildResults(bloc),
          ),
        ],
      ), 
    );
  }

  Widget _buildResults(ArticleListBloc bloc) {
    // 1
    return StreamBuilder<List<Article>?>(
      stream: bloc.articlesStream,
      builder: (context, snapshot) {
        // 2
        final results = snapshot.data;
        if (results == null) {
          return const Center(child: Text('Loading ...'));
        } else if (results.isEmpty) {
          return const Center(child: Text('No Results'));
        }
        // 3
        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Article> results) {
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final article = results[index];
        return InkWell(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // 1
            child: ArticleListItem(article: article),
          ),
          // 2
          onTap: () {
            // TODO: Later will be implemented
          },
        );
      },
    );
  }


}
