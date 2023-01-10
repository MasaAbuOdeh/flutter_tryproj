import 'package:flutter/material.dart';
import 'package:flutter_try/pages/welcome_page.dart';
import 'package:flutter_try/providers/user_provider.dart';
import 'package:flutter_try/providers/worker_provider.dart';
import 'package:flutter_try/widget/ResponsiveButton.dart';
import 'package:provider/provider.dart';

class after_signin_wrkr extends StatefulWidget {
  const after_signin_wrkr({super.key});

  @override
  State<after_signin_wrkr> createState() => _after_signin_wrkrState();
}

class _after_signin_wrkrState extends State<after_signin_wrkr> {
  @override
  Widget build(BuildContext context) {
    final worker = Provider.of<WorkerProvider>(context).worker;

    // TODO: implement build
    return Container(
            width:double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image:NetworkImage(
                  "https://i.pinimg.com/564x/54/fd/c8/54fdc841892c90d3a10361955e1e3d90.jpg"
                ), fit:BoxFit.cover)
                ),
                
                child: Container(
                  margin: const EdgeInsets.only(top: 600, left: 20, right: 20),
                  child: Row(
                    children: [
                       ClipRRect(
        borderRadius:BorderRadius.circular(20),
        
        
       child: Column(
        children: [
          ElevatedButton(
          child:  Text('get started',style: TextStyle(fontSize: 25,color: Colors.white),) ,
          style: ElevatedButton.styleFrom(primary: Colors.black87),
          
        
          onPressed: (){
            if(worker.statu=='activate'){
              Navigator.of(context).pushNamed('letgo');Colors.red[200];
            }
            else {print(worker.statu);
            
            showModalBottomSheet(context: context, builder:(builder) {
                return Container(
                  height: 70,
                  color: Colors.white,
                  child: Text('sorry but you are not allowed now to start , you should wait for admin approve',textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                  
                );
              });
            }
            }),
            SizedBox(height: 10,),
            
        ElevatedButton(
          child:  Text('exit',style: TextStyle(fontSize: 25,color: Colors.white),) ,
          style: ElevatedButton.styleFrom(primary: Colors.black87),
          
        
          onPressed: (){
             Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>WelcomePage()));

            }),

        ],
       ),
        
                       )
                               
                    ]
                    )
                    )

                );
  
  }

}