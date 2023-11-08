// import 'package:flutter/material.dart';
// import '../../controller/noteController.dart';
// import 'dialog.dart';
// import 'noteTile.dart';
//
// class searchBar extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(Icons.clear),
//       )
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         //Get.back();
//       },
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Container();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     final isLandScape =
//         MediaQuery.of(context).orientation == Orientation.landscape;
//     final suggestionList = query.isEmpty
//         ? []
//         : [].where(
//             (element) {
//               return (element.title!
//                       .toLowerCase()
//                       .contains(query.toLowerCase())) ||
//                   (element.content!
//                       .toLowerCase()
//                       .contains(query.toLowerCase()));
//             },
//           ).toList();
//
//     return Padding(
//       padding: const EdgeInsets.all(12),
//       child: GridView.builder(
//         itemCount: suggestionList.length,
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onLongPress: () {
//               showDialog(
//                 context: context,
//                 builder: (context) {
//                   return AlertDialogWidget(
//                     contentText: "Are you sure you want to delete my note?",
//                     confirmFunction: () async {
//                       // await _cont.deleteNote(suggestionList[index].id!.toInt());
//                       // Get.back();
//                     },
//                     declineFunction: () {},
//                   );
//                 },
//               );
//             },
//             child: NoteTile(
//               id: suggestionList[index].id!.toInt(),
//               title: suggestionList[index].title.toString(),
//               content: suggestionList[index].content.toString(),
//               datatimeEdited: suggestionList[index].datatimeEdited.toString(),
//               datatimeCreated: suggestionList[index].datatimeCreated.toString(),
//             ),
//           );
//         },
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: isLandScape ? 3 : 2,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//       ),
//     );
//   }
// }
