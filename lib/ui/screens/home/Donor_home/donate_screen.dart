import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:free_pad/core/respositories.dart/user_repositories.dart';
import 'package:free_pad/ui/responsive_state/responsive_state.dart';
import 'package:provider/provider.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  State<DonateScreen> createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  void initState() {
    
    Future.delayed(Duration.zero,(){
       var profile = Provider.of<UserProvider>(context, listen: false);
    profile.getDOnationRequest();
  });
  }

  @override
  Widget build(BuildContext context) {
    var profile = Provider.of<UserProvider>(context);

    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ResponsiveState(
            state: profile.state,
            busyWidget: Center(
              child: const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(strokeWidth: 6)),
            ),
            idleWidget: ListView(
              children: [
                Text(
                  'Donate',
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 5,),
                Text(
                'Just a bunch of reason why people should help bla bala bal bakajfhd ajadja dadbuwad adbaliduadja aduahedaedad',
                   textAlign: TextAlign.left,     
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 30,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                    itemCount: profile.donationRequest.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage('assets/image/donate.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        title: Text(
                          '${profile.donationRequest.elementAt(index).name}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        subtitle: Text(
                          '${profile.donationRequest.elementAt(index).title}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13,
                          ),
                        ),
                        trailing: MouseRegion(
                cursor: SystemMouseCursors.click,
                          
                          child: Container(
                            height: 30,
                            width: 80,
                            decoration: BoxDecoration(
                                color: Theme.of(context).iconTheme.color,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                'Donate',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            )),
      ),
    );
  }
}
