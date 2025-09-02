import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;
class HtmlSearchView extends StatefulWidget {
  const HtmlSearchView({super.key});

  @override
  State<HtmlSearchView> createState() => _HtmlSearchViewState();
}

class _HtmlSearchViewState extends State<HtmlSearchView> {
  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final content =
      """ <p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Research suggests that when a child is named in any setting, be it a classroom or a community, they feel a sense of belonging; that they matter enough to be named. Consequently, they feel more invested in the lesson.</span>
</p>
<figure class="image">
    <img style="aspect-ratio:170/233;" src="/storage/upload/image/rich_text_content/IMGUID-0f3bc441-cb74-479a-b343-08121ef8e992-fb98d5ea-d805-4d2f-a144-940d83e53f2c.png" alt="Picture 1.png" width="170" height="233">
</figure>
<p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">If you are teaching children between the ages of 6-11, you may start with ‘The Hello Song’. This positive, rhythmic song ensures that every child in the class is included in the lesson to come.</span><br>
    <br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;"><strong>MATERIALS NEEDED</strong></span>
</p>
<ul>
    <li>
        <span style="color:#0B5393;font-family:Nunito;font-size:14pt;">The Hello Song, which you may access or screen share from here</span><span style="color:#0b5393;font-family:nunito;font-size:14pt;">: </span><a href="/goto-resource/534?showErrorInBlade=true"><span style="color:#9A00FF;font-family:Nunito;font-size:14pt;"><strong>The Hello Song</strong></span></a>
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">A printout on recycled paper of ways in which to say hello in different languages which may be accessed from here: </span><a href="/goto-resource/533?showErrorInBlade=true"><span style="color:#9A00FF;font-family:nunito;font-size:14pt;"><strong><u>So Many Ways To Say Hello!</u></strong></span></a>&nbsp;
    </li>
</ul>
<p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;"><strong>PROCESS</strong></span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Perform the following:</span>
</p>
<ul>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Before starting this activity, ask the children to pick one of the many ways in which they can say hello from the list.</span><br>
        &nbsp;
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">If possible, sit with the children in a big circle facing each other known as a sharing circle, a great way to share experiences or personal stories. This may not always be easy because of time or space constraints. However, if possible, it can be a powerful method of sharing.&nbsp;</span><br>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;"><mark class="marker-pink"><strong>NOTE:</strong></mark><strong> </strong>What is the purpose of a sharing circle? In a typical classroom set-up, when a child stands up to share a story or an experience, more often than not, the other children are looking at the back of the child. In a sharing circle, there is no front or back row, the children have equitable seating. Everyone looks at the child who is sharing, creating a sense of community and intimacy. Eye contact shows respect for the thoughts, stories, and experiences being shared. This is uninterrupted time in which a child feels a sense of comfort and may share openly while others respectfully listen.</span><br>
        &nbsp;
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Play “The Hello Song” off your device (connected to a speaker, if possible) and sing along.&nbsp;</span><br>
        &nbsp;
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Once the children have sung the song, go around the sharing circle saying hello to each child using the ‘hello’ they chose from the list. As an example, if a child says namaste, the rest of the children should say “namaste, <i><u>name of the child</u></i>.” If another child says hola, the rest of the children should say “hola, <i><u>name of the child</u></i>.”</span>
    </li>
</ul>
<p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">After singing The Hello Song, you may list out the greetings that were used in the song and explain which parts of the world these greetings are from.&nbsp;</span><br>
    <br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">This is best done on a map where the children can plot each country. Here is an example:&nbsp;</span>
</p>
<p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;"><img src="/storage/upload/image/rich_text_content/IMGUID-7af2db92-916c-4f8c-9429-0f1bb6aad6da-5a7f12c6-97d0-4e01-816c-31371036688c.png" alt="Screenshot 2024-08-26 at 12.59.16 PM.png" width="2226" height="1532"></span><br>
    &nbsp;
</p>
<p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Hi, Hello - Canada, The USA, The UK</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Hello is probably the most widely used greeting in the world. Even in countries where English is not the first language, the word ‘hello’ is understood and used.</span><br>
    <br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Hola - Spain&nbsp;</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Ni Hao - China</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Jambo - Africa</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Bonjour - France</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Privet - Russia</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Ciao - Italy</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Yassou - Greece</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Salaam - Arabian countries</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Namaste - India</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Hej - Sweden</span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Hei - Norwegian&nbsp;</span>
</p>
<figure class="image">
    <img style="aspect-ratio:152/204;" src="/storage/upload/image/rich_text_content/IMGUID-815f5cb7-aaee-4142-bf1d-0f2a0898cf0b-33040063-c86c-4a5e-bbf8-7f8520f498f9.png" alt="Picture 1.png" width="152" height="204">
</figure>
<p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">If you are teaching children between the ages of 12 -16, or should you prefer to do this over the The Hello Song, you and the children will create an Affirmation Sharing Circle.&nbsp;</span>
</p>
<p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">What is an affirmation?</span>
</p>
<p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">A short, positive statement that is designed to be frequently repeated in order to enforce positive thinking. Affirmations can help overcome negative thoughts and motivate us to take action to realise our goals. They can also change our thinking, bringing positivity into our lives and help increase our self-confidence. By repeating positive statements about our abilities and potential, we strengthen connections associated with these beliefs, leading to greater confidence, resilience, and success. Affirmations serve as a powerful tool for cultivating a more optimistic mindset.</span>
</p>
<p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;"><strong>PROCESS</strong></span><br>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Perform the following</span>
</p>
<ul>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Put up a list of affirmations on a classroom wall. Examples may be printed from here: </span><a href="/goto-resource/535"><span style="color:#9A00FF;font-family:nunito;font-size:14pt;"><strong><u>Affirmations</u></strong></span></a><span style="color:#0b5393;font-family:nunito;font-size:14pt;">. The children may even come up with their own affirmations.&nbsp;</span><br>
        &nbsp;
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Ask the children to choose an affirmation from the list. They should think about why they chose a particular affirmation and what it means to them.</span><br>
        &nbsp;
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Ask the children to sit in a big sharing circle facing each other and tell each child to recite their affirmation.&nbsp;</span><br>
        &nbsp;
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Once a child has recited their affirmation, the rest of the children will say, ‘Hello, (name of child)”.</span><br>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">For example - Sara says, “I am confident”. The rest of the children will say, “Hello Sara”.</span><br>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Maya says, “I am enough”. The rest of the children will say, “Hello Maya”.</span><br>
        &nbsp;
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">This will continue till all the children in the circle have recited their affirmation and have been greeted by name, by their classmates.&nbsp;</span><br>
        &nbsp;
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">Ask the children to remember the affirmation they chose because they will repeat this affirmation for one month during every Rangeet lesson.</span>
    </li>
</ul>
<p>
    <span style="color:#0b5393;font-family:nunito;font-size:14pt;">You may explain to the children that in order for affirmations to be effective, they should be repeated on a daily basis for up to a month. The reason for this is that it takes around a week for the brain to calibrate or adjust and encode these affirmations into our systems. Once encoded, repeating them reinforces them. With this in mind, you will ask the children to continue this exercise of saying affirmations on a daily basis since Rangeet lessons don’t necessarily take place everyday.&nbsp;</span>
</p>
<ul>
    <li>
        <span style="color:#0B5393;font-family:nunito;font-size:14pt;">At home they should write down up to 5 affirmations that reflect positive thoughts that resonate with them. They make take them from the list you put up in the classroom or they may come up with their own. However, one of the five affirmations should include the one they chose at the beginning of this activity. The key is to come up with short affirmations that are easy to remember and repeat. Here’s a template for an </span><a href="/goto-resource/786?showErrorInBlade=true"><span style="color:#9A00FF;font-family:nunito;font-size:14pt;"><strong><u>Affirmation Card</u></strong></span></a><span style="color:#0B5393;font-family:nunito;font-size:14pt;"> which you may print and share with the children to write down five affirmations or they may design their own.&nbsp;</span><br>
        &nbsp;
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">They should schedule a time, either at the beginning of their day or at bedtime when they will repeat these affirmations for a month.</span><br>
        &nbsp;
    </li>
    <li>
        <span style="color:#0b5393;font-family:nunito;font-size:14pt;">After a month, they can choose to change all five affirmations or retain some and add in a few. These must then be repeated for a month. One of these will be shared during the Rangeet lessons.&nbsp;</span>
    </li>
</ul> """;
  String searchTerm = "";
  int activeMatchIndex = 0;
  List<GlobalKey> blockKeys = [];
  List<String> blocks = [];
  List<MatchInfo> allMatchesText = [];

