import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class HtmlSearchView extends StatefulWidget {
  const HtmlSearchView({super.key});

  @override
  State<HtmlSearchView> createState() => _HtmlSearchViewState();
}

class _HtmlSearchViewState extends State<HtmlSearchView> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final content = """
  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
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
<img src="https://www.w3schools.com/html/img_chania.jpg" alt="Flowers in Chania" width="460" height="345">
<img src="https://www.w3schools.com/html/img_chania.jpg" alt="Flowers in Chania" width="460" height="345">
<img src="https://www.w3schools.com/html/img_chania.jpg" alt="Flowers in Chania" width="460" height="345">
<img src="https://www.w3schools.com/html/img_chania.jpg" alt="Flowers in Chania" width="460" height="345">
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
  int activeMatchIndex = 0;
  List<GlobalKey> blockKeys = [];
  List<String> blocks = [];
  List<MatchInfo> allMatches = [];

  @override
  void initState() {
    super.initState();
    parseBlocks();
  }

  void parseBlocks() {
    // Split into <p>, <h1>, <img> blocks
    final regex = RegExp(
      r"<(p|h1|img).*?>.*?</\1>|<img.*?>",
      dotAll: true,
      caseSensitive: false,
    );
    blocks = regex.allMatches(content).map((m) => m.group(0) ?? "").toList();
    blockKeys = List.generate(blocks.length, (_) => GlobalKey());
  }

  void onSearchChanged(String value) {
    searchTerm = value.trim();
    activeMatchIndex = 0;
    findAllMatches();
  }

  void findAllMatches() {
    allMatches.clear();
    if (searchTerm.isEmpty) {
      setState(() {});
      return;
    }

    for (int i = 0; i < blocks.length; i++) {
      final blockText =
          RegExp(
                r"<p>(.*?)</p>|<h1>(.*?)</h1>",
                dotAll: true,
                caseSensitive: false,
              )
              .firstMatch(blocks[i])
              ?.groups([1, 2])
              .whereType<String>()
              .join(" ") ??
          "";

      final regex = RegExp(RegExp.escape(searchTerm), caseSensitive: false);
      for (final m in regex.allMatches(blockText)) {
        allMatches.add(MatchInfo
          (blockIndex: i, start: m.start, end: m.end));
      }
    }

    if (allMatches.isNotEmpty) scrollToActive();
    setState(() {});
  }

  void nextMatch() {
    if (allMatches.isEmpty) return;
    activeMatchIndex = (activeMatchIndex + 1) % allMatches.length;
    scrollToActive();
    setState(() {});
  }

  void prevMatch() {
    if (allMatches.isEmpty) return;
    activeMatchIndex =
        (activeMatchIndex - 1 + allMatches.length) % allMatches.length;
    scrollToActive();
    setState(() {});
  }

  void scrollToActive() {
    if (allMatches.isEmpty) return;
    final key = blockKeys[allMatches[activeMatchIndex].blockIndex];
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        alignment: 0.2,
      );
    } else {
      Future.delayed(const Duration(milliseconds: 50), scrollToActive);
    }
  }

  // String highlightBlock(String html, int blockIndex) {
  //   if (searchTerm.isEmpty) return html;
  //
  //   final text =
  //       RegExp(
  //         r"<(p|h1)>(.*?)</\1>",
  //         dotAll: true,
  //         caseSensitive: false,
  //       ).firstMatch(html)?.group(2) ??
  //       "";
  //
  //   final buffer = StringBuffer();
  //   int lastIndex = 0;
  //
  //   final blockMatches = allMatches
  //       .where((m) => m.blockIndex == blockIndex)
  //       .toList();
  //   for (int i = 0; i < blockMatches.length; i++) {
  //     final m = blockMatches[i];
  //     buffer.write(text.substring(lastIndex, m.start));
  //     bool isActiveMatch = allMatches[activeMatchIndex] == m;
  //     buffer.write(
  //       '<span style="background-color:${isActiveMatch ? 'red' : 'yellow'};">${text.substring(m.start, m.end)}</span>',
  //     );
  //     lastIndex = m.end;
  //   }
  //   buffer.write(text.substring(lastIndex));
  //   return "<p>${buffer.toString()}</p>";
  // }
  String highlightBlock(String html, int blockIndex) {
    // ✅ If it's an <img>, don't modify, just return
    if (html.trimLeft().toLowerCase().startsWith("<img")) {
      return html;
    }

    if (searchTerm.isEmpty) return html;

    final text = RegExp(r"<(p|h1)>(.*?)</\1>", dotAll: true, caseSensitive: false)
        .firstMatch(html)
        ?.group(2) ??
        "";

    final buffer = StringBuffer();
    int lastIndex = 0;

    final blockMatches =
    allMatches.where((m) => m.blockIndex == blockIndex).toList();
    for (int i = 0; i < blockMatches.length; i++) {
      final m = blockMatches[i];
      buffer.write(text.substring(lastIndex, m.start));
      bool isActiveMatch = allMatches[activeMatchIndex] == m;
      buffer.write(
        '<span style="background-color:${isActiveMatch ? 'red' : 'yellow'};">${text.substring(m.start, m.end)}</span>',
      );
      lastIndex = m.end;
    }
    buffer.write(text.substring(lastIndex));
    return "<p>${buffer.toString()}</p>";
  }

  void clearSearch() {
    searchController.clear();
    searchTerm = "";
    activeMatchIndex = 0;
    allMatches.clear();
    setState(() {});
  }

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
          IconButton(
            icon: const Icon(Icons.navigate_before),
            onPressed: prevMatch,
          ),
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: nextMatch,
          ),
          IconButton(icon: const Icon(Icons.clear), onPressed: clearSearch),
        ],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(blocks.length, (index) {
            final html = highlightBlock(blocks[index], index);
            return Container(
              key: blockKeys[index],
              margin: const EdgeInsets.only(bottom: 12),
              child: HtmlWidget(html),
            );
          }),
        ),
      ),
    );
  }
}

class MatchInfo {
  final int blockIndex;
  final int start;
  final int end;

  MatchInfo({
    required this.blockIndex,
    required this.start,
    required this.end,
  });
}

// class HtmlSearchView extends StatefulWidget {
//   const HtmlSearchView({super.key});
//
//   @override
//   State<HtmlSearchView> createState() => _HtmlSearchViewState();
// }
//
// class _HtmlSearchViewState extends State<HtmlSearchView> {
//   final TextEditingController searchController = TextEditingController();
//   final ScrollController scrollController = ScrollController();
//
//   final content = """
//   <!DOCTYPE html>
// <html lang="en">
// <head>
//   <meta charset="UTF-8">
// </head>
// <body>
//   <h1>Big HTML Content</h1>
//
//   <p>
//     Flutter is an open-source UI software development kit created by Google.
//     It allows developers to create cross-platform applications with a single codebase
//     for Android, iOS, Windows, Linux, macOS, and even web. The framework provides
//     widgets, rendering engine, and tools that help build modern apps faster.
//   </p>
//
//   <p>
//     Dart is the programming language behind Flutter. It supports object-oriented
//     programming, async/await for asynchronous tasks, isolates for concurrency, and
//     strong typing. Dart is optimized for client-side development and compiles to both
//     native code and JavaScript.
//   </p>
//
//   <p>
//     State management is a key concept in Flutter development. Popular solutions
//     include Provider, Riverpod, GetX, and BLoC. Each approach has its own strengths
//     and trade-offs depending on application complexity and developer preference.
//   </p>
//
//   <p>
//     Networking in Flutter is commonly done using HTTP, Dio, or WebSockets.
//     Developers use REST APIs, GraphQL endpoints, or Firebase Cloud Firestore.
//     Realtime communication can be handled using WebSockets or socket.io integrations.
//   </p>
//
//   <p>
//     Firebase integration is very popular in Flutter projects. It provides
//     authentication, Firestore, storage, hosting, analytics, and cloud functions.
//     Many startups and small teams adopt Firebase for rapid app development.
//   </p>
//
//   <p>
//     Algorithms and data structures play an important role in performance.
//     Examples include binary search, hash maps, tries, graphs, trees, and dynamic
//     programming. Developers often prepare for coding interviews by practicing
//     algorithmic problems in C++ or Java.
//   </p>
//
//   <p>
//     Continuous integration (CI/CD) pipelines ensure reliable deployment of apps.
//     Tools like GitHub Actions, GitLab CI, and Bitrise can be configured to run tests,
//     build APKs or IPAs, and push them to app stores automatically.
//   </p>
//
//   <p>
//     User interface design in Flutter relies on widgets. Everything is a widget:
//     rows, columns, text, images, and buttons. Flutter’s hot reload makes UI
//     experimentation very efficient for developers.
//   </p>
//
//   <p>
//     Performance optimization involves profiling your app, reducing unnecessary
//     rebuilds, using const constructors, caching images, and minimizing overdraw.
//     Flutter’s DevTools help analyze frame rendering and memory usage.
//   </p>
//
//   <p>
//     Security is critical. Common practices include HTTPS requests, certificate
//     pinning, JWT tokens for authentication, and proper data encryption.
//     Storing sensitive information in secure storage plugins is also recommended.
//   </p>
// <img src="https://www.w3schools.com/html/img_chania.jpg" alt="Flowers in Chania" width="460" height="345">
// <img src="https://www.w3schools.com/html/img_chania.jpg" alt="Flowers in Chania" width="460" height="345">
// <img src="https://www.w3schools.com/html/img_chania.jpg" alt="Flowers in Chania" width="460" height="345">
// <img src="https://www.w3schools.com/html/img_chania.jpg" alt="Flowers in Chania" width="460" height="345">
//   <p>
//     Some apps require multimedia support. Flutter can handle images, audio, and
//     video playback using plugins like video_player, chewie, or better_player.
//     Live streaming can be implemented with HLS or DASH protocols.
//   </p>
//
//   <p>
//     Localization and internationalization are important for global reach.
//     Flutter supports localization with the intl package, allowing developers
//     to support multiple languages, date formats, and right-to-left scripts.
//   </p>
//
//   <p>
//     Testing ensures code quality. Unit tests check business logic, widget tests
//     validate UI behavior, and integration tests verify app flows. Flutter’s
//     testing framework is built-in and integrates with CI/CD pipelines.
//   </p>
//
//   <p>
//     কিছু বাংলা কনটেন্ট যোগ করা হলো। এটি ব্যবহার করে আপনি সার্চ সিস্টেমে ইউনিকোড
//     পরীক্ষা করতে পারবেন। বাংলা ভাষার সমর্থন একটি মোবাইল অ্যাপকে আরো বেশি
//     ব্যবহারবান্ধব করে তোলে।
//   </p>
//
//   <p>
//     This is the final paragraph in this demo file. It combines Flutter keywords,
//     programming languages like C++, Java, and Kotlin, and technologies such as
//     Docker, Kubernetes, and microservices — all in one place to test searching.
//   </p>
//
// </body>
// </html>
//
//
//   """;
//
//   String searchTerm = "";
//   int activeIndex = 0;
//   List<GlobalKey> blockKeys = [];
//   List<int> matchBlockIndexes = [];
//   List<String> blocks = [];
//
//   @override
//   void initState() {
//     super.initState();
//     parseBlocks();
//   }
//
//   void parseBlocks() {
//     // Split into <p>, <h1>, <img> blocks
//     final regex = RegExp(
//       r"<(p|h1|img).*?>.*?</\1>|<img.*?>",
//       dotAll: true,
//       caseSensitive: false,
//     );
//     blocks = regex.allMatches(content).map((m) => m.group(0) ?? "").toList();
//     blockKeys = List.generate(blocks.length, (_) => GlobalKey());
//   }
//
//   void onSearchChanged(String value) {
//     searchTerm = value.trim();
//     activeIndex = 0;
//     searchMatches();
//   }
//
//   void searchMatches() {
//     matchBlockIndexes.clear();
//     if (searchTerm.isEmpty) {
//       setState(() {});
//       return;
//     }
//
//     for (int i = 0; i < blocks.length; i++) {
//       final textOnly =
//           RegExp(
//                 r"<p>(.*?)</p>|<h1>(.*?)</h1>",
//                 dotAll: true,
//                 caseSensitive: false,
//               )
//               .firstMatch(blocks[i])
//               ?.groups([1, 2])
//               .whereType<String>()
//               .join(" ") ??
//           "";
//       if (textOnly.toLowerCase().contains(searchTerm.toLowerCase())) {
//         matchBlockIndexes.add(i);
//       }
//     }
//
//     if (matchBlockIndexes.isNotEmpty) scrollToActive();
//
//     setState(() {});
//   }
//
//   void nextMatch() {
//     if (matchBlockIndexes.isEmpty) return;
//     activeIndex = (activeIndex + 1) % matchBlockIndexes.length;
//     scrollToActive();
//     setState(() {});
//   }
//
//   void prevMatch() {
//     if (matchBlockIndexes.isEmpty) return;
//     activeIndex =
//         (activeIndex - 1 + matchBlockIndexes.length) % matchBlockIndexes.length;
//     scrollToActive();
//     setState(() {});
//   }
//
//   void scrollToActive() {
//     if (matchBlockIndexes.isEmpty) return;
//     final key = blockKeys[matchBlockIndexes[activeIndex]];
//     final context = key.currentContext;
//     if (context != null) {
//       Scrollable.ensureVisible(
//         context,
//         duration: const Duration(milliseconds: 400),
//         curve: Curves.easeInOut,
//         alignment: 0.2,
//       );
//     } else {
//       Future.delayed(const Duration(milliseconds: 50), scrollToActive);
//     }
//   }
//
//   String highlightBlock(String html, int blockIndex) {
//     if (searchTerm.isEmpty) return html;
//
//     return html.replaceAllMapped(
//       RegExp(r'(<(p|h1)>(.*?)</\2>)', dotAll: true, caseSensitive: false),
//       (match) {
//         String innerText = match.group(3) ?? "";
//         final regex = RegExp(RegExp.escape(searchTerm), caseSensitive: false);
//
//         final matches = regex.allMatches(innerText).toList();
//         if (matches.isEmpty) return match.group(0)!;
//
//         StringBuffer sb = StringBuffer();
//         int lastIndex = 0;
//
//         for (int i = 0; i < matches.length; i++) {
//           final m = matches[i];
//           sb.write(innerText.substring(lastIndex, m.start));
//
//           bool isActiveMatch =
//               matchBlockIndexes.isNotEmpty &&
//               blockIndex == matchBlockIndexes[activeIndex] &&
//               i == activeIndexInBlock(blockIndex);
//
//           sb.write(
//             '<span style="background-color:${isActiveMatch ? 'red' : 'yellow'};">${m[0]}</span>',
//           );
//           lastIndex = m.end;
//         }
//
//         sb.write(innerText.substring(lastIndex));
//         return "<${match.group(2)}>${sb.toString()}</${match.group(2)}>";
//       },
//     );
//   }
//
//   // Helper: determine which match in block is currently active
//   int activeIndexInBlock(int blockIndex) {
//     // Count number of matches before this block to find local active index
//     int localIndex = 0;
//     for (int i = 0; i < blockIndex; i++) {
//       if (matchBlockIndexes.contains(i)) {
//         localIndex += 1;
//       }
//     }
//     return activeIndex - localIndex;
//   }
//
//   void clearSearch() {
//     searchController.clear();
//     searchTerm = "";
//     activeIndex = 0;
//     matchBlockIndexes.clear();
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("objectobject");
//     return Scaffold(
//       appBar: AppBar(
//         title: TextField(
//           controller: searchController,
//           decoration: const InputDecoration(
//             hintText: "Search…",
//             border: InputBorder.none,
//           ),
//           onChanged: onSearchChanged,
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
//           IconButton(icon: const Icon(Icons.clear), onPressed: clearSearch),
//         ],
//       ),
//       body: SingleChildScrollView(
//         controller: scrollController,
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: List.generate(blocks.length, (index) {
//             final isActive =
//                 matchBlockIndexes.isNotEmpty &&
//                 matchBlockIndexes[activeIndex] == index;
//             final html = highlightBlock(blocks[index], index);
//             return Container(
//               key: blockKeys[index],
//               margin: const EdgeInsets.only(bottom: 12),
//               child: HtmlWidget(html),
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
