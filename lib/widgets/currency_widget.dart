import 'package:flutter/material.dart';
import 'package:lesson26/models/currency_model.dart';

class CurrencyWidget extends StatefulWidget {
  List<CurrencyModel> futures;
  
  CurrencyWidget({ Key? key, required this.futures }) : super(key: key);

  @override
  _CurrencyWidgetState createState() => _CurrencyWidgetState();
}

class _CurrencyWidgetState extends State<CurrencyWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i){
        return ListTile(
              leading: CircleAvatar(
                child: Text(widget.futures[i].code!)
              ),
              title: Text(widget.futures[i].title!),
              subtitle: Text(widget.futures[i].cbPrice! + " so'm"),
              trailing: Icon(
                  Icons.account_balance),
            );
          },
          itemCount: widget.futures.length,
        );
  }
}