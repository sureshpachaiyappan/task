import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/business_list_bloc.dart';
import 'package:task/bloc/business_list_event.dart';
import 'package:task/bloc/business_list_state.dart';
import 'package:task/screens/Details.dart';
import '../models/business_model.dart';

class BusinessList extends StatefulWidget {
  const BusinessList({super.key});

  @override
  State<BusinessList> createState() => _BusinessListState();
}

class _BusinessListState extends State<BusinessList> {
  final BusinessListBloc _bloc = BusinessListBloc();
  @override
  void initState() {
    super.initState();
    _bloc.add(GetBusinessListEvent());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:Colors.deepPurpleAccent,
        title: Text('Business List',style: TextStyle(color: Colors.white,fontSize: 25),),
      ),
      body: BlocBuilder<BusinessListBloc, BusinessState>(
    bloc: _bloc,
     buildWhen: (preState, currState) =>
     currState is GetBuinessState,
    builder: (BuildContext context, BusinessState state) {
      List<Businesses> list =_bloc.businessList?.businesses??[];
      return _bloc.isLoading
          ? Center(
        child:  CircularProgressIndicator(),
      )
          : ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
         return  Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: SizedBox(
                width: 100,
                child:Image.network(
                  list[index].imageUrl??'',
                  fit: BoxFit.fill,
                )
              ),
              title:  Text(list[index].name??'',style: TextStyle(fontSize: 22),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(list[index].alias??''),
                  Text('${list[index].location.address1??' '},${list[index].location.city}',style: TextStyle(fontSize:16,color: Colors.lightBlue)),
                  Text(list[index].displayPhone??'',style: TextStyle(fontSize:16,color: Colors.deepOrangeAccent)),
                ],
              ),
              onTap: (){
                _bloc.add(BusinessClickEvent(details: list[index]));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Details(detailslist: list[index])),
                );
              },
            ),
          );
        },
      );

    }

      ),
    );
  }
}
