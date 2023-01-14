import 'package:flutter/material.dart';
import 'package:flutter_try/pages/HLprice.dart';
import 'package:flutter_try/pages/Hlpriceband.dart';
import 'package:flutter_try/pages/LHprice.dart';
import 'package:flutter_try/pages/LHpriceband.dart';
import 'package:flutter_try/pages/Nablushalls.dart';
import 'package:flutter_try/pages/Ramallahhalls.dart';
import 'package:flutter_try/pages/Tulkaremhalls.dart';
import 'package:flutter_try/pages/bandnablus.dart';
import 'package:flutter_try/pages/bandramallah.dart';
import 'package:flutter_try/pages/bandrateh.dart';
import 'package:flutter_try/pages/bandratel.dart';
import 'package:flutter_try/pages/bandtulkarem.dart';
import 'package:flutter_try/pages/hallbigrate.dart';
import 'package:flutter_try/pages/hallsmallrate.dart';
class NavDrawerband extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Page"),
        backgroundColor: Color.fromARGB(235, 216, 171, 82),
      ),
      body :Drawer(
      
      
      child: ListView(


        padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(height: 20,),
    const Divider(color: Colors.black,height: 10,),
          ListTile(

            leading: Icon(Icons.money),
            title: Text('Price'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.arrow_upward),
            title: Text('High to Low'),
            onTap: () => {Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => HLpriceband()
                            ),
                          )},
          ),
          ListTile(
            leading: Icon(Icons.arrow_downward),
            title: Text('Low to High'),
            onTap: () => {Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => LHpriceband()
                            ),
                          )},
          ),
          const Divider(color: Colors.black,
          height: 15,),
          ListTile(
            leading: Icon(Icons.star_rate_rounded),
            title: Text('Rating'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.arrow_upward),
            title: Text('High to Low'),
            onTap: () => {Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => bandbigrate()
                            ),
                          )},
          ),
          ListTile(
            leading: Icon(Icons.arrow_downward),
            title: Text('Low to High'),
            onTap: () => {Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => bandlowrate()
                            ),
                          )},
          ),
          const Divider(color: Colors.black,height: 15,),
          ListTile(
            leading:  const Icon((Icons.location_on_outlined)),
            title: const Text('City'),
            onTap: (){

            },
          ),
          ListTile(
            leading:  const Icon((Icons.location_city)),
            title: const Text('Nablus'),

            onTap: (){
              Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Nablusband()
                            ),
                          );

            },
          ),
          ListTile(
            leading:  const Icon((Icons.location_city)),
            title: const Text('Ramallah'),

            onTap: (){
              Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Ramband()
                            ),
                          );

            },
          ),
          ListTile(
            leading:  const Icon((Icons.location_city)),
            title: const Text('Tulkarem'),

            onTap: (){
              Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => tulband()
                            ),
                          );


            },
          ),
          const Divider(color: Colors.black,),
        ],
      ),
    )
    );
  }
}