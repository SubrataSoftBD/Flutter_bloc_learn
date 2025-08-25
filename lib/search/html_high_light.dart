import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlSearchPage extends StatefulWidget {
  const HtmlSearchPage({super.key});

  @override
  State<HtmlSearchPage> createState() => _HtmlSearchPageState();
}

class _HtmlSearchPageState extends State<HtmlSearchPage> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final content = """
  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Searchable HTML</title>
</head>
<body>
  <h1>Big HTML Content</h1>

  <p>
    Flutter is an open-source UI software development kit created by Google.
    It allows developers to create cross-platform applications with a single codebase
    for Android, iOS, Windows, Linux, macOS, and even web. The framework provides 
    widgets, rendering engine, and tools that help build modern apps faster.
  </p>

  <p>
    Dart is the programming language behind Flutter. It supports object-oriented 
    programming, async/await for asynchronous tasks, isolates for concurrency, and 
    strong typing. Dart is optimized for client-side development and compiles to both 
    native code and JavaScript.
  </p>

  <p>
    State management is a key concept in Flutter development. Popular solutions 
    include Provider, Riverpod, GetX, and BLoC. Each approach has its own strengths 
    and trade-offs depending on application complexity and developer preference.
  </p>

  <p>
    Networking in Flutter is commonly done using HTTP, Dio, or WebSockets. 
    Developers use REST APIs, GraphQL endpoints, or Firebase Cloud Firestore. 
    Realtime communication can be handled using WebSockets or socket.io integrations.
  </p>

  <p>
    Firebase integration is very popular in Flutter projects. It provides 
    authentication, Firestore, storage, hosting, analytics, and cloud functions. 
    Many startups and small teams adopt Firebase for rapid app development.
  </p>

  <p>
    Algorithms and data structures play an important role in performance. 
    Examples include binary search, hash maps, tries, graphs, trees, and dynamic 
    programming. Developers often prepare for coding interviews by practicing 
    algorithmic problems in C++ or Java.
  </p>

  <p>
    Continuous integration (CI/CD) pipelines ensure reliable deployment of apps. 
    Tools like GitHub Actions, GitLab CI, and Bitrise can be configured to run tests, 
    build APKs or IPAs, and push them to app stores automatically.
  </p>

  <p>
    User interface design in Flutter relies on widgets. Everything is a widget: 
    rows, columns, text, images, and buttons. Flutter’s hot reload makes UI 
    experimentation very efficient for developers.
  </p>

  <p>
    Performance optimization involves profiling your app, reducing unnecessary 
    rebuilds, using const constructors, caching images, and minimizing overdraw. 
    Flutter’s DevTools help analyze frame rendering and memory usage.
  </p>

  <p>
    Security is critical. Common practices include HTTPS requests, certificate 
    pinning, JWT tokens for authentication, and proper data encryption. 
    Storing sensitive information in secure storage plugins is also recommended.
  </p>

  <p>
    Some apps require multimedia support. Flutter can handle images, audio, and 
    video playback using plugins like video_player, chewie, or better_player. 
    Live streaming can be implemented with HLS or DASH protocols.
  </p>

  <p>
    Localization and internationalization are important for global reach. 
    Flutter supports localization with the intl package, allowing developers 
    to support multiple languages, date formats, and right-to-left scripts.
  </p>

  <p>
    Testing ensures code quality. Unit tests check business logic, widget tests 
    validate UI behavior, and integration tests verify app flows. Flutter’s 
    testing framework is built-in and integrates with CI/CD pipelines.
  </p>

  <p>
    কিছু বাংলা কনটেন্ট যোগ করা হলো। এটি ব্যবহার করে আপনি সার্চ সিস্টেমে ইউনিকোড 
    পরীক্ষা করতে পারবেন। বাংলা ভাষার সমর্থন একটি মোবাইল অ্যাপকে আরো বেশি 
    ব্যবহারবান্ধব করে তোলে।
  </p>

  <p>
    This is the final paragraph in this demo file. It combines Flutter keywords, 
    programming languages like C++, Java, and Kotlin, and technologies such as 
    Docker, Kubernetes, and microservices — all in one place to test searching.
  </p>

</body>
</html>


  """;

  String searchTerm = "";
  List<Map<String, String>> allMatches = []; // {id: match text}
  int activeIndex = 0;
  String htmlData = "";
  List<int> matchIndexes = [];

  @override
  void initState() {
    super.initState();
    htmlData = content;
  }
  void onSearchChanged(String value) {
    searchTerm = value.trim();
    activeIndex = 0;
    highlightMatches();
  }

  void highlightMatches() {
    if (searchTerm.isEmpty) {
      htmlData = content;
      matchIndexes.clear();
      setState(() {});
      return;
    }

    final regex = RegExp(RegExp.escape(searchTerm), caseSensitive: false);
    int matchCounter = 0;

    htmlData = content.replaceAllMapped(regex, (match) {
      final color = matchCounter == activeIndex ? 'red' : 'yellow';
      matchCounter++;
      return '<mark style="background-color:$color;">${match[0]}</mark>';
    });

    matchIndexes = List.generate(matchCounter, (index) => index);

    setState(() {});
  }

  void nextMatch() {
    if (matchIndexes.isEmpty) return;
    activeIndex = (activeIndex + 1) % matchIndexes.length;
    highlightMatches();
    scrollToActive();
  }

  void prevMatch() {
    if (matchIndexes.isEmpty) return;
    activeIndex = (activeIndex - 1 + matchIndexes.length) % matchIndexes.length;
    highlightMatches();
    scrollToActive();
  }

  void scrollToActive() {
    scrollController.animateTo(
      activeIndex * 60.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void clearSearch() {
    searchController.clear();
    searchTerm = "";
    activeIndex = 0;
    htmlData = content;
    matchIndexes.clear();
    setState(() {});
  }


  // void buildHtml() {
  //   if (searchTerm.isEmpty) {
  //     // htmlData = paragraphs.join("<br><br>");
  //     // allMatches.clear();
  //   } else {
  //     int matchCounter = 0;
  //     final regex = RegExp(RegExp.escape(searchTerm), caseSensitive: false);
  //     allMatches.clear();
  //
  //     List<String> processed = content.map((p) {
  //       return p.replaceAllMapped(regex, (m) {
  //         final id = "match$matchCounter";
  //         allMatches.add({"id": id, "text": m[0]!});
  //         final color = matchCounter == activeIndex ? "green" : "yellow";
  //         matchCounter++;
  //         return '<mark style="background-color:$color;">${m[0]}</mark>';
  //       });
  //     }).toList();
  //
  //     htmlData = processed.join("<br><br>");
  //   }
  //   setState(() {});
  // }
  //
  // void nextMatch() {
  //   if (allMatches.isEmpty) return;
  //   activeIndex = (activeIndex + 1) % allMatches.length;
  //   buildHtml();
  //   scrollToActive();
  // }
  //
  // void prevMatch() {
  //   if (allMatches.isEmpty) return;
  //   activeIndex = (activeIndex - 1 + allMatches.length) % allMatches.length;
  //   buildHtml();
  //   scrollToActive();
  // }
  //
  // void scrollToActive() {
  //   // Approximate scroll
  //   scrollController.animateTo(
  //     activeIndex * 50.0, // adjust if needed
  //     duration: const Duration(milliseconds: 300),
  //     curve: Curves.easeInOut,
  //   );
  // }

  // void onSearchChanged(String value) {
  //   searchTerm = value;
  //   activeIndex = 0;
  //   buildHtml();
  // }
  //
  // void clearSearch() {
  //   searchController.clear();
  //   searchTerm = "";
  //   activeIndex = 0;
  //   buildHtml();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: "Search…",
            border: InputBorder.none,
          ),
          onChanged: onSearchChanged,
        ),
        actions: [
          IconButton(icon: const Icon(Icons.navigate_before), onPressed: prevMatch),
          IconButton(icon: const Icon(Icons.navigate_next), onPressed: nextMatch),
          IconButton(icon: const Icon(Icons.clear), onPressed: clearSearch),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        child: Html(
          data: htmlData,
        ),
      ),
    );
  }
}