  @override
  void initState() {
    super.initState();
    parseBlocks();
  }

  void parseBlocks() {
    final regex = RegExp(
      r"<(p|h[1-6]|div|li|blockquote|figure)[^>]*>.*?</\1>|<img[^>]*>",
      dotAll: true,
      caseSensitive: false,
    );
    blocks = regex.allMatches(content).map((m) => m.group(0) ?? "").toList();
    blockKeys = List.generate(blocks.length, (_) => GlobalKey());
  }
  // void parseBlocks() {
  //   final regex = RegExp(
  //     r"<(p|h[1-6]|div|ul|ol|li|blockquote)[^>]*>.*?</\1>|<img[^>]*>",
  //     dotAll: true,
  //     caseSensitive: false,
  //   );
  //   blocks = regex.allMatches(content).map((m) => m.group(0) ?? "").toList();
  //   print(blocks);
  //   blockKeys = List.generate(blocks.length, (_) => GlobalKey());
  //   print("BlockKeys: ${List.from(blockKeys)}");
  // }

  void onSearchChanged(String value) {
    searchTerm = value.trim();
    activeMatchIndex = 0;

    findAllMatches();
  }
  void findAllMatches() {
    allMatchesText.clear();
    if (searchTerm.isEmpty) {
      setState(() {});
      return;
    }

    final regex = RegExp(RegExp.escape(searchTerm), caseSensitive: false);

    for (int i = 0; i < blocks.length; i++) {
      final doc = html_parser.parseFragment(blocks[i]);
      final text = doc.text; // pure text
      final matches = regex.allMatches(text ?? "");
      for (final _ in matches) {
        allMatchesText.add(MatchInfo(blockIndex: i, start: 0, end: 0));
      }
    }

    if (allMatchesText.isNotEmpty) scrollToActive();
    setState(() {});
  }


