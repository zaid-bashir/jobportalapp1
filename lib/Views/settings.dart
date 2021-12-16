import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatefulWidget {
  const  Settings({Key key}) : super(key: key);


  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon:const Icon(Icons.arrow_back),color: Colors.black,),
              title: Text('Settings',style: const TextStyle(color:Colors.black,fontSize: 18, fontWeight:FontWeight.bold)),

            ),
              const SizedBox(
                height: 25.0,
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  const [
                 ListTile(

                  leading: Icon(Icons.manage_accounts_outlined,color: Color(0xff3e61ed)),
                  title: Text('Account preferences',style: TextStyle(
    color: Colors.black87,fontWeight:FontWeight.bold,
    fontSize: 14.0,
    ),),

                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Options for managing your account and experince\non Portal',style:
                    TextStyle(fontSize: 11.0, color: Colors.grey)),
                  ),
                ),
                 Divider(color: Colors.grey,height: 10,thickness: 0.5,),
                 ListTile(

                  leading: Icon(Icons.visibility_outlined,color: Color(0xff3e61ed)),
                  title: Text('Visibility',style: TextStyle(
    color: Colors.black87,fontWeight:FontWeight.bold,
    fontSize: 14.0,
    ),),

                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Manage who sees your information and activity',style:
                    TextStyle(fontSize: 11.0, color: Colors.grey)),
                  ),
                ),
                Divider(color: Colors.grey,height: 10,thickness: 0.5,),
                 ListTile(

                  leading: Icon(Icons.lock_outlined,color: Color(0xff3e61ed)),
                  title: Text('sign in and security',style: TextStyle(
    color: Colors.black87,fontWeight:FontWeight.bold,
    fontSize: 14.0,
    ),),

                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Controls and options for signing in and keeping your account\nsecure',style:
                    TextStyle(fontSize: 11.0, color: Colors.grey)),
                  ),
                ),
                Divider(color: Colors.grey,height: 10,thickness: 0.5,),
                ListTile(

                  leading: Icon(Icons.contact_mail_outlined,color: Color(0xff3e61ed)),
                  title: Text('Communications',style: TextStyle(
                    color: Colors.black87,fontWeight:FontWeight.bold,
                    fontSize: 14.0,
                  ),),

                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Controls for emails,invites and notifications',style:
                    TextStyle(fontSize: 11.0, color: Colors.grey)),
                  ),
                ),
                Divider(color: Colors.grey,height: 10,thickness: 0.5,),
                ListTile(

                  leading: Icon(Icons.add_moderator_outlined,color: Color(0xff3e61ed)),
                  title: Text('Data Privacy',style: TextStyle(
                    color: Colors.black87,fontWeight:FontWeight.bold,
                    fontSize: 14.0,
                  ),),

                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Control how Portal uses your information for general site\nuse and job seeking ',style:
                    TextStyle(fontSize: 11.0, color: Colors.grey)),
                  ),
                ),
                Divider(color: Colors.grey,height: 10,thickness: 0.5,),
                ListTile(

                  leading: Icon(Icons.feed_outlined,color: Color(0xff3e61ed)),
                  title: Text('Broadcasting Data',style: TextStyle(
                    color: Colors.black87,fontWeight:FontWeight.bold,
                    fontSize: 14.0,
                  ),),

                  subtitle: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Handles how Portal uses your information to serve you ads',style:
                    TextStyle(fontSize: 11.0, color: Colors.grey)),
                  ),
                ),
                Divider(color: Colors.grey,height: 10,thickness: 0.5,indent: 40,endIndent: 40,),
                SizedBox(height: 15),
                Text('Help Center',style: TextStyle(color: Color(0xff3e61ed),fontSize: 12),),


                SizedBox(height: 18),
                Text('Privacy Policy',style: TextStyle(color: Color(0xff3e61ed),fontSize: 12)),
                SizedBox(height: 18),
                Text('Accessibility',style: TextStyle(color: Color(0xff3e61ed),fontSize: 12)),
                SizedBox(height: 18),
                Text('User Agreement',style: TextStyle(color: Color(0xff3e61ed),fontSize: 12)),
                SizedBox(height: 18),
                Text('End User License Agreement',style: TextStyle(color: Color(0xff3e61ed),fontSize: 12))
              ],
            )

          ],
        ),
      ),
    );
  }
}
