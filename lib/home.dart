import 'package:facebook_clone/widgets/PostComposer.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/widgets/appBarButton.dart';
import 'package:facebook_clone/topNavBar.dart';
import 'package:facebook_clone/widgets/StoryCard.dart';
import 'package:facebook_clone/widgets/PostCard.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(//widget
          "facebook",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [ // list of widgets inside the
          AppBarButton(
            buttonIcon: Icons.search, //icon(icons.search)
            buttonAction: () {
              print("search screen appears!");
            },
          ),
          AppBarButton(
            buttonIcon: Icons.chat,
            buttonAction: () {
              print("Messenger screen appears!");
            },
          ),
          AppBarButton(
            buttonIcon: Icons.add,
            buttonAction: () {
              print("Create something new!");
            },
          ),
        ],
      ),

      body: ListView(
        children: [
          const TopNavBar(),
          Divider(height: 1, thickness: 0.5, color: Colors.grey[300]),
          SizedBox(height: 15),

          const PostComposer(),
          SizedBox(height: 10),

          Divider(height: 1, thickness: 9, color: Colors.grey[300]),
          SizedBox(height: 15),

          SizedBox(
            height: 300,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                StoryCard(
                  label: "Add to Story",
                  isCreateStory: true,
                  imageUrl: "assets/images/user1.jpg",
                  profileUrl: "",
                ),
                StoryCard(
                  label: "hanna",
                  imageUrl: "assets/images/activity1.jpg",
                  profileUrl: "assets/images/user1.jpg",
                ),
                StoryCard(
                  label: "zehura",
                  imageUrl: "assets/images/act2.jpg",
                  profileUrl: "assets/images/user1.jpg",
                ),
                StoryCard(
                  label: "josh",
                  imageUrl: "assets/images/act3.jpg",
                  profileUrl: "assets/images/user5.jpg",
                ),
                StoryCard(
                  label: "betty",
                  imageUrl: "assets/images/act4.jpg",
                  profileUrl: "assets/images/user3.jpg",
                ),
              ],
            ),
          ),

          SizedBox(height: 15),
          Divider(height: 1, thickness: 9, color: Colors.grey[300]),

          PostCard(
            profileImage: "assets/images/user1.jpg",
            userName: "hannah",
            timeAgo: "2h ago",
            caption: "What a beautiful sunSet!!",
            postImage: "assets/images/activity1.jpg",
          ),

          PostCard(
            profileImage: "assets/images/user1.jpg",
            userName: "betty",
            timeAgo: "2h ago",
            caption: "He is inevitable 🤖",
            postImage: "assets/images/posts.jpg",
          ),
        ],
      ),
    );
  }
}

