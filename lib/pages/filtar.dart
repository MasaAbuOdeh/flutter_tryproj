import 'package:flutter/material.dart';
import 'package:flutter_try/pages/HLprice.dart';
import 'package:flutter_try/pages/LHprice.dart';
import 'package:flutter_try/pages/Nablushalls.dart';
import 'package:flutter_try/pages/Tulkaremhalls.dart';
class NavDrawer extends StatelessWidget {
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
                              builder: (_) => HLprice()
                            ),
                          )},
          ),
          ListTile(
            leading: Icon(Icons.arrow_downward),
            title: Text('Low to High'),
            onTap: () => {Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => LHprice()
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
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.arrow_downward),
            title: Text('Low to High'),
            onTap: () => {Navigator.of(context).pop()},
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
                              builder: (_) => Nablushalls()
                            ),
                          );

            },
          ),
          ListTile(
            leading:  const Icon((Icons.location_city)),
            title: const Text('Ramallah'),

            onTap: (){

            },
          ),
          ListTile(
            leading:  const Icon((Icons.location_city)),
            title: const Text('Tulkarm'),

            onTap: (){
              Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => Tulkaremhalls()
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