// class HtmlSearchPage extends StatefulWidget {
//   const HtmlSearchPage({super.key});
//
//   @override
//   State<HtmlSearchPage> createState() => _HtmlSearchPageState();
// }
//
// class _HtmlSearchPageState extends State<HtmlSearchPage> {
//   final TextEditingController searchController = TextEditingController();
//   final ScrollController scrollController = ScrollController();
//
//   final List<String> paragraphs = [
//     "Flutter is an open-source UI software development kit created by Google.",
//     "Flutter is an open-source UI software development kit created by Google.",
//     "Flutter is an open-source UI software development kit created by Google.",
//     "Flutter is an open-source UI software development kit created by Google.",
//     "Flutter is an open-source UI software development kit created by Google.",
//     "Flutter is an open-source UI software development kit created by Google.",
//     "Flutter is an open-source UI software development kit created by Google.",
//     "Flutter is an open-source UI software development kit created by Google.",
//     "Dart is the programming language behind Flutter.",
//     "Some বাংলা content is also here to test Unicode search."
//   ];
//
//   List<String> highlightedParagraphs = [];
//   List<GlobalKey> matchKeys = [];
//   int activeIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     highlightedParagraphs = List.from(paragraphs);
//   }
//
//   void highlightMatches(String term) {
//     matchKeys.clear();
//     activeIndex = 0;
//
//     if (term.isEmpty) {
//       setState(() => highlightedParagraphs = List.from(paragraphs));
//       return;
//     }
//
//     final regex = RegExp(RegExp.escape(term), caseSensitive: false);
//
//     highlightedParagraphs = paragraphs.map((p) {
//       return p.replaceAllMapped(regex, (match) {
//         return "<mark>${match[0]}</mark>";
//       });
//     }).toList();
//
//     setState(() {});
//   }
//
//   void nextMatch() {
//     if (matchKeys.isEmpty) return;
//     activeIndex = (activeIndex + 1) % matchKeys.length;
//     scrollToActive();
//   }
//
//   void prevMatch() {
//     if (matchKeys.isEmpty) return;
//     activeIndex = (activeIndex - 1 + matchKeys.length) % matchKeys.length;
//     scrollToActive();
//   }
//
//   void scrollToActive() {
//     if (activeIndex >= matchKeys.length) return;
//     final context = matchKeys[activeIndex].currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 300),
//         alignment: 0.5,
//       );
//     }
//     setState(() {}); // refresh active highlight
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     matchKeys = [];
//
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: searchController,
//           decoration: const InputDecoration(
//             hintText: "Search…",
//             border: InputBorder.none,
//           ),
//           onChanged: highlightMatches,
//         ),
//         actions: [
//           IconButton(icon: const Icon(Icons.navigate_before), onPressed: prevMatch),
//           IconButton(icon: const Icon(Icons.navigate_next), onPressed: nextMatch),
//           IconButton(
//             icon: const Icon(Icons.clear),
//             onPressed: () {
//               searchController.clear();
//               highlightMatches('');
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         controller: scrollController,
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: highlightedParagraphs.map((p) {
//             final key = GlobalKey();
//             matchKeys.add(key);
//
//             return Html(
//               key: key,
//               data: p,
//               style: {
//                 "mark": Style(
//                   backgroundColor: Colors.yellow,
//                   color: Colors.black,
//
//                 ),
//               },
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

// class HtmlSearchPage extends StatefulWidget {
//   const HtmlSearchPage({super.key});
//
//   @override
//   State<HtmlSearchPage> createState() => _HtmlSearchPageState();
// }
//
// class _HtmlSearchPageState extends State<HtmlSearchPage> {
//   final TextEditingController searchController = TextEditingController();
//
//   final String originalContent = """
// <h1>Big HTML Content</h1>
//
// <p>
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// Flutter is an open-source UI software development kit created by Google.
// It allows developers to create cross-platform applications.
// </p>
//
// <p>
// Dart is the programming language behind Flutter.
// </p>
//
// <p>
// Some বাংলা content is also here to test Unicode search.
// </p>
// """;
//
//   List<GlobalKey> matchKeys = [];
//   List<String> segments = [];
//   int activeIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     segments = [originalContent];
//   }
//
//   // Build highlighted segments
//   void buildSegments(String term) {
//     activeIndex = 0;
//     matchKeys.clear();
//
//     if (term.isEmpty) {
//       setState(() => segments = [originalContent]);
//       return;
//     }
//
//     final regex = RegExp(RegExp.escape(term), caseSensitive: false);
//     final matches = regex.allMatches(originalContent).toList();
//
//     if (matches.isEmpty) {
//       setState(() => segments = [originalContent]);
//       return;
//     }
//
//     List<String> newSegments = [];
//     int lastIndex = 0;
//
//     for (final match in matches) {
//       if (match.start > lastIndex) {
//         newSegments.add(originalContent.substring(lastIndex, match.start));
//       }
//       newSegments.add(originalContent.substring(match.start, match.end));
//       lastIndex = match.end;
//     }
//
//     if (lastIndex < originalContent.length) {
//       newSegments.add(originalContent.substring(lastIndex));
//     }
//
//     setState(() => segments = newSegments);
//   }
//
//   void nextMatch() {
//     if (matchKeys.isEmpty) return;
//     activeIndex = (activeIndex + 1) % matchKeys.length;
//     scrollToActive();
//   }
//
//   void prevMatch() {
//     if (matchKeys.isEmpty) return;
//     activeIndex = (activeIndex - 1 + matchKeys.length) % matchKeys.length;
//     scrollToActive();
//   }
//
//   void scrollToActive() {
//     if (activeIndex >= matchKeys.length) return;
//     final context = matchKeys[activeIndex].currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 300),
//         alignment: 0.5,
//       );
//       setState(() {}); // update active highlight
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // Build keys for matches
//     matchKeys = List.generate(
//         segments.where((s) =>
//         searchController.text.isNotEmpty &&
//             RegExp(RegExp.escape(searchController.text),
//                 caseSensitive: false)
//                 .hasMatch(s))
//             .length,
//             (_) => GlobalKey());
//
//     int matchCounter = 0;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: searchController,
//           decoration: const InputDecoration(
//             hintText: "Search...",
//             border: InputBorder.none,
//           ),
//           onChanged: (value) => buildSegments(value),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.navigate_before),
//             onPressed: prevMatch,
//           ),
//           IconButton(
//             icon: const Icon(Icons.navigate_next),
//             onPressed: nextMatch,
//           ),
//           IconButton(
//             icon: const Icon(Icons.clear),
//             onPressed: () {
//               searchController.clear();
//               buildSegments("");
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: segments.map((segment) {
//             final isMatch = searchController.text.isNotEmpty &&
//                 RegExp(RegExp.escape(searchController.text),
//                     caseSensitive: false)
//                     .hasMatch(segment);
//
//             if (isMatch) {
//               final key = matchKeys[matchCounter];
//               final isActive = matchCounter == activeIndex;
//               matchCounter++;
//               return Container(
//                 width: 50,
//                 key: key,
//                 color: isActive ? Colors.orange : Colors.yellow,
//                 child: Html(data: segment),
//               );
//             } else {
//               return Html(data: segment);
//             }
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
