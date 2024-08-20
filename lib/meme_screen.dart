import 'package:api_practice/meme_fetcher.dart';
import 'package:flutter/material.dart';

class MemeScreen extends StatefulWidget {
  const MemeScreen({super.key});

  @override
  State<MemeScreen> createState() => _MemeScreenState();
}

class _MemeScreenState extends State<MemeScreen> {
  String? memeUrl;

  MemeFetcher memeFetcher = MemeFetcher();
  @override
  void initState() {
    super.initState();
    loadMeme();
  }

  void loadMeme() async {
    try {
      String newMeme = await memeFetcher.fetchMeme();
      setState(() {
        memeUrl = newMeme;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Random Reddit Meme",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.blue,
                height: mq.height * 0.5,
                width: mq.width,
                child: memeUrl != null
                    ? Image.network(memeUrl!)
                    : const Center(
                        child: Text(
                          "Your Meme is Loading....",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
              ),
              SizedBox(
                width: mq.width,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    loadMeme();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  child: const Text(
                    "Next Meme 🤣",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
