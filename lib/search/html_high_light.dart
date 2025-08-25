import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

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

  final List<String> paragraphs = [
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Flutter is an open-source UI software development kit created by Google.",
    "Dart is the programming language behind Flutter.",
    "Some বাংলা content is also here to test Unicode search."
  ];

  String searchTerm = "";
  List<Map<String, String>> allMatches = []; // {id: match text}
  int activeIndex = 0;
  String htmlData = "";

  @override
  void initState() {
    super.initState();
    buildHtml();
  }

  void buildHtml() {
    if (searchTerm.isEmpty) {
      htmlData = paragraphs.join("<br><br>");
      allMatches.clear();
    } else {
      int matchCounter = 0;
      final regex = RegExp(RegExp.escape(searchTerm), caseSensitive: false);
      allMatches.clear();

      List<String> processed = paragraphs.map((p) {
        return p.replaceAllMapped(regex, (m) {
          final id = "match$matchCounter";
          allMatches.add({"id": id, "text": m[0]!});
          final color = matchCounter == activeIndex ? "red" : "yellow";
          matchCounter++;
          return '<mark style="background-color:$color;">${m[0]}</mark>';
        });
      }).toList();

      htmlData = processed.join("<br><br>");
    }
    setState(() {});
  }

  void nextMatch() {
    if (allMatches.isEmpty) return;
    activeIndex = (activeIndex + 1) % allMatches.length;
    buildHtml();
    scrollToActive();
  }

  void prevMatch() {
    if (allMatches.isEmpty) return;
    activeIndex = (activeIndex - 1 + allMatches.length) % allMatches.length;
    buildHtml();
    scrollToActive();
  }

  void scrollToActive() {
    // Approximate scroll
    scrollController.animateTo(
      activeIndex * 50.0, // adjust if needed
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onSearchChanged(String value) {
    searchTerm = value;
    activeIndex = 0;
    buildHtml();
  }

  void clearSearch() {
    searchController.clear();
    searchTerm = "";
    activeIndex = 0;
    buildHtml();
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
