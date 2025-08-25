import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class SearchableHtmlPage extends StatefulWidget {
  const SearchableHtmlPage({super.key});

  @override
  State<SearchableHtmlPage> createState() => _SearchableHtmlPageState();
}

class _SearchableHtmlPageState extends State<SearchableHtmlPage> {
  InAppWebViewController? webViewController;
  final TextEditingController searchController = TextEditingController();
  bool _loaded = false;


  final String content = """
  <div id="content">
    <h1>Big HTML Content</h1>
    <p>Flutter is an open-source UI software development kit created by Google.</p>
    <p>Flutter is an open-source UI software development kit created by Google.</p>
    <p>Flutter is an open-source UI software development kit created by Google.</p>
    <p>Flutter is an open-source UI software development kit created by Google.</p>
    <p>Flutter is an open-source UI software development kit created by Google.</p>
    <p>Flutter is an open-source UI software development kit created by Google.</p>
    <p>Dart is the programming language behind Flutter. এটি object-oriented, async/await support করে এবং concurrency এর জন্য isolates ব্যবহার করা যায়।</p>
    <p>State management is a key concept in Flutter development. Popular solutions include Provider, Riverpod, GetX, and BLoC.</p>
    <p>Firebase integration is very popular in Flutter projects.</p>
  </div>
  """;

  Future<void> _runJS(String body, [Map<String, dynamic> args = const {}]) async {
    if (webViewController == null || !_loaded) return;
    await webViewController!.callAsyncJavaScript(
      functionBody: body,
      arguments: args,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: TextField(
          controller: searchController,
          decoration: const InputDecoration(
            hintText: "Search…",
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 12),
          ),
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            if (value.isNotEmpty) {
              _runJS("highlightSearch('${value.replaceAll("'", r"\'")}');");
            }
          },
        ),
        actions: [
          IconButton(
              tooltip: "Previous",
              icon: const Icon(Icons.navigate_before),
              onPressed: () => _runJS("prevMatch();")),
          IconButton(
              tooltip: "Next",
              icon: const Icon(Icons.navigate_next),
              onPressed: () => _runJS("nextMatch();")),
          IconButton(
              tooltip: "Clear",
              icon: const Icon(Icons.clear),
              onPressed: () {
                searchController.clear();
                _runJS("clearHighlights();");
              }),
        ],
      ),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)),
        initialData: InAppWebViewInitialData(
          data: """
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
body { font-family: Arial, sans-serif; padding:16px; line-height:1.6; }
mark { background: yellow; }
mark.active { background: orange; }
</style>
</head>
<body>
$content
<script>
let matches = [];
let currentIndex = 0;

function escapeRegExp(s) {
    return s.replace(/[.*+?^{}()|[\\]\\\\]/g, '\\\\\$&');
}

function clearHighlights() {
  const root = document.getElementById('content');
  if (!root) return;
  const oldMarks = root.querySelectorAll('mark');
  oldMarks.forEach(m => {
    const text = document.createTextNode(m.textContent);
    m.parentNode.replaceChild(text, m);
  });
  root.normalize();
  matches = [];
  currentIndex = 0;
}

function highlightSearch(term) {
  clearHighlights();
  if (!term) return;

  const root = document.getElementById('content');
  if (!root) return;

  const regex = new RegExp(escapeRegExp(term), 'giu');

  const walker = document.createTreeWalker(root, NodeFilter.SHOW_TEXT, null, false);
  let node;
  const textNodes = [];
  while ((node = walker.nextNode())) {
    if (node.nodeValue.trim()) textNodes.push(node);
  }

  textNodes.forEach(n => {
    const frag = document.createDocumentFragment();
    let lastIndex = 0;
    let match;
    while ((match = regex.exec(n.nodeValue)) !== null) {
      frag.appendChild(document.createTextNode(n.nodeValue.slice(lastIndex, match.index)));
      const mk = document.createElement('mark');
      mk.textContent = match[0];
      frag.appendChild(mk);
      lastIndex = match.index + match[0].length;
    }
    frag.appendChild(document.createTextNode(n.nodeValue.slice(lastIndex)));
    n.parentNode.replaceChild(frag, n);
  });

  matches = Array.from(root.querySelectorAll('mark'));
  currentIndex = 0;
  if (matches.length) focusCurrent();
}

function focusCurrent() {
  matches.forEach((m,i)=> m.classList.remove('active'));
  if (!matches.length) return;
  const el = matches[currentIndex];
  el.classList.add('active');
  el.scrollIntoView({behavior:'smooth', block:'center'});
}

function nextMatch() {
  if (!matches.length) return;
  currentIndex = (currentIndex + 1) % matches.length;
  focusCurrent();
}

function prevMatch() {
  if (!matches.length) return;
  currentIndex = (currentIndex - 1 + matches.length) % matches.length;
  focusCurrent();
}
</script>
</body>
</html>
""",
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStop: (controller, url) {
          setState(() => _loaded = true);
        },
      ),
    );
  }
}
