// import 'package:flutter/material.dart';
// import '../controller/api_data_source.dart';
// import '../model/detail.dart';
//
// class DetailPage extends StatefulWidget {
//   final String uuid;
//
//   const DetailPage({required this.uuid, Key? key}) : super(key: key);
//
//   @override
//   State<DetailPage> createState() => _DetailPageState();
// }
//
// class _DetailPageState extends State<DetailPage> {
//   late Future<DetailPage> _futureDetailPage;
//
//   @override
//   void initState() {
//     super.initState();
//     _futureDetailPage = ApiDataSource.instance.loadDetail(widget.uuid).then((json) => FilmDetail.fromJson(json));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Detail Film"),
//       ),
//       body: _buildDetailBody(),
//     );
//   }
//
//   Widget _buildDetailBody() {
//     return Center(
//       child: FutureBuilder<DetailPage>(
//         future: _futureDetailPage,
//         builder: (BuildContext context, AsyncSnapshot<DetailPage> snapshot) {
//           if (snapshot.hasError) {
//             return Text("Error");
//           }
//           if (snapshot.hasData) {
//             DetailPage detailModel = snapshot.data!;
//             return Column(
//               children: [
//                 SizedBox(height: 15.0),
//                 Container(
//                   width: 150.0,
//                   height: 200.0,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     border: Border.all(color: Colors.grey.shade300),
//                   ),
//                   child: ClipRRect(
//                     child: Image.network(
//                       detailModel.displayIcon!,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 8.0),
//                 Text(
//                   detailModel.title!,
//                   style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold,),
//                 ),
//                 SizedBox(height: 20.0),
//                 Container(
//                   width: 500,
//                   padding: EdgeInsets.all(25),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }
//           return CircularProgressIndicator();
//         },
//       ),
//     );
//   }
// }