  // void findAllMatches() {
  //   allMatchesText.clear();
  //   if (searchTerm.isEmpty) {
  //     setState(() {});
  //     return;
  //   }
  //
  //   for (int i = 0; i < blocks.length; i++) {
  //     final blockText =
  //         RegExp(
  //           r"<p>(.*?)</p>|"
  //           r"<h1>(.*?)</h1>|"
  //           r"<h2>(.*?)</h2>|"
  //           r"<h3>(.*?)</h3>|"
  //           r"<div>(.*?)</div>|"
  //           r"<span>(.*?)</span>|"
  //           r"<li>(.*?)</li>|"
  //           r"<strong>(.*?)</strong>|"
  //           r"<em>(.*?)</em>",
  //           dotAll: true,
  //           caseSensitive: false,
  //         )
  //             .firstMatch(blocks[i])
  //             ?.groups([1, 2, 3, 4, 5, 6, 7, 8, 9])
  //             .whereType<String>()
  //             .join(" ") ??
  //             "";
  //     // final blockText =
  //     //     RegExp(
  //     //           r"<p>(.*?)</p>|<h1>(.*?)</h1>",
  //     //           dotAll: true,
  //     //           caseSensitive: false,
  //     //         )
  //     //         .firstMatch(blocks[i])
  //     //         ?.groups([1, 2])
  //     //         .whereType<String>()
  //     //         .join(" ") ??
  //     //     "";
  //
  //     final regex = RegExp(RegExp.escape(searchTerm), caseSensitive: false);
  //     for (final m in regex.allMatches(blockText)) {
  //       allMatchesText.add(MatchInfo(blockIndex: i, start: m.start, end: m.end));
  //     }
  //   }
  //
  //   if (allMatchesText.isNotEmpty) scrollToActive();
  //   setState(() {});
  // }

  void nextMatch() {
    if (allMatchesText.isEmpty) return;
    activeMatchIndex = (activeMatchIndex + 1) % allMatchesText.length;
    print("NextActiveMatchIndex : $activeMatchIndex");
    scrollToActive();
    setState(() {});
  }

  void prevMatch() {
    if (allMatchesText.isEmpty) return;
    activeMatchIndex =
        (activeMatchIndex - 1 + allMatchesText.length) % allMatchesText.length;
    print("PrevActiveMatchIndex : $activeMatchIndex");
    scrollToActive();
    setState(() {});
  }

  void scrollToActive() {
    if (allMatchesText.isEmpty) return;
    final key = blockKeys[allMatchesText[activeMatchIndex].blockIndex];
    print("Key: ${key.currentContext}");
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

  String highlightBlock(String html, int blockIndex) {
    if (html.trimLeft().toLowerCase().startsWith("<img")) return html;
    if (searchTerm.isEmpty) return html;

    final frag = html_parser.parseFragment(html);
    final regex = RegExp(RegExp.escape(searchTerm), caseSensitive: false);

    // global index track
    int globalIndex = 0;
    for (int i = 0; i < blockIndex; i++) {
      globalIndex += allMatchesText.where((m) => m.blockIndex == i).length;
    }

    void visit(dom.Node node) {
      final children = List<dom.Node>.from(node.nodes);
      for (final child in children) {
        if (child is dom.Text) {
          final text = child.text;
          final matches = regex.allMatches(text).toList();
          if (matches.isEmpty) continue;

          final parent = child.parent;
          int cursor = 0;

          for (final m in matches) {
            if (m.start > cursor) {
              parent!.insertBefore(dom.Text(text.substring(cursor, m.start)), child);
            }

            final isActive = (globalIndex == activeMatchIndex);
            final span = dom.Element.tag('span')
              ..attributes['style'] =
                  'background-color:${isActive ? 'red' : 'yellow'};';
            span.append(dom.Text(text.substring(m.start, m.end)));
            parent!.insertBefore(span, child);

            cursor = m.end;
            globalIndex++;
          }

          if (cursor < text.length) {
            parent!.insertBefore(dom.Text(text.substring(cursor)), child);
          }

          child.remove();
        } else {
          visit(child);
        }
      }
    }

    for (final n in frag.nodes.toList()) {
      visit(n);
    }

    return frag.outerHtml;
  }


  //
  // String highlightBlock(String html, int blockIndex) {
  //   // ✅ If it's an <img>, don't modify, just return
  //   if (html.trimLeft().toLowerCase().startsWith("<img")) {
  //     return html;
  //   }
  //
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

  void clearSearch() {
    searchController.clear();
    searchTerm = "";
    activeMatchIndex = 0;
    allMatchesText.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(List.from(blocks));
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

  MatchInfo({required this.blockIndex, required this.start, required this.end});
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
