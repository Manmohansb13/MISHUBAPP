import 'package:flutter/material.dart';

import '../search_subjects/subjects.dart';
import '../subject_page/subject_page_file.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Subject> subjects=allSubjects;


  //Search subject
  void searchSubject(String query){
    final suggestions=allSubjects.where((subject){
      final subjectTitle=subject.title.toLowerCase();
      final input=query.toLowerCase();
      return subjectTitle.contains(input);
    }).toList();
    setState(() {
      subjects=suggestions;
    });
  }



  final _searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Browse"),
      ),
      body: Column(
        children: [
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        textCapitalization: TextCapitalization.words,
        controller: _searchController,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "Search Subjects",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blue),
            )
        ),
        onChanged: searchSubject,
      ),
    ),
          Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder:(context,index){
                  final subject=subjects[index];
                  return ListTile(
                    onTap: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          //Route to subject Page
                            builder: (context)=>SubjectPage(subject: subject,)
                        )
                    ),
                    title: Text(subject.title),
                    trailing: Icon(Icons.arrow_forward_ios),
                  );
                },
              )
          ),
        ],
      ),
    );

  }
}
