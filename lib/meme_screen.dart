import 'package:api_practice/meme_model.dart';
import 'package:flutter/material.dart';

class MemeScreen extends StatefulWidget {
  const MemeScreen({super.key});

  @override
  _MemeScreenState createState() => _MemeScreenState();
}

class _MemeScreenState extends State<MemeScreen> {
  late Future<Meme> futureMeme;
  final MemeFetcher memeFetcher = MemeFetcher();

  @override
  void initState() {
    super.initState();
    futureMeme = memeFetcher.fetchMeme();
  }

  void _reloadMeme() {
    setState(() {
      futureMeme = memeFetcher.fetchMeme();
    });
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rndom Reddit Memes'),
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
        elevation: 5,
        shadowColor: const Color.fromARGB(197, 0, 0, 0),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: FutureBuilder<Meme>(
              future: futureMeme,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  Meme? meme = snapshot.data;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (meme != null) ...[
                        Text(
                          "Subreddit : ${meme.subreddit}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(meme.title),
                        const SizedBox(height: 8),
                        Image.network(meme.url),
                        const SizedBox(height: 16),
                      ],
                      const SizedBox(height: 24),
                      SizedBox(
                        width: mq.width,
                        height: 50,
                        
                        child: ElevatedButton(
                          onPressed: _reloadMeme,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow[200],
                            elevation: 0,
                          ),
                          child: const Text(
                            "Next Meme 🤣",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Text('No meme data available');
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
