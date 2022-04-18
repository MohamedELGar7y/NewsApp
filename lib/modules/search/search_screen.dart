import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatefulWidget {


  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state)
      {
        var list =NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormFailed(
                  controller: searchController,
                  type: TextInputType.text,
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return'Search Must Be Empty';
                    }
                  },
                  label: 'Search',
                  prefix: Icons.search,
                ),
              ),
              Expanded(
                child:
                articleBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
