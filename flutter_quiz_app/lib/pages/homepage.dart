import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_quiz_app/models/categories.dart';
import 'package:flutter_quiz_app/widgets/quiz_options.dart';

class HomePage extends StatelessWidget {
  final List<Color> tileColors = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.lightBlue,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.brown
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              height: 200,
            ),
          ),
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Text(
                    'Select a category to start the quiz.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 1000
                        ? 7
                        : MediaQuery.of(context).size.width > 600
                            ? 5
                            : 3,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10
                  ),
                  delegate: SliverChildBuilderDelegate(
                    _buildCategoryItem,
                    childCount: categories.length,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, int index) {
    Category category = categories[index];
    return MaterialButton(
      elevation: 1,
      highlightElevation: 1,
      onPressed: () => _categoryPressed(context, category),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey.shade800,
      textColor: Colors.white70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if(category.icon != null) Icon(category.icon),
          if(category.icon != null) SizedBox(height: 5,),
          AutoSizeText(
            category.name,
            minFontSize: 10,
            textAlign: TextAlign.center,
            maxLines: 3,
            wrapWords: false,
          ),
        ],
      ),
    );
  }

  _categoryPressed(BuildContext context, Category category) {
    showModalBottomSheet(
      context: context,
      builder: (sheetContext) => BottomSheet(
        builder: (_) => QuizOptionsDialog(
          category: category,
        ),
        onClosing: () {},
      )
    );
  }
}
