import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/business_list_bloc.dart';
import '../bloc/business_list_state.dart';
import '../models/business_model.dart';

class Details extends StatefulWidget {
  final Businesses detailslist;
  const Details({Key? key, required this.detailslist}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final BusinessListBloc _bloc = BusinessListBloc();
 late Businesses? business;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    business = widget.detailslist;
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessListBloc, BusinessState>(
        bloc: _bloc,
        buildWhen: (preState, currState) => currState is BuinessDetailsState,
        builder: (BuildContext context, BusinessState state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor:Colors.deepPurpleAccent,
              title: Text(business?.name ??'',style: TextStyle(color: Colors.white),),
            ),
            body:  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.network(business?.imageUrl??''),
                    SizedBox(height: 10),
                    Table(
                      border: TableBorder.all(color: Colors.black, width: 1),
                      children: [
                        TableRow(children: [
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(business?.name??''),
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(business!.isClosed ? 'Closed' : 'Open', style: TextStyle(color: business!.isClosed ? Colors.red : Colors.green)),
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Rating', style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('${business?.rating??''}'),
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Price', style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(business?.price??''),
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Review Count', style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('${business?.reviewCount??''}'),
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Categories', style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(business!.categories.map((c) => c.title).join(', ')),
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Address', style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(business!.location.displayAddress.join(', ')),
                          )),
                        ]),
                        TableRow(children: [
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Phone', style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                          TableCell(child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(business?.displayPhone??''),
                          )),
                        ]),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.deepPurple, // This sets the text color
                      ),
                      onPressed: () async {

                      },
                      child: Text('View Demo'),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
