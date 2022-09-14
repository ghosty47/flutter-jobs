// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:jobs_ui/utils/job_dart.dart';
import 'package:jobs_ui/utils/recent_job_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List jobsForYou = [
    ['Uber', 'UI Designer', 'lib/icons/uber.png', 45],
    ['Google', 'Product Dev', 'lib/icons/google.png', 35],
    ['Apple', 'Tester', 'lib/icons/apple.png', 65],
  ];

   final List recentJobs = [
    ['Nike', 'Mobile Dev', 'lib/icons/nike.png', 55],
    ['Google', 'Cloud Tech', 'lib/icons/google.png', 75],
    ['Apple', 'Advocate', 'lib/icons/apple.png', 45],
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            // appbar
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Container(
                  padding: EdgeInsets.all(8),
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[100],
                  ),
                  child: Image.asset('lib/icons/menu.png')),
            ),
          
            SizedBox(height: 25),
          
            // discover a new path
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Discover a New Path',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          
            SizedBox(height: 25),
          
            //search bar
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 30,
                              child: Image.asset(
                                'lib/icons/search.png',
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search for a job...'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    padding: EdgeInsets.all(12),
                    child: Image.asset('lib/icons/settings.png',
                        color: Colors.white),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
            ),
          
            SizedBox(height: 50),
          
            //for you => job cards
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'For You',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          
            SizedBox(height: 25),
          
            Container(
              height: 160,
              child: ListView.builder(
                itemCount: jobsForYou.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return JobCard(
                    companyName: jobsForYou[index][0],
                    jobTitle: jobsForYou[index][1],
                    logoImagePath: jobsForYou[index][2],
                    hourlyRate: jobsForYou[index][3],
                  );
                },
              ),
            ),
          
            SizedBox(height: 50),
          
            // recently add => tiles
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                'Recently Added',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
        
            SizedBox(height: 20),
          
            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                itemCount: recentJobs.length,
                itemBuilder: (context, index) {
                return RecentJobCard(
                  companyName: recentJobs[index][0],
                  jobTitle: recentJobs[index][1],
                  logoImagePath: recentJobs[index][2],
                  hourlyRate: recentJobs[index][3],
                );
              }),
            ))
          ],
        ),
      ),
    );
  }
}
