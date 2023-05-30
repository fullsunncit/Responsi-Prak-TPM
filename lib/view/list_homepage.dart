import '../controller/api_data_source.dart';
import 'package:responsi_123200001/model/homepage.dart';
import 'package:flutter/material.dart';
import 'package:responsi_123200001/view/detail_page.dart';
import 'package:responsi_123200001/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListHomepage extends StatefulWidget {
  const ListHomepage({Key? key}) : super(key: key);
  @override
  State<ListHomepage> createState() => _ListHomepageState();
}

class _ListHomepageState extends State<ListHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildListUsersBody(),
    );
  }

  Widget _buildListUsersBody() {
    return Container(
      child: FutureBuilder(
        future: ApiDataSource.instance.loadHomePage(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            // Jika data ada dan berhasil maka akan ditampilkan hasil datanya
            HomePage homePageModel = HomePage.fromJson(snapshot.data as Map<String, dynamic>);
            return _buildSuccessSection(homePageModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(HomePage homePageModel) {
    return ListView.builder(
      itemCount: homePageModel.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemUsers(homePageModel.data![index]);
      },
    );
  }

  Widget _buildItemUsers(Data home) {
    return InkWell(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) => DetailPage(uuid: home.uuid!),
      //     )
      // ),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 300,
              child: IconButton(
                onPressed: () {
                  _validasi();
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(home.displayName ?? ''),
                Text(home.displayName!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _validasi() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure want to logout?"),
          actions: [
            TextButton(
                onPressed: () => _logoutProcess(), child: Text("Yes")),
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("No")),
          ],
        ));
  }

  _logoutProcess() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('status', false);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }
}
